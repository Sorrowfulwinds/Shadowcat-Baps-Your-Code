/datum/prototype/role/job/pathfinder
	id = "JobNtPathfinder"
	title = "Pathfinder"

	menu_blurb = "The Pathfinder's job is to lead and manage expeditions, and is the primary authority on all off-station expeditions."

	spawn_blurb = "You direct the Exploration department and report to the Facility Director"

	minimum_player_age = 7
	outfit = /datum/outfit/job/station/pathfinder
	economy_payscale = ECONOMY_PAYSCALE_JOB_SENIOR

	minimal_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_GENERAL_PILOT,
		ACCESS_GENERAL_EXPLORER,
		ACCESS_SCIENCE_MAIN,
		ACCESS_GENERAL_GATEWAY,
		ACCESS_GENERAL_PATHFINDER,
	)
	additional_access = list(
		ACCESS_ENGINEERING_MAINT,
	)

	selection_color = "#d6d05c"
	departments = list(
		/datum/department/exploration::id,
		/datum/department/medical::id,
	)
	sorting_order = 5
	departments_managed = list(/datum/department/exploration::name)
	department_accounts = list(/datum/department/exploration::name)
	alt_titles = list(
		/datum/prototype/alt_title/expedition_lead::id,
	)

/datum/prototype/alt_title/expedition_lead
	id = "AltPathfinderLead"
	parent_role = /datum/prototype/role/job/pathfinder::id
	title = "Expedition Lead"

/datum/outfit/job/station/pathfinder
	name = OUTFIT_JOB_NAME("Pathfinder")
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer //TODO: Uniforms.
	l_ear = /obj/item/radio/headset/pathfinder
	id_slot = SLOT_ID_WORN_ID
	pda_slot = SLOT_ID_LEFT_POCKET
	pda_type = /obj/item/pda/pathfinder
	id_type = /obj/item/card/id/explorer/head/pathfinder
	id_pda_assignment = "Pathfinder"

	backpack = /obj/item/storage/backpack/voyager
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)
	satchel_one = /obj/item/storage/backpack/satchel/voyager
	dufflebag = /obj/item/storage/backpack/dufflebag/voyager

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL
