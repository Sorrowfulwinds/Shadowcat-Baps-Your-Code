/**
 * Magnetic Guns
 *
 * Not to be confused with /obj/item/gun/projectile/ballistic/magnetic,
 * these guns are generally special and use special ammo,
 * like fuel rods and RCDs. They also **optionally** consume energy to fire,
 * and have an inbuilt capacitor charge system.
 */
/obj/item/gun/projectile/magnetic
	name = "improvised coilgun"
	desc = "A coilgun hastily thrown together out of a basic frame and advanced power storage components. Is it safe for it to be duct-taped together like that?"
	icon_state = "coilgun"
	item_state = "coilgun"
	icon = 'icons/obj/railgun.dmi'
	one_handed_penalty = 15
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4, TECH_ILLEGAL = 2, TECH_MAGNET = 4)
	w_class = WEIGHT_CLASS_BULKY
	cell_system = TRUE

	var/obj/item/stock_parts/capacitor/capacitor        // Installed capacitor. Higher rating == faster charge between shots.
	var/obj/item/stock_parts/manipulator/manipulator    // Installed manipulator. Mostly for Phoron Bore, higher rating == less mats consumed upon firing
	var/removable_components = TRUE                            // Whether or not the gun can be dismantled.
	var/gun_unreliable = 15                                    // Percentage chance of detonating in your hands.

	var/obj/item/loaded                                        // Currently loaded object, for retrieval/unloading.
	var/load_type = /obj/item/stack/rods                       // Type of stack to load with.
	projectile_type = /obj/projectile/bullet/magnetic 	   // Actual fire type, since this isn't throw_at_old rod launcher.

	var/power_cost = 950                                       // Cost per fire, should consume almost an entire basic cell.
	var/power_per_tick                                         // Capacitor charge per process(). Updated based on capacitor rating.

	/// Render battery state.
	///
	/// todo: impl
	///
	/// * Uses MAGNETIC_RENDER_BATTERY_* enums
	var/render_battery_overlay = MAGNETIC_RENDER_BATTERY_NEVER

/obj/item/gun/projectile/magnetic/Initialize(mapload)
	START_PROCESSING(SSobj, src)
	if(capacitor)
		power_per_tick = (power_cost*0.15) * capacitor.rating
	. = ..()
	obj_cell_slot.legacy_use_device_cells = FALSE
	// todo : dont update icon here
	update_icon()

/obj/item/gun/projectile/magnetic/Destroy()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(loaded)
	QDEL_NULL(capacitor)
	. = ..()

/obj/item/gun/projectile/magnetic/process(delta_time)
	if(capacitor)
		if(obj_cell_slot.cell)
			if(capacitor.charge < capacitor.max_charge && obj_cell_slot.cell.checked_use(power_per_tick))
				capacitor.charge(power_per_tick)
		else
			capacitor.use(capacitor.charge * 0.05)
	update_icon()

/obj/item/gun/projectile/magnetic/update_icon()
	var/list/overlays_to_add = list()
	cut_overlays()
	if(removable_components)
		if(obj_cell_slot.cell)
			overlays_to_add += image(icon, "[icon_state]_cell")
		if(capacitor)
			overlays_to_add += image(icon, "[icon_state]_capacitor")
	if(!obj_cell_slot.cell || !capacitor)
		overlays_to_add += image(icon, "[icon_state]_red")
	else if(capacitor.charge < power_cost)
		overlays_to_add += image(icon, "[icon_state]_amber")
	else
		overlays_to_add += image(icon, "[icon_state]_green")
	if(loaded)
		overlays_to_add += image(icon, "[icon_state]_loaded")

	add_overlay(overlays_to_add)
	..()

/obj/item/gun/projectile/magnetic/proc/show_ammo(var/mob/user)
	if(loaded)
		to_chat(user, "<span class='notice'>It has \a [loaded] loaded.</span>")

