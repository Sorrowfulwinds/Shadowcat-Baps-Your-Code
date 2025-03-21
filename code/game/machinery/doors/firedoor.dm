GLOBAL_LIST_INIT(firelock_align_types, typecacheof(list(
	/obj/structure/window/reinforced/tinted/full,
	/obj/structure/window/reinforced/full,
	/obj/structure/window/phoronreinforced/full,
	/obj/structure/window/phoronbasic/full,
	/obj/structure/window/basic/full,
	/obj/structure/window/reinforced/polarized/full,
	/obj/structure/wall_frame/prepainted/,
	/obj/structure/wall_frame,
	/obj/machinery/door))) //comedy.
/// kPa
#define FIREDOOR_MAX_PRESSURE_DIFF 25
/// °C
#define FIREDOOR_MAX_TEMP 50
#define FIREDOOR_MIN_TEMP 0

// Bitflags
#define FIREDOOR_ALERT_HOT		1
#define FIREDOOR_ALERT_COLD		2
// Not used #define FIREDOOR_ALERT_LOWPRESS 4

/obj/machinery/door/firedoor
	name = "\improper Emergency Shutter"
	desc = "Emergency air-tight shutter, capable of sealing off breached areas."
	icon = 'icons/obj/doors/hazard/door.dmi'
	var/panel_file = 'icons/obj/doors/hazard/panel.dmi'
	var/welded_file = 'icons/obj/doors/hazard/welded.dmi'
	icon_state = "open"
	req_one_access = list(ACCESS_COMMAND_EVA)	//ACCESS_ENGINEERING_ATMOS, ACCESS_ENGINEERING_ENGINE)
	opacity = 0
	density = 0
	layer = DOOR_OPEN_LAYER - 0.01
	open_layer = DOOR_OPEN_LAYER - 0.01// Just below doors when open
	closed_layer = MID_LANDMARK_LAYER // Need this to be above windows/grilles/low walls.
	smoothing_groups = (SMOOTH_GROUP_SHUTTERS_BLASTDOORS)
	heat_resistance = 6000

	//These are frequenly used with windows, so make sure zones can pass.
	//Generally if a firedoor is at a place where there should be a zone boundery then there will be a regular door underneath it.
	block_air_zones = 0

	var/blocked = 0
	var/prying = 0
	var/lockdown = 0 // When the door has detected a problem, it locks.
	var/pdiff_alert = 0
	var/pdiff = 0
	var/nextstate = null
	var/net_id
	var/list/areas_added
	var/list/users_to_open = new
	var/next_process_time = 0
	var/low_profile = FALSE

	power_channel = ENVIRON
	use_power = USE_POWER_IDLE
	idle_power_usage = 5
	autoset_dir = TRUE

	var/list/tile_info[4]
	var/list/dir_alerts[4] // 4 dirs, bitflags

	// MUST be in same order as FIREDOOR_ALERT_*
	var/list/ALERT_STATES=list(
		"hot",
		"cold"
	)

/obj/machinery/door/firedoor/Initialize(mapload, newdir)
	. = ..()
	for(var/obj/machinery/door/firedoor/F in loc)
		if(F != src)
			return INITIALIZE_HINT_QDEL
	var/area/A = get_area(src)
	ASSERT(istype(A))

	LAZYADD(A.all_doors, src)
	areas_added = list(A)

	for(var/direction in GLOB.cardinal)
		A = get_area(get_step(src,direction))
		if(istype(A) && !(A in areas_added))
			LAZYADD(A.all_doors, src)
			areas_added += A

	return INITIALIZE_HINT_LATELOAD

/obj/machinery/door/firedoor/LateInitialize()
	if(autoset_dir)
		for (var/cardinal in GLOB.cardinal)
			var/turf/step_turf = get_step(src, cardinal)
			if (step_turf.density == TRUE)
				switch(cardinal)
					if(EAST)
						setDir(SOUTH)
					if(WEST)
						setDir(SOUTH)
					if(NORTH)
						setDir(WEST)
					if(SOUTH)
						setDir(WEST)
			for(var/atom/thing as anything in step_turf)
				if(thing.type in GLOB.firelock_align_types)
					switch(cardinal)
						if(EAST)
							setDir(SOUTH)
						if(WEST)
							setDir(SOUTH)
						if(NORTH)
							setDir(WEST)
						if(SOUTH)
							setDir(WEST)
					break

