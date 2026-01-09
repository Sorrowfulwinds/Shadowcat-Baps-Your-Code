/datum/prototype/role/job/chief_engineer
	//? Basic Info
	id = "JobNtChiefEngineer"
	title = "Chief Engineer"

	desc = "The Chief Engineer manages the Engineering Department, ensuring that the Engineers work on what needs to be done, handling distribution of manpower as much as they handle hands-on operations and repairs. They are also expected to keep the rest of the station informed of any structural threats to the station that may be hazardous to health or disruptive to work."

	spawntext = "As the manager of Engineering you report to the Captain."

	important_info = "You are playing a job that is important for Game Progression. If you have to disconnect immediately, please notify the admins via adminhelp. Otherwise put your locker gear back into the locker and cryo out."

	//? Requirements
	minimum_player_age = 7

	//? Advanced Info
	alt_titles = list(
		"AltCeEngineeringDirector",
		"AltCeHeadEngineer",
		)
	outfit = /datum/outfit/job/station/chief_engineer
	/// The instantiator to spawn this role. May override player character.
	instancer
	/// The uninstantiator to clean up this role.
	uninstancer

	//? Settings
	economy_payscale = ECONOMY_PAYSCALE_JOB_COMMAND

	//? Access
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
	//? Unsorted
	selection_color =  "#7F6E2C"
	departments = list(
		"DeptEngineering",
		"DeptCommand",
	)
	sorting_order = 2
	departments_managed = list(DEPARTMENT_ENGINEERING)
	department_accounts = list(DEPARTMENT_ENGINEERING)

	minimum_character_age = 25
	ideal_character_age = 50

	allow_jobhop = FALSE

/datum/prototype/alt_title/engineering_director
	id = "AltCeEngineeringDirector"
	parent_role = "JobNtChiefEngineer"
	title = "Engineering Director"

/datum/prototype/alt_title/head_engineer
	id = "AltCeHeadEngineer"
	parent_role = "JobNtChiefEngineer"
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