/obj/item/gun/projectile/magnetic/examine(var/mob/user)
	. = ..()
	show_ammo(user)

	if(obj_cell_slot.cell)
		. += "<span class='notice'>The installed [obj_cell_slot.cell.name] has a charge level of [round((obj_cell_slot.cell.charge/obj_cell_slot.cell.maxcharge)*100)]%.</span>"
	if(capacitor)
		. += "<span class='notice'>The installed [capacitor.name] has a charge level of [round((capacitor.charge/capacitor.max_charge)*100)]%.</span>"

	if(!obj_cell_slot.cell || !capacitor)
		. += "<span class='notice'>The capacitor charge indicator is blinking <font color ='[COLOR_RED]'>red</font>. Maybe you should check the cell or capacitor.</span>"
	else
		if(capacitor.charge < power_cost)
			. += "<span class='notice'>The capacitor charge indicator is <font color ='[COLOR_ORANGE]'>amber</font>.</span>"
		else
			. += "<span class='notice'>The capacitor charge indicator is <font color ='[COLOR_GREEN]'>green</font>.</span>"

/obj/item/gun/projectile/magnetic/attackby(var/obj/item/thing, var/mob/user)
	if(removable_components)
		if(thing.is_screwdriver())
			if(!capacitor)
				to_chat(user, "<span class='warning'>\The [src] has no capacitor installed.</span>")
				return
			user.grab_item_from_interacted_with(capacitor, src)
			user.visible_message("<span class='notice'>\The [user] unscrews \the [capacitor] from \the [src].</span>")
			playsound(src, 'sound/items/Screwdriver.ogg', 50, 1)
			capacitor = null
			update_icon()
			return

		if(istype(thing, /obj/item/stock_parts/capacitor))
			if(capacitor)
				to_chat(user, "<span class='warning'>\The [src] already has \a [capacitor] installed.</span>")
				return
			if(!user.attempt_insert_item_for_installation(thing, src))
				return
			capacitor = thing
			playsound(src, 'sound/machines/click.ogg', 10, 1)
			power_per_tick = (power_cost*0.15) * capacitor.rating
			user.visible_message("<span class='notice'>\The [user] slots \the [capacitor] into \the [src].</span>")
			update_icon()
			return

	if(istype(thing, load_type))

		if(loaded)
			to_chat(user, "<span class='warning'>\The [src] already has \a [loaded] loaded.</span>")
			return

		// This is not strictly necessary for the magnetic gun but something using
		// specific ammo types may exist down the track.
		var/obj/item/stack/ammo = thing
		if(!istype(ammo))
			if(!user.attempt_insert_item_for_installation(thing, src))
				return
			loaded = thing
		else
			loaded = new load_type(src, 1)
			ammo.use(1)

		user.visible_message("<span class='notice'>\The [user] loads \the [src] with \the [loaded].</span>")
		playsound(src, 'sound/weapons/flipblade.ogg', 50, 1)
		update_icon()
		return
	. = ..()

/obj/item/gun/projectile/magnetic/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	if(user.get_inactive_held_item() == src)
		var/obj/item/removing

		if(loaded)
			removing = loaded
			loaded = null

		if(removing)
			removing.forceMove(get_turf(src))
			user.put_in_hands(removing)
			user.visible_message("<span class='notice'>\The [user] removes \the [removing] from \the [src].</span>")
			playsound(src, 'sound/machines/click.ogg', 10, 1)
			update_icon()
			return
	. = ..()

/obj/item/gun/projectile/magnetic/proc/check_ammo()
	return loaded

/obj/item/gun/projectile/magnetic/proc/use_ammo()
	qdel(loaded)
	loaded = null