/obj/machinery/door/firedoor/Destroy()
	for(var/area/A in areas_added)
		LAZYREMOVE(A.all_doors, src)
	return ..()

/obj/machinery/door/firedoor/examine(mob/user, dist)
	. = ..()
	if(!density)
		return

	if(pdiff >= FIREDOOR_MAX_PRESSURE_DIFF)
		. += "<span class='warning'>WARNING: Current pressure differential is [pdiff]kPa! Opening door may result in injury!</span>"

	. += "<b>Sensor readings:</b>"
	for(var/index = 1; index <= tile_info.len; index++)
		var/o = "&nbsp;&nbsp;"
		switch(index)
			if(1)
				o += "NORTH: "
			if(2)
				o += "SOUTH: "
			if(3)
				o += "EAST: "
			if(4)
				o += "WEST: "
		if(tile_info[index] == null)
			o += "<span class='warning'>DATA UNAVAILABLE</span>"
			to_chat(user, o)
			continue
		var/celsius = convert_k2c(tile_info[index][1])
		var/pressure = tile_info[index][2]
		o += "<span class='[(dir_alerts[index] & (FIREDOOR_ALERT_HOT|FIREDOOR_ALERT_COLD)) ? "warning" : "color:blue"]'>"
		o += "[celsius]&deg;C</span> "
		o += "<span style='color:blue'>"
		o += "[pressure]kPa</span></li>"
		. += o

	if(islist(users_to_open) && users_to_open.len)
		var/users_to_open_string = users_to_open[1]
		if(users_to_open.len >= 2)
			for(var/i = 2 to users_to_open.len)
				users_to_open_string += ", [users_to_open[i]]"
		. += "<span class = 'danger'>These people have opened \the [src] during an alert: [users_to_open_string].</span>"

/obj/machinery/door/firedoor/Bumped(atom/AM)
	if(panel_open || operating)
		return
	if(!density)
		return ..()
	if(istype(AM, /obj/vehicle/sealed/mecha))
		var/obj/vehicle/sealed/mecha/mecha = AM
		if(mecha.occupant_legacy)
			var/mob/M = mecha.occupant_legacy
			if(world.time - M.last_bumped <= 10) return //Can bump-open one airlock per second. This is to prevent popup message spam.
			M.last_bumped = world.time
			attack_hand(M)
	return 0

/obj/machinery/door/firedoor/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	add_fingerprint(user)
	if(operating)
		return//Already doing something.

	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/X = user
		if(istype(X.species, /datum/species/xenos))
			src.attack_alien(user)
			return

	if(blocked)
		to_chat(user, "<span class='warning'>\The [src] is welded solid!</span>")
		return

	var/alarmed = lockdown
	for(var/area/A in areas_added)		//Checks if there are fire alarms in any areas associated with that firedoor
		if(A.firedoors_closed)
			alarmed = 1

	var/answer = alert(user, "Would you like to [density ? "open" : "close"] this [src.name]?[ alarmed && density ? "\nNote that by doing so, you acknowledge any damages from opening this\n[src.name] as being your own fault, and you will be held accountable under the law." : ""]",\
	"\The [src]", "Yes, [density ? "open" : "close"]", "No")
	if(answer == "No")
		return
	if(user.incapacitated() || (get_dist(src, user) > 1 && !issilicon(user)))
		to_chat(user, "Sorry, you must remain able bodied and close to \the [src] in order to use it.")
		return
	if(density && (machine_stat & (BROKEN|NOPOWER))) //can still close without power
		to_chat(user, "\The [src] is not functioning, you'll have to force it open manually.")
		return

	if(alarmed && density && lockdown && !allowed(user))
		to_chat(user, "<span class='warning'>Access denied. Please wait for authorities to arrive, or for the alert to clear.</span>")
		return
	else
		user.visible_message("<span class='notice'>\The [src] [density ? "open" : "close"]s for \the [user].</span>",\
		"\The [src] [density ? "open" : "close"]s.",\
		"You hear a beep, and a door opening.")

	var/needs_to_close = 0
	if(density)
		if(alarmed)
			// Accountability!
			users_to_open |= user.name
			needs_to_close = !issilicon(user)
		spawn()
			open()
	else
		spawn()
			close()

	if(needs_to_close)
		spawn(50)
			alarmed = 0
			for(var/area/A in areas_added)		//Just in case a fire alarm is turned off while the firedoor is going through an autoclose cycle
				if(A.firedoors_closed)
					alarmed = 1
			if(alarmed)
				nextstate = FIREDOOR_CLOSED
				close()

