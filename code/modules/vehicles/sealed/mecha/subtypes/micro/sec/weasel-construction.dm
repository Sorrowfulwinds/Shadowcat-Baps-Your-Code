/obj/item/vehicle_chassis/micro/weasel
	name = "Weasel Chassis"
	icon_state = "weasel-chassis"

/obj/item/vehicle_chassis/micro/weasel/New()
	..()
	construct = new /datum/construction/mecha/weasel_chassis(src)

/obj/item/vehicle_part/micro/weasel_torso
	name="Weasel Torso"
	icon_state = "weasel-torso"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 3, TECH_BIO = 3, TECH_ENGINEERING = 3)

/obj/item/vehicle_part/micro/weasel_head
	name="Weasel Head"
	icon_state = "weasel-head"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 3, TECH_MAGNET = 3, TECH_ENGINEERING = 3)

/obj/item/vehicle_part/micro/weasel_left_arm
	name="Weasel Left Arm"
	icon_state = "weasel-arm-left"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 3, TECH_ENGINEERING = 3)

/obj/item/vehicle_part/micro/weasel_right_arm
	name="Weasel Right Arm"
	icon_state = "weasel-arm-right"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 3, TECH_ENGINEERING = 3)

/obj/item/vehicle_part/micro/weasel_tri_leg
	name="Weasel Legs"
	icon_state = "weasel-leg-all"
	origin_tech = list(TECH_DATA = 2, TECH_MATERIAL = 3, TECH_ENGINEERING = 3)

/datum/construction/mecha/weasel_chassis
	steps = list(
		list("key"=/obj/item/vehicle_part/micro/weasel_torso),//1
		list("key"=/obj/item/vehicle_part/micro/weasel_head),//2
		list("key"=/obj/item/vehicle_part/micro/weasel_left_arm),//3
		list("key"=/obj/item/vehicle_part/micro/weasel_right_arm),//4
		list("key"=/obj/item/vehicle_part/micro/weasel_tri_leg),//5
	)

/datum/construction/reversible/mecha/weasel/custom_action(step, atom/used_atom, mob/user)
	user.visible_message("[user] has connected [used_atom] to [holder].", "You connect [used_atom] to [holder]")
	holder.add_overlay("[used_atom.icon_state]+o")
	qdel(used_atom)
	return 1

/datum/construction/reversible/mecha/weasel/action(atom/used_atom, mob/user)
	return check_all_steps(used_atom,user)

