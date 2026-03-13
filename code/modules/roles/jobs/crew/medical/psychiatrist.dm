/datum/prototype/role/job/psychiatrist
	id = "JobNtPsychiatrist"
	title = "Psychiatrist"

	menu_blurb = "A Psychiatrist provides mental health services to crew members in need. They may also be called upon to determine whatever ails the mentally unwell, frequently under Security supervision. They understand the effects of various psychoactive drugs."

	spawn_blurb = "You work in the medical department and report to the Chief Medical Officer."

	outfit = /datum/outfit/job/station/psychiatrist
	selection_color = "#013D3B"
	sorting_order = 3

	minimal_access = list(
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_EQUIPMENT,
		ACCESS_MEDICAL_PSYCH,
	)
	additional_access = list(
		ACCESS_MEDICAL_CHEMISTRY,
		ACCESS_MEDICAL_MORGUE,
	)


	departments = list(/datum/department/medical::id)


	alt_titles = list(/datum/prototype/alt_title/psychologist::id)

/datum/prototype/alt_title/psychologist
	id = "AltPsychiatristPsycho"
	parent_role = /datum/prototype/role/job/psychiatrist::id
	title = "Psychologist"
	outfit = /datum/outfit/job/station/psychiatrist/psychologist

/datum/outfit/job/station/psychiatrist
	name = OUTFIT_JOB_NAME("Psychiatrist")
	uniform = /obj/item/clothing/under/rank/psych
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	l_ear = /obj/item/radio/headset/headset_med

	id_type = /obj/item/card/id/medical/psychiatrist
	pda_type = /obj/item/pda/medical
	pda_slot = SLOT_ID_LEFT_POCKET
	backpack = /obj/item/storage/backpack/medic
	satchel_one = /obj/item/storage/backpack/satchel/med
	messenger_bag = /obj/item/storage/backpack/messenger/med
	dufflebag = /obj/item/storage/backpack/dufflebag/med

/datum/outfit/job/station/psychiatrist/psychologist
	name = OUTFIT_JOB_NAME("Psychologist")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
