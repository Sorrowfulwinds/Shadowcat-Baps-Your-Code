/datum/prototype/role/job/senior_physician
	id = "JobNtSeniorPhysician"
	title = "Senior Physician"

	menu_blurb = "A Senior Physician is an experienced medical professional who fulfills a similar role to other doctors but usually occupies spare time with with training of other, newer doctors and giving advice in tricky medical situations. You are not in command of the Medical department, but should assist the CMO in accordance with Standard Operating Procedures."

	spawn_blurb = "You work in the medical department and report to the Chief Medical Officer."

	minimum_player_age = 14
	outfit = /datum/outfit/job/station/medical_doctor/senior_physician
	economy_payscale = ECONOMY_PAYSCALE_JOB_SENIOR
	selection_color = "#013D3B"
	sorting_order = SSR_SENIOR
	minimum_character_age = 25

	minimal_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_EQUIPMENT,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_MEDICAL_SURGERY,
	)
	additional_access = list(
		ACCESS_MEDICAL_CHEMISTRY,
		ACCESS_MEDICAL_VIROLOGY,
		ACCESS_SCIENCE_GENETICS,
	)

	departments = list(/datum/department/medical::id)

	alt_titles = list(/datum/prototype/alt_title/medical_specialist::id)

/datum/prototype/alt_title/medical_specialist
	id = "AltSeniorPhysicianSpecialist"
	parent_role = /datum/prototype/role/job/senior_physician::id
	title = "Medical Training Specialist"
	menu_blurb = "A Medical Training Specialist is a senior medical professional with extensive knowledge within a particular field of medicine which is expected to perform the standard duties of a medical doctor, as well as offer training and guidance to both resident and attending physicians in all matters, especially when presented with difficult situations within their field of expertise."

/datum/outfit/job/station/medical_doctor/senior_physician
	name = OUTFIT_JOB_NAME("Medical Doctor")
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_hand = /obj/item/storage/firstaid/regular
	r_pocket = /obj/item/flashlight/pen
	id_type = /obj/item/card/id/medical
	l_ear = /obj/item/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/white

	pda_type = /obj/item/pda/medical
	pda_slot = SLOT_ID_LEFT_POCKET
	backpack = /obj/item/storage/backpack/medic
	satchel_one = /obj/item/storage/backpack/satchel/med
	messenger_bag = /obj/item/storage/backpack/messenger/med
	dufflebag = /obj/item/storage/backpack/dufflebag/med
