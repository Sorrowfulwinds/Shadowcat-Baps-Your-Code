/datum/prototype/role/job/senior_researcher
	id = "JobNtSeniorResearcher"
	title = "Senior Researcher"

	menu_blurb = "A Senior Researcher fulfills similar duties to other scientists, but usually occupies spare time with with training of other, newer scientists and giving advice to ensure safety. You are not in command of the Science department, but should assist the RD in accordance with Standard Operating Procedures."

	spawn_blurb = "You work in the science department and report to the Research Director."

	minimum_player_age = 14
	outfit = /datum/outfit/job/station/scientist/senior_researcher
	economy_payscale = ECONOMY_PAYSCALE_JOB_SENIOR
	selection_color = "#633D63"
	sorting_order = 4
	minimum_character_age = 25

	minimal_access = list(
		ACCESS_SCIENCE_FABRICATION,
		ACCESS_SCIENCE_TOXINS,
		ACCESS_SCIENCE_MAIN,
		ACCESS_SCIENCE_ROBOTICS,
		ACCESS_SCIENCE_XENOARCH,
		ACCESS_SCIENCE_XENOBIO,
		ACCESS_SCIENCE_XENOBOTANY,
		ACCESS_SCIENCE_GENETICS,
	)

	departments = list(/datum/department/research::id)

	alt_titles = list(/datum/prototype/alt_title/sci_trainer::id)

/datum/prototype/alt_title/sci_trainer
	id = "AltSeniorResearcherTrainer"
	parent_role = /datum/prototype/role/job/senior_researcher::id
	title = "Research Training Specialist"
	menu_blurb = "An Research Training Specialist is an experienced scientist who dedicates their time and expertise to the training of those who are less knowledgeable."

/datum/outfit/job/station/scientist/senior_researcher
	name = OUTFIT_JOB_NAME("Scientist")
	uniform = /obj/item/clothing/under/rank/scientist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	l_ear = /obj/item/radio/headset/headset_sci
	shoes = /obj/item/clothing/shoes/white

	id_type = /obj/item/card/id/science/scientist
	pda_type = /obj/item/pda/science
	pda_slot = SLOT_ID_LEFT_POCKET

	backpack = /obj/item/storage/backpack/toxins
	satchel_one = /obj/item/storage/backpack/satchel/tox
	messenger_bag = /obj/item/storage/backpack/messenger/tox
	dufflebag = /obj/item/storage/backpack/dufflebag/sci
