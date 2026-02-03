/datum/prototype/role/job/chief_engineer
	id = "JobNtChiefEngineer"
	title = "Chief Engineer"

	menu_blurb = "The Chief Engineer manages the Engineering Department, ensuring that the Engineers work on what needs to be done, handling distribution of manpower as much as they handle hands-on operations and repairs. They are also expected to keep the rest of the station informed of any structural threats to the station that may be hazardous to health or disruptive to work."

	spawn_blurb = "As the manager of Engineering you report to the Captain.\n" + IMPORTANT_JOB_TELL_ADMINS

	minimum_player_age = 7
	outfit = /datum/outfit/job/station/chief_engineer
	economy_payscale = ECONOMY_PAYSCALE_JOB_COMMAND

	minimal_access = list(
		ACCESS_ENGINEERING_ATMOS,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_ENGINEERING_CE,
		ACCESS_ENGINEERING_CONSTRUCTION,
		ACCESS_ENGINEERING_EDIT,
		ACCESS_ENGINEERING_ENGINE,
		ACCESS_ENGINEERING_MAIN,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_TECHSTORAGE,
		ACCESS_ENGINEERING_TELECOMMS,
		ACCESS_ENGINEERING_TRIAGE,
		ACCESS_COMMAND_ANNOUNCE,
		ACCESS_COMMAND_BRIDGE,
		ACCESS_COMMAND_EVA,
		ACCESS_COMMAND_KEYAUTH,
		ACCESS_COMMAND_TELEPORTER,
		ACCESS_COMMAND_UPLOAD,
		ACCESS_SECURITY_MAIN,
	)

	selection_color =  "#7F6E2C"
	departments = list(
		/datum/department/engineering::id,
		/datum/department/command::id,
	)
	sorting_order = 5
	departments_managed = list(/datum/department/engineering::name)
	department_accounts = list(/datum/department/engineering::name)
	minimum_character_age = 25
	allow_jobhop = FALSE
	alt_titles = list(
		/datum/prototype/alt_title/engineering_director::id,
		/datum/prototype/alt_title/head_engineer::id,
		)

/datum/prototype/alt_title/engineering_director
	id = "AltCeEngineeringDirector"
	parent_role = /datum/prototype/role/job/chief_engineer::id
	title = "Engineering Director"

/datum/prototype/alt_title/head_engineer
	id = "AltCeHeadEngineer"
	parent_role = /datum/prototype/role/job/chief_engineer::id
	title = "Head of Engineering"

/datum/outfit/job/station/chief_engineer
	name = OUTFIT_JOB_NAME("Chief engineer")
	head = /obj/item/clothing/head/hardhat/white
	uniform = /obj/item/clothing/under/rank/chief_engineer
	l_ear = /obj/item/radio/headset/heads/ce
	gloves = /obj/item/clothing/gloves/black
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/t_scanner

	id_type = /obj/item/card/id/engineering/head
	pda_type = /obj/item/pda/heads/ce

	backpack = /obj/item/storage/backpack/industrial
	satchel_one = /obj/item/storage/backpack/satchel/eng
	messenger_bag = /obj/item/storage/backpack/messenger/engi
	pda_slot = SLOT_ID_LEFT_POCKET
	dufflebag = /obj/item/storage/backpack/dufflebag/eng
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