/obj/item/gun/projectile/magnetic/consume_next_projectile(datum/gun_firing_cycle/cycle)
	if(!check_ammo() || !capacitor || capacitor.charge < power_cost)
		return

	use_ammo()
	capacitor.use(power_cost)
	update_icon()

	if(gun_unreliable && prob(gun_unreliable))
		spawn(3) // So that it will still fire - considered modifying Fire() to return a value but burst fire makes that annoying.
			visible_message("<span class='danger'>\The [src] explodes with the force of the shot!</span>")
			explosion(get_turf(src), -1, 0, 2)
			qdel(src)

	return new projectile_type(src)

/obj/item/gun/projectile/magnetic/fuelrod
	name = "Fuel-Rod Cannon"
	desc = "A bulky weapon designed to fire reactor core fuel rods at absurd velocities... who thought this was a good idea?!"
	description_antag = "This device is capable of firing reactor fuel assemblies, acquired from a R-UST fuel compressor and an appropriate fueltype. Be warned, Supermatter rods may have unforseen consequences."
	description_fluff = "Morpheus' second entry into the arms manufacturing field, the Morpheus B.F.G, or 'Big Fuel-rod Gun' made some noise when it was initially sent to the market. By noise, they mean it was rapidly declared 'incredibly dangerous to the wielder and civilians within a mile radius alike'."
	icon_state = "fuelrodgun"
	item_state = "coilgun"
	icon = 'icons/obj/railgun.dmi'
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4, TECH_PHORON = 4, TECH_ILLEGAL = 5, TECH_MAGNET = 4)
	w_class = WEIGHT_CLASS_BULKY

	removable_components = TRUE
	gun_unreliable = 0

	load_type = /obj/item/fuel_assembly
	projectile_type = /obj/projectile/bullet/magnetic/fuelrod

	power_cost = 500

	cell_type = /obj/item/cell/high

/obj/item/gun/projectile/magnetic/fuelrod/Initialize(mapload)
	capacitor = new /obj/item/stock_parts/capacitor
	return ..()

/obj/item/gun/projectile/magnetic/fuelrod/consume_next_projectile(datum/gun_firing_cycle/cycle)
	if(!check_ammo() || !capacitor || capacitor.charge < power_cost)
		return

	if(loaded) //Safety.
		if(istype(loaded, /obj/item/fuel_assembly))
			var/obj/item/fuel_assembly/rod = loaded
			if(rod.fuel_type == "composite" || rod.fuel_type == "deuterium") //Safety check for rods spawned in without a fueltype.
				projectile_type = /obj/projectile/bullet/magnetic/fuelrod
			else if(rod.fuel_type == "tritium")
				projectile_type = /obj/projectile/bullet/magnetic/fuelrod/tritium
			else if(rod.fuel_type == "phoron")
				projectile_type = /obj/projectile/bullet/magnetic/fuelrod/phoron
			else if(rod.fuel_type == "supermatter")
				projectile_type = /obj/projectile/bullet/magnetic/fuelrod/supermatter
				visible_message("<span class='danger'>The barrel of \the [src] glows a blinding white!</span>")
				spawn(5)
					visible_message("<span class='danger'>\The [src] begins to rattle, its acceleration chamber collapsing in on itself!</span>")
					removable_components = FALSE
					spawn(15)
						audible_message("<span class='critical'>\The [src]'s power supply begins to overload as the device crumples!</span>") //Why are you still holding this?
						playsound(src, 'sound/effects/grillehit.ogg', 10, 1)
						var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread()
						var/turf/T = get_turf(src)
						sparks.set_up(2, 1, T)
						sparks.start()
						spawn(15)
							visible_message("<span class='critical'>\The [src] explodes in a blinding white light!</span>")
							explosion(src.loc, -1, 1, 2, 3)
							qdel(src)
			else
				projectile_type = /obj/projectile/bullet/magnetic/fuelrod

	use_ammo()
	capacitor.use(power_cost)
	update_icon()

	return new projectile_type(src)

//* Object System - Cell *//

/obj/item/gun/projectile/magnetic/object_cell_slot_mutable(mob/user, datum/object_system/cell_slot/slot)
	return removable_components && ..()
