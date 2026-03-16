/datum/prototype/role/job/research_director
	id = "JobNtResearchDirector"
	title = "Research Director"

	menu_blurb = "The Research Director manages and maintains the Research department. They are required to ensure the safety of the entire crew, at least with regards to anything occurring in the Research department, and to inform the crew of any disruptions that might originate from Research. The Research Director often has at least passing knowledge of most of the Research department, but are encouraged to allow their staff to perform their own duties."

	spawn_blurb = CAPTAIN_REPORTEE + IMPORTANT_JOB_TELL_ADMINS

	minimum_player_age = 14
	outfit = /datum/outfit/job/station/research_director
	economy_payscale = ECONOMY_PAYSCALE_JOB_COMMAND
	selection_color =  "#7F6E2C"
	minimum_character_age = 25
	sorting_order = SSR_BOSS
	allow_jobhop = FALSE

	minimal_access = list(
		ACCESS_COMMAND_ANNOUNCE,
		ACCESS_COMMAND_BRIDGE,
		ACCESS_COMMAND_KEYAUTH,
		ACCESS_COMMAND_TELEPORTER,
		ACCESS_COMMAND_UPLOAD,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_TECHSTORAGE,
		ACCESS_ENGINEERING_TELECOMMS,
		ACCESS_GENERAL_GATEWAY,
		ACCESS_GENERAL_EXPLORER,
		ACCESS_GENERAL_PATHFINDER,
		ACCESS_GENERAL_PILOT,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_SCIENCE_EDIT,
		ACCESS_SCIENCE_EXONET,
		ACCESS_SCIENCE_FABRICATION,
		ACCESS_SCIENCE_GENETICS,
		ACCESS_SCIENCE_RD,
		ACCESS_SCIENCE_ROBOTICS,
		ACCESS_SCIENCE_TOXINS,
		ACCESS_SCIENCE_MAIN,
		ACCESS_SCIENCE_XENOBIO,
		ACCESS_SCIENCE_XENOARCH,
		ACCESS_SCIENCE_XENOBOTANY,
		ACCESS_SECURITY_MAIN,
	)

	departments = list(
		/datum/department/research::id,
		/datum/department/command::id,
	)
	departments_managed = list(/datum/department/research::name)
	department_accounts = list(/datum/department/research::name)

	alt_titles = list(
		/datum/prototype/alt_title/research_supervisor::id,
		/datum/prototype/alt_title/cso::id,
		)

/datum/prototype/alt_title/research_supervisor
	id = "AltRdSupervisor"
	title = "Research Supervisor"

/datum/prototype/alt_title/cso
	id = "AltRdChiefScienceOfficer"
	title = "Chief Science Officer"

/datum/outfit/job/station/research_director
	name = OUTFIT_JOB_NAME("Research Director")
	l_ear = /obj/item/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/research_director
	shoes = /obj/item/clothing/shoes/brown
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/rd

	id_type = /obj/item/card/id/science/head
	pda_type = /obj/item/pda/heads/rd

	backpack = /obj/item/storage/backpack/toxins
	satchel_one = /obj/item/storage/backpack/satchel/tox
	messenger_bag = /obj/item/storage/backpack/messenger/tox
	dufflebag = /obj/item/storage/backpack/dufflebag/sci