/obj/machinery/door/firedoor/attack_alien(var/mob/user) //Familiar, right? Doors.
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/X = user
		if(istype(X.species, /datum/species/xenos))
			if(src.blocked)
				visible_message("<span class='green'>\The [user] begins digging into \the [src] internals!</span>")
				if(do_after(user,5 SECONDS,src))
					playsound(src.loc, 'sound/machines/airlock_creaking.ogg', 100, 1)
					src.blocked = 0
					update_icon()
					open(1)
			else if(src.density)
				visible_message("<span class='green'>\The [user] begins forcing \the [src] open!</span>")
				if(do_after(user, 2 SECONDS,src))
					playsound(src.loc, 'sound/machines/airlock_creaking.ogg', 100, 1)
					visible_message("<span class='danger'>\The [user] forces \the [src] open!</span>")
					open(1)
			else
				visible_message("<span class='danger'>\The [user] forces \the [src] closed!</span>")
				close(1)
		else
			visible_message("<span class='notice'>\The [user] strains fruitlessly to force \the [src] [density ? "open" : "closed"].</span>")
			return
	..()

/obj/machinery/door/firedoor/attack_generic(var/mob/living/user, var/damage)
	if(machine_stat & (BROKEN|NOPOWER))
		if(damage >= 5)
			var/time_to_force = (2 + (2 * blocked)) * 5
			if(src.density)
				visible_message("<span class='danger'>\The [user] starts forcing \the [src] open!</span>")
				user.set_AI_busy(TRUE) // If the mob doesn't have an AI attached, this won't do anything.
				if(do_after(user, time_to_force, src))
					visible_message("<span class='danger'>\The [user] forces \the [src] open!</span>")
					src.blocked = 0
					open(1)
				user.set_AI_busy(FALSE)
			else
				time_to_force = (time_to_force / 2)
				visible_message("<span class='danger'>\The [user] starts forcing \the [src] closed!</span>")
				user.set_AI_busy(TRUE) // If the mob doesn't have an AI attached, this won't do anything.
				if(do_after(user, time_to_force, src))
					visible_message("<span class='danger'>\The [user] forces \the [src] closed!</span>")
					close(1)
				user.set_AI_busy(FALSE)
		else
			visible_message("<span class='notice'>\The [user] strains fruitlessly to force \the [src] [density ? "open" : "closed"].</span>")
		return
	..()