/datum/construction/reversible/mecha/weasel/spawn_result()
	var/obj/item/vehicle_chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/weasel(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction_vr.dmi'
	const_holder.icon_state = "weasel0"
	const_holder.density = TRUE
	const_holder.cut_overlays()
	spawn()
		qdel(src)
	return


/datum/construction/reversible/mecha/weasel
	result = "/obj/vehicle/sealed/mecha/micro/sec/weasel"
	steps = list(
		//1
		list("key"=/obj/item/weldingtool,
			"backkey"=IS_WRENCH,
			"desc"="External armor is wrenched."),
		//2
		list("key"=IS_WRENCH,
			"backkey"=IS_CROWBAR,
			"desc"="External armor is installed."),
		//3
		list("key"=/obj/item/stack/material/plasteel,
			"backkey"=/obj/item/weldingtool,
			"desc"="Internal armor is welded."),
		//4
		list("key"=/obj/item/weldingtool,
			"backkey"=IS_WRENCH,
			"desc"="Internal armor is wrenched"),
		//5
		list("key"=IS_WRENCH,
			"backkey"=IS_CROWBAR,
			"desc"="Internal armor is installed"),
		//6
		list("key"=/obj/item/stack/material/steel,
			"backkey"=IS_SCREWDRIVER,
			"desc"="Advanced capacitor is secured"),
		//7
		list("key"=IS_SCREWDRIVER,
			"backkey"=IS_CROWBAR,
			"desc"="Advanced capacitor is installed"),
		//8
		list("key"=/obj/item/stock_parts/capacitor/adv,
			"backkey"=IS_SCREWDRIVER,
			"desc"="Advanced scanner module is secured"),
		//9
		list("key"=IS_SCREWDRIVER,
			"backkey"=IS_CROWBAR,
			"desc"="Advanced scanner module is installed"),
		//10
		list("key"=/obj/item/stock_parts/scanning_module/adv,
			"backkey"=IS_SCREWDRIVER,
			"desc"="Targeting module is secured"),
		//11
		list("key"=IS_SCREWDRIVER,
			"backkey"=IS_CROWBAR,
			"desc"="Targeting module is installed"),
		//12
		list("key"=/obj/item/circuitboard/mecha/weasel/targeting,
			"backkey"=IS_SCREWDRIVER,
			"desc"="Peripherals control module is secured"),
		//13
		list("key"=IS_SCREWDRIVER,
			"backkey"=IS_CROWBAR,
			"desc"="Peripherals control module is installed"),
		//14
		list("key"=/obj/item/circuitboard/mecha/weasel/peripherals,
			"backkey"=IS_SCREWDRIVER,
			"desc"="Central control module is secured"),
		//15
		list("key"=IS_SCREWDRIVER,
			"backkey"=IS_CROWBAR,
			"desc"="Central control module is installed"),
		//16
		list("key"=/obj/item/circuitboard/mecha/weasel/main,
			"backkey"=IS_SCREWDRIVER,
			"desc"="The wiring is adjusted"),
		//17
		list("key"=IS_WIRECUTTER,
			"backkey"=IS_SCREWDRIVER,
			"desc"="The wiring is added"),
		//18
		list("key"=/obj/item/stack/cable_coil,
			"backkey"=IS_SCREWDRIVER,
			"desc"="The hydraulic systems are active."),
		//19
		list("key"=IS_SCREWDRIVER,
			"backkey"=IS_WRENCH,
			"desc"="The hydraulic systems are connected."),
		//20
		list("key"=IS_WRENCH,
			"desc"="The hydraulic systems are disconnected."),
	)


/datum/construction/reversible/mecha/weasel/action(atom/used_atom, mob/user)
		return check_step(used_atom,user)

/datum/construction/reversible/mecha/weasel/custom_action(index, diff, atom/used_atom, mob/user)
	if(!..())
		return FALSE
	//TODO: better messages.
	switch(index)
		if(20)
			user.visible_message("[user] connects [holder] hydraulic systems", "You connect [holder] hydraulic systems.")
			holder.icon_state = "weasel1"
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] activates [holder] hydraulic systems.", "You activate [holder] hydraulic systems.")
				holder.icon_state = "weasel2"
			else
				user.visible_message("[user] disconnects [holder] hydraulic systems", "You disconnect [holder] hydraulic systems.")
				holder.icon_state = "weasel0"
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [holder].", "You add the wiring to [holder].")
				holder.icon_state = "weasel3"
			else
				user.visible_message("[user] deactivates [holder] hydraulic systems.", "You deactivate [holder] hydraulic systems.")
				holder.icon_state = "weasel1"
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [holder].", "You adjust the wiring of [holder].")
				holder.icon_state = "weasel4"
			else
				user.visible_message("[user] removes the wiring from [holder].", "You remove the wiring from [holder].")
				var/obj/item/stack/cable_coil/coil = new /obj/item/stack/cable_coil(get_turf(holder))
				coil.amount = 4
				holder.icon_state = "weasel2"
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] installs the central control module into [holder].", "You install the central computer mainboard into [holder].")
				qdel(used_atom)
				holder.icon_state = "weasel5"
			else
				user.visible_message("[user] disconnects the wiring of [holder].", "You disconnect the wiring of [holder].")
				holder.icon_state = "weasel3"
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", "You secure the mainboard.")
				holder.icon_state = "weasel6"
			else
				user.visible_message("[user] removes the central control module from [holder].", "You remove the central computer mainboard from [holder].")
				new /obj/item/circuitboard/mecha/weasel/main(get_turf(holder))
				holder.icon_state = "weasel4"
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] installs the peripherals control module into [holder].", "You install the peripherals control module into [holder].")
				qdel(used_atom)
				holder.icon_state = "weasel7"
			else
				user.visible_message("[user] unfastens the mainboard.", "You unfasten the mainboard.")
				holder.icon_state = "weasel5"
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", "You secure the peripherals control module.")
				holder.icon_state = "weasel8"
			else
				user.visible_message("[user] removes the peripherals control module from [holder].", "You remove the peripherals control module from [holder].")
				new /obj/item/circuitboard/mecha/weasel/peripherals(get_turf(holder))
				holder.icon_state = "weasel6"
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] installs the weapon control module into [holder].", "You install the weapon control module into [holder].")
				qdel(used_atom)
				holder.icon_state = "weasel9"
			else
				user.visible_message("[user] unfastens the peripherals control module.", "You unfasten the peripherals control module.")
				holder.icon_state = "weasel7"
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", "You secure the weapon control module.")
				holder.icon_state = "weasel10"
			else
				user.visible_message("[user] removes the weapon control module from [holder].", "You remove the weapon control module from [holder].")
				new /obj/item/circuitboard/mecha/weasel/targeting(get_turf(holder))
				holder.icon_state = "weasel8"
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] installs advanced scanner module to [holder].", "You install advanced scanner module to [holder].")
				qdel(used_atom)
				holder.icon_state = "weasel11"
			else
				user.visible_message("[user] unfastens the weapon control module.", "You unfasten the weapon control module.")
				holder.icon_state = "weasel9"
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] secures the advanced scanner module.", "You secure the advanced scanner module.")
				holder.icon_state = "weasel12"
			else
				user.visible_message("[user] removes the advanced scanner module from [holder].", "You remove the advanced scanner module from [holder].")
				new /obj/item/stock_parts/scanning_module/adv(get_turf(holder))
				holder.icon_state = "weasel10"
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] installs advanced capacitor to [holder].", "You install advanced capacitor to [holder].")
				qdel(used_atom)
				holder.icon_state = "weasel13"
			else
				user.visible_message("[user] unfastens the advanced scanner module.", "You unfasten the advanced scanner module.")
				holder.icon_state = "weasel11"
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] secures the advanced capacitor.", "You secure the advanced capacitor.")
				holder.icon_state = "weasel14"
			else
				user.visible_message("[user] removes the advanced capacitor from [holder].", "You remove the advanced capacitor from [holder].")
				new /obj/item/stock_parts/capacitor/adv(get_turf(holder))
				holder.icon_state = "weasel12"
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] installs internal armor layer to [holder].", "You install internal armor layer to [holder].")
				holder.icon_state = "weasel15"
			else
				user.visible_message("[user] unfastens the advanced capacitor.", "You unfasten the advanced capacitor.")
				holder.icon_state = "weasel13"
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] secures internal armor layer.", "You secure internal armor layer.")
				holder.icon_state = "weasel16"
			else
				user.visible_message("[user] pries internal armor layer from [holder].", "You prie internal armor layer from [holder].")
				var/obj/item/stack/material/steel/MS = new /obj/item/stack/material/steel(get_turf(holder))
				MS.amount = 3
				holder.icon_state = "weasel14"
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] welds internal armor layer to [holder].", "You weld the internal armor layer to [holder].")
				holder.icon_state = "weasel17"
			else
				user.visible_message("[user] unfastens the internal armor layer.", "You unfasten the internal armor layer.")
				holder.icon_state = "weasel15"
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] installs external reinforced armor layer to [holder].", "You install external reinforced armor layer to [holder].")
				holder.icon_state = "weasel18"
			else
				user.visible_message("[user] cuts internal armor layer from [holder].", "You cut the internal armor layer from [holder].")
				holder.icon_state = "weasel16"
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] secures external armor layer.", "You secure external reinforced armor layer.")
				holder.icon_state = "weasel19"
			else
				user.visible_message("[user] pries external armor layer from [holder].", "You prie external armor layer from [holder].")
				var/obj/item/stack/material/plasteel/MS = new /obj/item/stack/material/plasteel(get_turf(holder))
				MS.amount = 3
				holder.icon_state = "weasel17"
		if(1)
			if(diff==FORWARD)
				user.visible_message("[user] welds external armor layer to [holder].", "You weld external armor layer to [holder].")
			else
				user.visible_message("[user] unfastens the external armor layer.", "You unfasten the external armor layer.")
				holder.icon_state = "weasel18"
	return 1

/datum/construction/reversible/mecha/weasel/spawn_result()
	..()
	feedback_inc("mecha_weasel_created",1)
	return
