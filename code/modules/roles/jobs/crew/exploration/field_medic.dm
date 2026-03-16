/datum/prototype/role/job/field_medic
	id = "JobNtFieldMedic"
	title = "Field Medic"

	menu_blurb = "A Field medic works as the field doctor of expedition teams."

	spawn_blurb = "You work in the Exploration department and report to the Pathfinder and the Chief Medical Officer"

	outfit = /datum/outfit/job/station/sar
	economy_payscale = ECONOMY_PAYSCALE_JOB_DANGER
	selection_color = "#999440"
	sorting_order = SSR_SENIOR

	minimal_access = list(
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_EQUIPMENT,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_GENERAL_PILOT,
		ACCESS_GENERAL_EXPLORER,
	)
	additional_access = list(
		ACCESS_MEDICAL_SURGERY,
		ACCESS_MEDICAL_CHEMISTRY,
		ACCESS_COMMAND_EVA,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_AIRLOCK,
	)

	departments = list(
		/datum/department/exploration::id,
		/datum/department/medical::id,
	)

	alt_titles = list(/datum/prototype/alt_title/expedition_medic::id)

/datum/prototype/alt_title/expedition_medic
	id = "AltFieldMedExpedition"
	title = "Expedition Medic"

/datum/outfit/job/station/sar
	name = OUTFIT_JOB_NAME("Field Medic")
	uniform = /obj/item/clothing/under/utility/blue
	suit = /obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	l_ear = /obj/item/radio/headset/sar
	l_hand = /obj/item/storage/firstaid/regular
	belt = /obj/item/storage/belt/medical/emt
	pda_slot = SLOT_ID_LEFT_POCKET
	r_pocket = /obj/item/flashlight/pen
	pda_type = /obj/item/pda/sar
	id_type = /obj/item/card/id/medical/sar
	id_pda_assignment = "Field Medic"

	backpack = /obj/item/storage/backpack/medic
	satchel_one = /obj/item/storage/backpack/satchel/med
	messenger_bag = /obj/item/storage/backpack/messenger/med
	dufflebag = /obj/item/storage/backpack/dufflebag/med

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL
