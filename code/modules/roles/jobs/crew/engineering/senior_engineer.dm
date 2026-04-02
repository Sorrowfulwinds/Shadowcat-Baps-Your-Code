/datum/prototype/role/job/senior_engineer
	id = "JobNtSeniorEngineer"
	title = "Senior Engineer"

	menu_blurb = "A Senior Engineer fulfills similar duties to other engineers, but usually occupies spare time with with training of other, newer Engineers and giving advice in tricky engineering situations. You are not in command of the Engineering department, but should assist the CE in accordance with Standard Operating Procedures."

	spawn_blurb = "You work in the Engineering department and report to the Chief Engineer."

	minimum_player_age = 14
	outfit = /datum/outfit/job/station/senior_engineer
	economy_payscale = ECONOMY_PAYSCALE_JOB_SENIOR
	selection_color =  "#5B4D20"
	sorting_order = SSR_SENIOR
	minimum_character_age = 25

	minimal_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_ENGINEERING_ATMOS,
		ACCESS_ENGINEERING_MAIN,
		ACCESS_ENGINEERING_ENGINE,
		ACCESS_ENGINEERING_TECHSTORAGE,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_ENGINEERING_CONSTRUCTION,
	)


	departments = list(/datum/department/engineering::id)

	alt_titles = list(/datum/prototype/alt_title/engi_trainer::id)

/datum/prototype/alt_title/engi_trainer
	id = "AltSenEngiTrainer"
	title = "Engineering Training Specialist"
	menu_blurb = "An Engineering Training Specialist is an experienced engineer who dedicates their time and expertise to the training of those who are less knowledgeable."

/datum/outfit/job/station/senior_engineer
	name = OUTFIT_JOB_NAME("Senior Engineer")
	head = /obj/item/clothing/head/hardhat/white
	uniform = /obj/item/clothing/under/rank/engineer
	id_type = /obj/item/card/id/engineering/engineer
	pda_type = /obj/item/pda/engineering
	l_ear = /obj/item/radio/headset/headset_eng
	belt = /obj/item/storage/belt/utility/atmostech
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/t_scanner

	id_type = /obj/item/card/id/engineering/atmos
	pda_type = /obj/item/pda/atmos

	backpack = /obj/item/storage/backpack/industrial
	satchel_one = /obj/item/storage/backpack/satchel/eng
	messenger_bag = /obj/item/storage/backpack/messenger/engi
	pda_slot = SLOT_ID_LEFT_POCKET
	dufflebag = /obj/item/storage/backpack/dufflebag/eng

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
