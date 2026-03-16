/datum/prototype/role/job/explorer
	id = "JobNtExplorer"
	title = "Explorer"

	menu_blurb = "An Explorer searches for interesting things, and returns them to the station."

	spawn_blurb = "You work in the Exploration department and report to the Pathfinder and the Research Director"

	outfit = /datum/outfit/job/station/explorer
	economy_payscale = ECONOMY_PAYSCALE_JOB_DANGER
	selection_color = "#999440"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_GENERAL_EXPLORER,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_SCIENCE_MAIN,
		ACCESS_GENERAL_PILOT,
		ACCESS_GENERAL_GATEWAY,
	)

	departments = list(/datum/department/exploration::id)

	alt_titles = list(
		/datum/prototype/alt_title/explorer/surveyor::id,
		/datum/prototype/alt_title/explorer/field_scout::id,
		/datum/prototype/alt_title/explorer/junior::id,
	)

/datum/prototype/alt_title/explorer
	parent_role = /datum/prototype/role/job/explorer::id
	abstract_type = /datum/prototype/alt_title/explorer

/datum/prototype/alt_title/explorer/surveyor
	id = "AltExploSurveyor"
	title = "Surveyor"
	menu_blurb = "A Surveyor is an Explorer who specializes in measuring and mapping previously unknown areas."

/datum/prototype/alt_title/explorer/field_scout
	id = "AltExploFieldScout"
	title = "Field Scout"
	menu_blurb = "A Field Scout is an Explorer who specializes in navigating unknown environment and locating points of interest to the team."

/datum/prototype/alt_title/explorer/junior
	id = "AltExploJuinor"
	title = "Junior Explorer"
	sorting_order = SSR_JUINOR
	menu_blurb = "A Junior Explorer has less experience than a full Explorer, and should listen to their direction."

/datum/outfit/job/station/explorer
	name = OUTFIT_JOB_NAME("Explorer")
	id_pda_assignment = "Explorer"
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer
	l_ear = /obj/item/radio/headset/explorer

	id_slot = SLOT_ID_WORN_ID
	pda_slot = SLOT_ID_LEFT_POCKET

	pda_type = /obj/item/pda/explorer
	id_type = /obj/item/card/id/explorer/explorer

	backpack = /obj/item/storage/backpack/voyager
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)
	satchel_one = /obj/item/storage/backpack/satchel/voyager
	dufflebag = /obj/item/storage/backpack/dufflebag/voyager

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
