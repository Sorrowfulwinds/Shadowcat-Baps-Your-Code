/datum/prototype/role/job/chief_medical_officer
	id = "JobNtChiefMedicalOfficer"
	title = "Chief Medical Officer"

	menu_blurb = "The CMO manages the Medical department and is a position requiring experience and skill; their goal is to ensure that their staff keep the station's crew healthy and whole. They are primarily interested in making sure that patients are safely found and transported to Medical for treatment. They are expected to keep the crew informed about threats to their health and safety, and about the importance of Suit Sensors."

	spawn_blurb = CAPTAIN_REPORTEE + IMPORTANT_JOB_TELL_ADMINS

	minimum_player_age = 10
	outfit = /datum/outfit/job/station/chief_medical_officer
	economy_payscale = ECONOMY_PAYSCALE_JOB_COMMAND
	selection_color = "#026865"
	sorting_order = 5
	minimum_character_age = 25
	allow_jobhop = FALSE

	minimal_access = list(
		ACCESS_COMMAND_ANNOUNCE,
		ACCESS_COMMAND_BRIDGE,
		ACCESS_COMMAND_EVA,
		ACCESS_COMMAND_KEYAUTH,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_MEDICAL_CHEMISTRY,
		ACCESS_MEDICAL_CMO,
		ACCESS_MEDICAL_EDIT,
		ACCESS_MEDICAL_EQUIPMENT,
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_MEDICAL_PSYCH,
		ACCESS_MEDICAL_SURGERY,
		ACCESS_MEDICAL_VIROLOGY,
		ACCESS_SECURITY_MAIN,
		ACCESS_SCIENCE_GENETICS,
	)

	departments = list(
		/datum/department/medical::id,
		/datum/department/command::id,
	)

	departments_managed = list(/datum/department/medical::name)
	department_accounts = list(/datum/department/medical::name)

	alt_titles = list(
			/datum/prototype/alt_title/fo::id,
			/datum/prototype/alt_title/cro::id,
			/datum/prototype/alt_title/hop/deputy::id,
		)

/datum/prototype/alt_title/cmo
	parent_role = /datum/prototype/role/job/chief_medical_officer::id
	abstract_type = /datum/prototype/alt_title/cmo

/datum/prototype/alt_title/cmo/chief_physician
	id = "AltCmoPhysician"
	title = "Chief Physician"

/datum/prototype/alt_title/cmo/director_of_medicine
	id = "AltCmoDirector"
	title = "Director of Medicine"


/datum/outfit/job/station/chief_medical_officer
	name = OUTFIT_JOB_NAME("Chief Medical Officer")
	l_ear  =/obj/item/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/rank/chief_medical_officer
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	shoes = /obj/item/clothing/shoes/brown
	l_hand = /obj/item/storage/firstaid/adv
	r_pocket = /obj/item/healthanalyzer

	id_type = /obj/item/card/id/medical/head
	pda_type = /obj/item/pda/heads/cmo
	pda_slot = SLOT_ID_LEFT_POCKET
	backpack = /obj/item/storage/backpack/medic
	satchel_one = /obj/item/storage/backpack/satchel/med
	messenger_bag = /obj/item/storage/backpack/messenger/med
	dufflebag = /obj/item/storage/backpack/dufflebag/med
