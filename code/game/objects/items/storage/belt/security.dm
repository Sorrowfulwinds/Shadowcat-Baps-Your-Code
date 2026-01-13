// todo: better storage insertion broad-spectrum check system
//       to not need to list all paths out.
/obj/item/storage/belt/security
	name = "security belt"
	desc = "Standard issue belt capable of storing many kinds of tactical gear."
	icon_state = "security"
	max_single_weight_class = WEIGHT_CLASS_NORMAL
	set_max_combined_belt_large = /datum/object_system/storage/belt::max_combined_belt_large + 1
	set_max_combined_belt_medium = /datum/object_system/storage/belt::max_combined_belt_medium

/obj/item/storage/belt/security/nt_isd_preload
	starts_with = alist(
		/obj/item/handcuffs = 1,
		/obj/item/flash = 1,
		/obj/item/gun/projectile/energy/nt_isd/sidearm/with_light = 1,
		/obj/item/melee/baton/loaded = 1,
		/obj/item/cell/basic/tier_2/weapon = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
	)

/obj/item/storage/belt/security/tactical
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "swat"
	set_max_combined_belt_medium = /obj/item/storage/belt/security::set_max_combined_belt_medium + 2

/obj/item/storage/belt/security/tactical/bandolier
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "bandolier"
