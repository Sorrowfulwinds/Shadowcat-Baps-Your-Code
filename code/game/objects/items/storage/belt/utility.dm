
/obj/item/storage/belt/utility
	name = "tool-belt" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "Can hold various tools."
	icon_state = "utility"
	item_state = "utility"

/obj/item/storage/belt/utility/full
	starts_with = alist(
		/obj/item/tool/screwdriver = 1,
		/obj/item/tool/wrench = 1,
		/obj/item/weldingtool = 1,
		/obj/item/tool/crowbar = 1,
		/obj/item/tool/wirecutters = 1,
		/obj/item/stack/cable_coil/random_belt = 1
	)

/obj/item/storage/belt/utility/atmostech
	starts_with = alist(
		/obj/item/tool/screwdriver = 1,
		/obj/item/tool/wrench = 1,
		/obj/item/weldingtool = 1,
		/obj/item/tool/crowbar = 1,
		/obj/item/tool/wirecutters = 1,
	)

/obj/item/storage/belt/utility/chief
	name = "chief engineer's toolbelt"
	desc = "Holds tools, looks snazzy."
	icon_state = "utilitybelt_ce"
	item_state = "utility_ce"

/obj/item/storage/belt/utility/chief/full
	starts_with = alist(
		/obj/item/tool/screwdriver/power = 1,
		/obj/item/tool/crowbar/power = 1,
		/obj/item/weldingtool/experimental = 1,
		/obj/item/multitool = 1,
		/obj/item/stack/cable_coil/random_belt = 1,
		/obj/item/extinguisher/mini = 1,
		/obj/item/atmos_analyzer/longrange = 1
	)

/obj/item/storage/belt/utility/alien
	name = "alien belt"
	desc = "A belt(?) that can hold things."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "belt"
	item_state = "security"

/obj/item/storage/belt/utility/alien/full
	starts_with = alist(
		/obj/item/tool/screwdriver/alien = 1,
		/obj/item/tool/wrench/alien = 1,
		/obj/item/weldingtool/alien = 1,
		/obj/item/tool/crowbar/alien = 1,
		/obj/item/tool/wirecutters/alien = 1,
		/obj/item/multitool/alien = 1,
		/obj/item/stack/cable_coil/alien = 1
	)

/obj/item/storage/belt/utility/crystal
	name = "crystalline tool harness"
	desc = "A segmented belt of strange crystalline material."
	icon_state = "utilitybelt_crystal"
	item_state = "utilitybelt_crystal"

/obj/item/storage/belt/utility/crystal/Initialize()
	new /obj/item/multitool/crystal(src)
	new /obj/item/tool/wrench/crystal(src)
	new /obj/item/tool/crowbar/crystal(src)
	new /obj/item/tool/screwdriver/crystal(src)
	new /obj/item/tool/wirecutters/crystal(src)
	new /obj/item/weldingtool/electric/crystal(src)
	update_icon()
	. = ..()
