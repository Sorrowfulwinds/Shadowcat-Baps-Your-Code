/* First aid storage
 * Contains:
 *		First Aid Kits
 * 		Pill Bottles
 */

/*
 * First Aid Kits
 */
/obj/item/storage/firstaid
	name = "first aid kit"
	desc = "It's an emergency medical kit, meant to either treat light injuries or stabilize the dying."
	icon = 'icons/obj/storage.dmi'
	icon_state = "firstaid"
	throw_speed = 2
	throw_range = 8
	slot_flags = SLOT_BELT
	max_combined_volume = WEIGHT_VOLUME_SMALL * 7 // 14
	drop_sound = 'sound/items/drop/cardboardbox.ogg'
	pickup_sound = 'sound/items/pickup/cardboardbox.ogg'
	suit_storage_class = SUIT_STORAGE_CLASS_SOFTWEAR | SUIT_STORAGE_CLASS_HARDWEAR

/obj/item/storage/firstaid/fire
	name = "fire first aid kit"
	desc = "It's an emergency medical kit, loaded with everything you would need to treat burns of any kind."
	icon_state = "ointment"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "firstaid-ointment", SLOT_ID_LEFT_HAND = "firstaid-ointment")
	starts_with = alist(
		/obj/item/healthanalyzer = 1,
		/obj/item/reagent_containers/hypospray/autoinjector = 1,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/reagent_containers/pill/kelotane = 3,
	)

/obj/item/storage/firstaid/regular
	icon_state = "firstaid"
	starts_with = alist(
		/obj/item/stack/medical/bruise_pack = 3,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/reagent_containers/hypospray/autoinjector = 1
	)

/obj/item/storage/firstaid/toxin
	name = "poison first aid kit" //IRL the term used would be poison first aid kit.
	desc = "Used to treat when one has a high amount of toxins in their body."
	icon_state = "antitoxin"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "firstaid-toxin", SLOT_ID_LEFT_HAND = "firstaid-toxin")
	starts_with = alist(
		/obj/item/reagent_containers/syringe/antitoxin = 3,
		/obj/item/reagent_containers/pill/antitox = 3,
		/obj/item/healthanalyzer = 1
	)

/obj/item/storage/firstaid/o2
	name = "oxygen deprivation first aid kit"
	desc = "It's an emergency medical kit, commonly seen aboard spacecraft, loaded with chemicals to treat oxygen deprivation."
	icon_state = "o2"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "firstaid-o2", SLOT_ID_LEFT_HAND = "firstaid-o2")
	starts_with = alist(
		/obj/item/reagent_containers/pill/dexalin = 4,
		/obj/item/reagent_containers/hypospray/autoinjector = 1,
		/obj/item/reagent_containers/syringe/inaprovaline = 1,
		/obj/item/healthanalyzer = 1
	)

/obj/item/storage/firstaid/adv
	name = "advanced first aid kit"
	desc = "Contains advanced medical items, for when serious injuries require serious medicine."
	icon_state = "advfirstaid"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "firstaid-advanced", SLOT_ID_LEFT_HAND = "firstaid-advanced")
	starts_with = alist(
		/obj/item/reagent_containers/hypospray/autoinjector = 1,
		/obj/item/stack/medical/advanced/bruise_pack = 3,
		/obj/item/stack/medical/advanced/ointment = 2,
		/obj/item/stack/medical/splint = 1
	)

/obj/item/storage/firstaid/combat
	name = "combat medical kit"
	desc = "A collection of everything an enterprising operative needs to stay alive in the field."
	icon_state = "bezerk"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "firstaid-advanced", SLOT_ID_LEFT_HAND = "firstaid-advanced")
	starts_with = alist(
		/obj/item/storage/pill_bottle/bicaridine = 1,
		/obj/item/storage/pill_bottle/dermaline = 1,
		/obj/item/storage/pill_bottle/dexalin_plus = 1,
		/obj/item/storage/pill_bottle/dylovene = 1,
		/obj/item/storage/pill_bottle/tramadol = 1,
		/obj/item/storage/pill_bottle/spaceacillin = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/biginjector/clotting = 1,
		/obj/item/stack/medical/splint = 1,
		/obj/item/healthanalyzer/advanced = 1
	)

/obj/item/storage/firstaid/surgery
	name = "surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport and automatically sterilizes the content between uses."
	icon = 'icons/obj/storage.dmi'
	icon_state = "surgerykit"
	item_state = "firstaid-surgery"
	max_single_weight_class = WEIGHT_CLASS_NORMAL
	max_combined_volume = 25 //update this when necessary!

	insertion_whitelist = list(
		/obj/item/surgical,
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/stack/nanopaste,
		/obj/item/healthanalyzer,
		/obj/item/autopsy_scanner
		)

	starts_with = alist(
		/obj/item/surgical/bonesetter = 1,
		/obj/item/surgical/cautery = 1,
		/obj/item/surgical/circular_saw = 1,
		/obj/item/surgical/hemostat = 1,
		/obj/item/surgical/retractor = 1,
		/obj/item/surgical/scalpel = 1,
		/obj/item/surgical/surgicaldrill = 1,
		/obj/item/surgical/bonegel = 1,
		/obj/item/surgical/FixOVein = 1,
		/obj/item/stack/medical/advanced/bruise_pack = 1,
		/obj/item/autopsy_scanner = 1
		)

/obj/item/storage/firstaid/clotting
	name = "clotting kit"
	desc = "Contains chemicals to stop bleeding."
	icon_state = "clottingkit"
	max_combined_volume = WEIGHT_VOLUME_SMALL * 7
	starts_with = alist(/obj/item/reagent_containers/hypospray/autoinjector/biginjector/clotting = 8)

/obj/item/storage/firstaid/bonemed
	name = "bone repair kit"
	desc = "Contains chemicals to mend broken bones."
	max_combined_volume = WEIGHT_VOLUME_SMALL * 7
	starts_with = alist(/obj/item/reagent_containers/hypospray/autoinjector/biginjector/bonemed = 8)

/obj/item/storage/firstaid/clotting
	icon_state = "clottingkit"

/obj/item/storage/firstaid/bonemed
	icon_state = "pinky"

/obj/item/storage/firstaid/insiderepair
	name = "combat organ kit"
	desc = "Contains advanced organ medical treatments."
	icon_state = "bezerk"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "firstaid-advanced", SLOT_ID_LEFT_HAND = "firstaid-advanced")
	starts_with = alist(
		/obj/item/storage/pill_bottle/rezadone = 1,
		/obj/item/storage/pill_bottle/peridaxon = 1,
		/obj/item/storage/pill_bottle/carthatoline = 1,
		/obj/item/storage/pill_bottle/alkysine = 1,
		/obj/item/storage/pill_bottle/imidazoline = 1,
		/obj/item/storage/pill_bottle/osteodaxon = 1,
		/obj/item/storage/pill_bottle/myelamine = 1,
		/obj/item/storage/pill_bottle/arithrazine = 1,
		/obj/item/healthanalyzer/advanced = 1
	)