/obj/machinery/door/firedoor/attackby(obj/item/C as obj, mob/user as mob)
	add_fingerprint(user, 0, C)
	if(istype(C, /obj/item/barrier_tape_roll))
		return //Don't open the door if we're putting tape on it to tell people 'don't open the door'.
	if(operating)
		return//Already doing something.
	if(istype(C, /obj/item/weldingtool) && !repairing)
		if(prying)
			to_chat(user, "<span class='notice'>Someone's busy prying that [density ? "open" : "closed"]!</span>")
		var/obj/item/weldingtool/W = C
		if(W.remove_fuel(0, user))
			blocked = !blocked
			user.visible_message("<span class='danger'>\The [user] [blocked ? "welds" : "unwelds"] \the [src] with \a [W].</span>",\
			"You [blocked ? "weld" : "unweld"] \the [src] with \the [W].",\
			"You hear something being welded.")
			playsound(src, W.tool_sound, 100, 1)
			update_icon()
			return

	if(density && C.is_screwdriver())
		panel_open = !panel_open
		playsound(src, C.tool_sound, 50, 1)
		user.visible_message("<span class='danger'>[user] has [panel_open ? "opened" : "closed"] \the [src] maintenance hatch.</span>",
									"You have [panel_open ? "opened" : "closed"] the [src] maintenance hatch.")
		update_icon()
		return

	if(blocked && C.is_crowbar() && !repairing)
		if(!panel_open)
			to_chat(user, "<span class='danger'>You must open the maintenance hatch first!</span>")
		else
			user.visible_message("<span class='danger'>[user] is removing the electronics from \the [src].</span>",
									"You start to remove the electronics from [src].")
			if(do_after(user,30))
				if(blocked && density && panel_open)
					playsound(src, C.tool_sound, 50, 1)
					user.visible_message("<span class='danger'>[user] has removed the electronics from \the [src].</span>",
										"You have removed the electronics from [src].")

					if (machine_stat & BROKEN)
						new /obj/item/circuitboard/broken(src.loc)
					else
						new/obj/item/circuitboard/airalarm(src.loc)

					var/obj/structure/firedoor_assembly/FA = new/obj/structure/firedoor_assembly(src.loc)
					FA.anchored = 1
					FA.density = 1
					FA.wired = 1
					FA.update_icon()
					qdel(src)
		return

	if(blocked)
		to_chat(user, "<span class='danger'>\The [src] is welded shut!</span>")
		return

	if(C.pry == 1)
		if(operating)
			return

		if(blocked && C.is_crowbar())
			user.visible_message("<span class='danger'>\The [user] pries at \the [src] with \a [C], but \the [src] is welded in place!</span>",\
			"You try to pry \the [src] [density ? "open" : "closed"], but it is welded in place!",\
			"You hear someone struggle and metal straining.")
			return
		if(prying)
			to_chat(user, "<span class='notice'>Someone's already prying that [density ? "open" : "closed"].</span>")
			return

		user.visible_message("<span class='danger'>\The [user] starts to force \the [src] [density ? "open" : "closed"] with \a [C]!</span>",\
				"You start forcing \the [src] [density ? "open" : "closed"] with \the [C]!",\
				"You hear metal strain.")
		prying = 1
		update_icon()
		playsound(src, C.tool_sound, 100, 1)
		if(do_after(user,30 * C.tool_speed))
			if(C.is_crowbar())
				if(machine_stat & (BROKEN|NOPOWER) || !density)
					user.visible_message("<span class='danger'>\The [user] forces \the [src] [density ? "open" : "closed"] with \a [C]!</span>",\
					"You force \the [src] [density ? "open" : "closed"] with \the [C]!",\
					"You hear metal strain, and a door [density ? "open" : "close"].")
			else
				user.visible_message("<span class='danger'>\The [user] forces \the [ blocked ? "welded" : "" ] [src] [density ? "open" : "closed"] with \a [C]!</span>",\
					"You force \the [ blocked ? "welded" : "" ] [src] [density ? "open" : "closed"] with \the [C]!",\
					"You hear metal strain and groan, and a door [density ? "opening" : "closing"].")
			if(density)
				spawn(0)
					open(1)
			else
				spawn(0)
					close()
		prying = 0
		update_icon()
		return

	return ..()

// CHECK PRESSURE
/obj/machinery/door/firedoor/process(delta_time)
	..()

	if(density && next_process_time <= world.time)
		next_process_time = world.time + 100		// 10 second delays between process updates
		var/changed = 0
		lockdown=0
		// Pressure alerts
		pdiff = getOPressureDifferential(src.loc)
		if(pdiff >= FIREDOOR_MAX_PRESSURE_DIFF)
			lockdown = 1
			if(!pdiff_alert)
				pdiff_alert = 1
				changed = 1 // update_icon()
		else
			if(pdiff_alert)
				pdiff_alert = 0
				changed = 1 // update_icon()

		tile_info = getCardinalAirInfo(src.loc,list("temperature","pressure"))
		var/old_alerts = dir_alerts
		for(var/index = 1; index <= 4; index++)
			var/list/tileinfo=tile_info[index]
			if(tileinfo==null)
				continue // Bad data.
			var/celsius = convert_k2c(tileinfo[1])

			var/alerts=0

			// Temperatures
			if(celsius >= FIREDOOR_MAX_TEMP)
				alerts |= FIREDOOR_ALERT_HOT
				lockdown = 1
			else if(celsius <= FIREDOOR_MIN_TEMP)
				alerts |= FIREDOOR_ALERT_COLD
				lockdown = 1

			dir_alerts[index]=alerts

		if(dir_alerts != old_alerts)
			changed = 1
		if(changed)
			update_icon()

