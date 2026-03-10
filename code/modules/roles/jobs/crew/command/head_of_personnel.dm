/datum/prototype/role/job/hop
	id = "JobNtHeadOfPersonnel"
	title = "Head of Personnel"

	menu_blurb = "The Head of Personnel manages the Service department, the Exploration team, and most other civilians. They also manage the Supply department, through the Quartermaster. In addition, the Head of Personnel oversees the personal accounts of the crew, including their money and access. If necessary, the Head of Personnel is first in line to assume Acting Command."

	spawn_blurb = CAPTAIN_REPORTEE + IMPORTANT_JOB_TELL_ADMINS

	minimum_player_age = 10
	outfit = /datum/outfit/job/station/head_of_personnel
	economy_payscale = ECONOMY_PAYSCALE_JOB_COMMAND

	minimal_access = list(
		ACCESS_COMMAND_ANNOUNCE,
		ACCESS_COMMAND_BANKING,
		ACCESS_COMMAND_BRIDGE,
		ACCESS_COMMAND_CARDMOD,
		ACCESS_COMMAND_EVA,
		ACCESS_COMMAND_HOP,
		ACCESS_COMMAND_IAA,
		ACCESS_COMMAND_KEYAUTH,
		ACCESS_COMMAND_LOCKERS,
		ACCESS_COMMAND_UPLOAD,
		ACCESS_COMMAND_VAULT,
		ACCESS_ENGINEERING_CONSTRUCTION,
		ACCESS_ENGINEERING_MAIN,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_GENERAL_BAR,
		ACCESS_GENERAL_BOTANY,
		ACCESS_GENERAL_CHAPEL,
		ACCESS_GENERAL_CREMATOR,
		ACCESS_GENERAL_GATEWAY,
		ACCESS_GENERAL_JANITOR,
		ACCESS_GENERAL_KITCHEN,
		ACCESS_GENERAL_LIBRARY,
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_SCIENCE_MAIN,
		ACCESS_SECURITY_BRIG,
		ACCESS_SECURITY_EQUIPMENT,
		ACCESS_SECURITY_FORENSICS,
		ACCESS_SECURITY_MAIN,
		ACCESS_SUPPLY_BAY,
		ACCESS_SUPPLY_MAIN,
		ACCESS_SUPPLY_MINE,
		ACCESS_SUPPLY_MINE_OUTPOST,
		ACCESS_SUPPLY_MULEBOT,
		ACCESS_SUPPLY_QM,
	)

	selection_color = "#1D1D4F"
	departments = list(
		/datum/department/command::id,
		/datum/department/civilian::id,
		/datum/department/cargo::id,
	)
	sorting_order = 5
	departments_managed = list(
		/datum/department/civilian::name,
		/datum/department/cargo::name,
	)
	department_accounts = list(
		/datum/department/civilian::name,
		/datum/department/cargo::name,
	)
	minimum_character_age = 25
	allow_jobhop = FALSE
	alt_titles = list(
			/datum/prototype/alt_title/fo::id,
			/datum/prototype/alt_title/cro::id,
			/datum/prototype/alt_title/hop/deputy::id,
		)

/datum/prototype/alt_title/fo
	id = "AltHopFo"
	parent_role = /datum/prototype/role/job/hop::id
	title = "First Officer"

/datum/prototype/alt_title/cro
	id = "AltHopCro"
	parent_role = /datum/prototype/role/job/hop::id
	title = "Crew Resources Officer"

/datum/prototype/alt_title/hop/deputy
	id = "AltHopDeputy"
	parent_role = /datum/prototype/role/job/hop::id
	title = "Deputy Director"

/datum/outfit/job/station/head_of_personnel
	name = OUTFIT_JOB_NAME("Head of Personnel")
	uniform = /obj/item/clothing/under/rank/head_of_personnel
	l_ear = /obj/item/radio/headset/heads/hop
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/card/id/silver/hop
	pda_type = /obj/item/pda/heads/hop
