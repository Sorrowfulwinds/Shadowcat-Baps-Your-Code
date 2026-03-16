/datum/prototype/role/job/chemist
	id = "JobNtChemist"
	title = "Chemist"

	menu_blurb = "A Chemist produces and maintains a stock of basic to advanced chemicals for medical and occasionally research use. They are likely to know the use and dangers of many lab-produced chemicals."

	spawn_blurb = "You work in the medical department and report to the Chief Medical Officer."

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/chemist
	selection_color = "#013D3B"
	sorting_order = SSR_STANDARD


	minimal_access = list(
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_EQUIPMENT,
		ACCESS_MEDICAL_CHEMISTRY,
	)
	additional_access = list(
		ACCESS_MEDICAL_MORGUE,
		ACCESS_MEDICAL_SURGERY,
		ACCESS_MEDICAL_VIROLOGY,
		ACCESS_SCIENCE_GENETICS,
	)

	departments = list(/datum/department/medical::id)

	alt_titles = list(
		/datum/prototype/alt_title/chemist/pharmacist::id,
		/datum/prototype/alt_title/chemist/pharmacologist::id,
	)

/datum/prototype/alt_title/chemist
	parent_role = /datum/prototype/role/job/chemist::id
	abstract_type = /datum/prototype/alt_title/chemist

/datum/prototype/alt_title/chemist/pharmacist
	id = "AltChemistPharmacist"
	title = "Pharmacist"
	menu_blurb = "A Pharmacist focuses on the chemical needs of the Medical Department, and often offers to fill crew prescriptions at their discretion."

/datum/prototype/alt_title/chemist/pharmacologist
	id = "AltChemistPharmacologist"
	title = "Pharmacologist"
	menu_blurb = "A Pharmacologist focuses on the chemical needs of the Medical Department, primarily specializing in producing more advanced forms of medicine."

/datum/outfit/job/station/chemist
	name = OUTFIT_JOB_NAME("Chemist")
	uniform = /obj/item/clothing/under/rank/chemist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/chemist
	l_ear = /obj/item/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/white

	id_type = /obj/item/card/id/medical/chemist
	pda_type = /obj/item/pda/chemist
	pda_slot = SLOT_ID_LEFT_POCKET

	backpack = /obj/item/storage/backpack/chemistry
	satchel_one = /obj/item/storage/backpack/satchel/chem
	messenger_bag = /obj/item/storage/backpack/messenger/med
	dufflebag = /obj/item/storage/backpack/dufflebag/chemistry
