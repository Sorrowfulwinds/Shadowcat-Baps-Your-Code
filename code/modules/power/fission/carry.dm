/obj/item/storage/briefcase/fission
	icon = 'icons/obj/machines/power/fission.dmi'
	name = "lead lined carrying case"
	desc = "It's made of AUTHENTIC sealed lead and has a trifoil tag attached. Should probably handle this one with care."
	icon_state = "carrycase"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "case", SLOT_ID_LEFT_HAND = "case")

/obj/item/storage/briefcase/fission/uranium
	name = "lead lined uranium carrying case"
	icon_state = "carrycaserad"
	starts_with = alist(
		/obj/item/fuelrod/uranium = 4,
	)

/obj/item/storage/briefcase/fission/plutonium
	name = "lead lined plutonium carrying case"
	icon_state = "carrycaserad"
	starts_with = alist(
		/obj/item/fuelrod/plutonium = 4,
	)

/obj/item/storage/briefcase/fission/beryllium
	name = "lead lined beryllium carrying case"
	starts_with = alist(
		/obj/item/fuelrod/beryllium = 4,
	)

/obj/item/storage/briefcase/fission/tungstencarbide
	name = "lead lined tungsten carbide carrying case"
	starts_with = alist(
		/obj/item/fuelrod/tungstencarbide = 4,
	)

/obj/item/storage/briefcase/fission/silver
	name = "lead lined silver carrying case"
	starts_with = alist(
		/obj/item/fuelrod/silver = 4,
	)

/obj/item/storage/briefcase/fission/boron
	name = "lead lined boron carrying case"
	starts_with = alist(
		/obj/item/fuelrod/boron = 4,
	)

/obj/item/storage/briefcase/fission/fuelmixed
	name = "lead lined fuel rod case"
	icon_state = "carrycaserad"
	starts_with = alist(
		/obj/item/fuelrod/uranium = 2,
		/obj/item/fuelrod/plutonium = 2,
	)

/obj/item/storage/briefcase/fission/reflectormixed
	name = "lead lined reflector rod case"
	starts_with = alist(
		/obj/item/fuelrod/tungstencarbide = 1,
		/obj/item/fuelrod/beryllium = 3,
	)

/obj/item/storage/briefcase/fission/controlmixed
	name = "lead lined control rod case"
	starts_with = alist(
		/obj/item/fuelrod/boron = 1,
		/obj/item/fuelrod/silver = 3,
	)