/obj/machinery/door/firedoor/proc/latetoggle()
	if(operating || !nextstate)
		return
	switch(nextstate)
		if(FIREDOOR_OPEN)
			nextstate = null

			open()
		if(FIREDOOR_CLOSED)
			nextstate = null
			close()
	return

/obj/machinery/door/firedoor/close()
	latetoggle()
	return ..()

/obj/machinery/door/firedoor/open(var/forced = 0)
	if(panel_open)
		panel_open = 0
		visible_message("The maintenance hatch of \the [src] closes.")
		update_icon()

	if(!forced)
		if(machine_stat & (BROKEN|NOPOWER))
			return //needs power to open unless it was forced
		else
			use_power(360)
	else
		if(usr && usr.ckey)
			log_admin("[usr]([usr.ckey]) has forced open an emergency shutter.")
			message_admins("[usr]([usr.ckey]) has forced open an emergency shutter.")
	latetoggle()
	return ..()

/obj/machinery/door/firedoor/do_animate(animation)
	switch(animation)
		if(DOOR_ANIMATION_OPEN)
			flick("opening", src)
			playsound(src, 'sound/machines/firelockopen.ogg', 37, 1)
		if(DOOR_ANIMATION_CLOSE)
			playsound(src, 'sound/machines/firelockclose.ogg', 37, 1)
			flick("closing", src)
	return


/obj/machinery/door/firedoor/update_icon()
	cut_overlays()
	. = ..()

	set_light(0)
	var/image/lights_overlay
	var/do_set_light = FALSE

	if(density)
		icon_state = "closed"
		if(panel_open)
			add_overlay(panel_file)
		if(pdiff_alert)
			lights_overlay += "palert"
			do_set_light = TRUE
		if(dir_alerts)
			for(var/d=1;d<=4;d++)
				for(var/i=1;i<=ALERT_STATES.len;i++)
					if(dir_alerts[d] & BITFLAG(i-1))
						add_overlay("alert_[ALERT_STATES[i]]")
						do_set_light = TRUE
	else
		if(low_profile)
			icon_state = "open_lowprofile"
		else
			icon_state = "open"

	if(blocked)
		add_overlay(welded_file)

	if(do_set_light)
		set_light(2, 0.25, COLOR_SUN)

/obj/machinery/door/firedoor/border_only
/*
	icon = 'icons/obj/doors/edge_Doorfire.dmi'
	glass = 1 //There is a glass window so you can see through the door
			  //This is needed due to BYOND limitations in controlling visibility
	heat_proof = 1
	air_properties_vary_with_direction = 1

	CanPass(atom/movable/mover, turf/target)
		if(istype(mover) && mover.checkpass(ATOM_PASS_GLASS))
			return 1
		if(get_dir(loc, target) == dir) //Make sure looking at appropriate border
			return !density
		else
			return 1

	CheckExit(atom/movable/mover as mob|obj, turf/target as turf)
		if(istype(mover) && mover.checkpass(ATOM_PASS_GLASS))
			return 1
		if(get_dir(loc, target) == dir)
			return !density
		else
			return 1


	update_nearby_tiles(need_rebuild)
		if(!SSair) return 0

		var/turf/simulated/source = loc
		var/turf/simulated/destination = get_step(source,dir)

		update_heat_protection(loc)

		if(istype(source)) SSair.tiles_to_update += source
		if(istype(destination)) SSair.tiles_to_update += destination
		return 1
*/

/obj/machinery/door/firedoor/border_only/can_pathfinding_exit(atom/movable/actor, dir, datum/pathfinding/search)
	return (src.dir != dir) || ..()

/obj/machinery/door/firedoor/border_only/can_pathfinding_enter(atom/movable/actor, dir, datum/pathfinding/search)
	return (src.dir != dir) || ..()

/obj/machinery/door/firedoor/multi_tile
	icon = 'icons/obj/doors/DoorHazard2x1.dmi'
	width = 2

/obj/machinery/door/firedoor/glass
	name = "\improper Emergency Glass Shutter"
	desc = "Emergency air-tight shutter, capable of sealing off breached areas. This one has a resilient glass window, allowing you to see the danger."
	icon_state = "open"
	glass = 1

