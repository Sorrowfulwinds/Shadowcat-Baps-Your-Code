/datum/prototype/role/job/paramedic
	id = "JobNtParamedic"
	title = "Paramedic"

	menu_blurb = "A Paramedic is primarily concerned with the stabilization and recovery of patients who are unable to make it to the Medical Department on their own. They may also be called upon to keep patients stable when Medical is busy or understaffed."

	spawn_blurb = "You work in the medical department and report to the Chief Medical Officer."

	outfit = /datum/outfit/job/station/paramedic
	selection_color = "#013D3B"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_EQUIPMENT,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_COMMAND_EVA,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_AIRLOCK,
	)
	additional_access = list(
		ACCESS_MEDICAL_SURGERY,
		ACCESS_MEDICAL_CHEMISTRY,
		ACCESS_MEDICAL_VIROLOGY,
		ACCESS_MEDICAL_PSYCH,
	)

	departments = list(/datum/department/medical::id)

	alt_titles = list(/datum/prototype/alt_title/emt::id)

/datum/prototype/alt_title/emt
	id = "AltParamedicEmt"
	parent_role = /datum/prototype/role/job/paramedic::id
	title = "Emergency Medical Technician"
	menu_blurb = "An Emergency Medical Technician is primarily concerned with the stabilization and recovery of patients who are unable to make it to the Medical Department on their own. They are capable of keeping a patient stabilized until they reach the hands of someone with more training."
	outfit = /datum/outfit/job/station/paramedic/emt

/datum/outfit/job/station/paramedic
	name = OUTFIT_JOB_NAME("Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/boots/jackboots
	l_hand = /obj/item/storage/firstaid/regular
	belt = /obj/item/storage/belt/medical/emt
	pda_slot = SLOT_ID_LEFT_POCKET
	id_type = /obj/item/card/id/medical/paramedic
	l_ear = /obj/item/radio/headset/headset_med
	pda_type = /obj/item/pda/medical

	backpack = /obj/item/storage/backpack/medic
	satchel_one = /obj/item/storage/backpack/satchel/med
	messenger_bag = /obj/item/storage/backpack/messenger/med
	dufflebag = /obj/item/storage/backpack/dufflebag/emt

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/datum/outfit/job/station/paramedic/emt
	name = OUTFIT_JOB_NAME("Emergency Medical Technician")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/emt
