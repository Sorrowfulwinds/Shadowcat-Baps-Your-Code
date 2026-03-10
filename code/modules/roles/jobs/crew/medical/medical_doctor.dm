/datum/prototype/role/job/doctor
	id = "JobNtDoctor"
	title = "Medical Doctor"

	menu_blurb = "A Medical Doctor is a Jack-of-All-Trades Medical title, covering a variety of skill levels and minor specializations. They are likely familiar with basic first aid, and a number of accompanying medications, and can generally save, if not cure, a majority of the patients they encounter."

	spawn_blurb = "You work in the medical department and report to the Chief Medical Officer."

	outfit = /datum/outfit/job/station/medical_doctor

	minimal_access = list(
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_EQUIPMENT,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_MEDICAL_SURGERY,
		ACCESS_MEDICAL_VIROLOGY,
	)
	additional_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_MEDICAL_CHEMISTRY,
		ACCESS_SCIENCE_GENETICS,
	)

	selection_color = "#013D3B"
	departments = list(
		/datum/department/medical::id,
	)
	sorting_order = 3

	alt_titles = list(
		/datum/prototype/alt_title/medical_doctor/surgeon::id,
		/datum/prototype/alt_title/medical_doctor/emergency_physician::id,
		/datum/prototype/alt_title/medical_doctor/nurse::id,
		/datum/prototype/alt_title/medical_doctor/virologist::id,
		/datum/prototype/alt_title/medical_doctor/resident::id,
		/datum/prototype/alt_title/medical_doctor/intern::id,
	)

/datum/prototype/alt_title/medical_doctor
	parent_role = /datum/prototype/role/job/doctor::id
	abstract_type = /datum/prototype/alt_title/doctor

/datum/prototype/alt_title/medical_doctor/surgeon
	id = "AltDoctorSurgeon"
	title = "Surgeon"
	menu_blurb = "A Surgeon specializes in providing surgical aid to injured patients, up to and including amputation and limb reattachment. They are expected to know the ins and outs of anesthesia and surgery."
	outfit = /datum/outfit/job/station/medical_doctor/surgeon

/datum/prototype/alt_title/medical_doctor/emergency_physician
	id = "AltDoctorEmergencyPhysician"
	title = "Emergency Physician"
	menu_blurb = "An Emergency Physician is a Medical professional trained for stabilizing and treating severely injured and/or dying patients. They are generally the first response for any such individual brought to the Medbay, and can sometimes be expected to help their patients make a full recovery."
	outfit = /datum/outfit/job/station/medical_doctor/emergency_physician

/datum/prototype/alt_title/medical_doctor/nurse
	id = "AltDoctorNurse"
	title = "Nurse"
	menu_blurb = "A Nurse acts as a general purpose aide to the doctors, providing basic care to non-critical patients, and stabilizing critical patients during busy periods. They frequently watch the suit sensors console, to help manage the time of other Doctors. In rare occasions, a Nurse can be called upon to revive deceased crew members."
	outfit = /datum/outfit/job/station/medical_doctor/nurse

/datum/prototype/alt_title/medical_doctor/virologist
	id = "AltDoctorVirologist"
	title = "Virologist"
	menu_blurb = "A Virologist cures active diseases in the crew, and prepares antibodies for possible infections. They also have the skills to produce the various types of virus foods or mutagens."
	outfit = /datum/outfit/job/station/medical_doctor/virologist

/datum/prototype/alt_title/medical_doctor/resident
	id = "AltDoctorResident"
	title = "Medical Resident"
	menu_blurb = "A Medical Resident is someone who has a medical degree but is still in their residency, training under the supervision of more experienced doctors."

/datum/prototype/alt_title/medical_doctor/intern
	id = "AltDoctorIntern"
	title = "Medical Intern"
	menu_blurb = "A Medical Intern is someone just learning the ropes of the medical field, learning from and answering to other medbay staff."



/datum/outfit/job/station/medical_doctor
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

/datum/outfit/job/station/medical_doctor/emergency_physician
	name = OUTFIT_JOB_NAME("Emergency Physician")
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket

/datum/outfit/job/station/medical_doctor/surgeon
	name = OUTFIT_JOB_NAME("Surgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs
	head = /obj/item/clothing/head/surgery/blue

/datum/outfit/job/station/medical_doctor/virologist
	name = OUTFIT_JOB_NAME("Virologist")
	uniform = /obj/item/clothing/under/rank/virologist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/virologist
	mask = /obj/item/clothing/mask/surgical

	backpack = /obj/item/storage/backpack/virology
	satchel_one = /obj/item/storage/backpack/satchel/vir
	dufflebag = /obj/item/storage/backpack/dufflebag/virology

/datum/outfit/job/station/medical_doctor/nurse
	name = OUTFIT_JOB_NAME("Nurse")
	suit = null

/datum/outfit/job/station/medical_doctor/nurse/pre_equip(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		if(prob(50))
			uniform = /obj/item/clothing/under/rank/nursesuit
		else
			uniform = /obj/item/clothing/under/rank/nurse
		head = /obj/item/clothing/head/nursehat
	else
		uniform = /obj/item/clothing/under/rank/medical/scrubs/purple
	..()
