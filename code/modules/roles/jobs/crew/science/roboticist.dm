/datum/prototype/role/job/roboticist
	id = "JobNtRoboticist"
	title = "Roboticist"

	menu_blurb = "A Roboticist maintains and repairs the station's synthetics, including crew with prosthetic limbs. They can also assist the station by producing simple robots and even pilotable exosuits."

	spawn_blurb = "You work in the science department and report to the Research Director."

	minimum_player_age = 7
	outfit = /datum/outfit/job/station/roboticist
	selection_color = "#633D63"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_ENGINEERING_TECHSTORAGE,
		ACCESS_SCIENCE_ROBOTICS,
		ACCESS_SCIENCE_MAIN,
	)
	additional_access = list(
		ACCESS_SCIENCE_FABRICATION,
		ACCESS_SCIENCE_TOXINS,
		ACCESS_MEDICAL_MORGUE,
	)

	departments = list(/datum/department/research::id)

	alt_titles = list(
		/datum/prototype/alt_title/junior_roboticist::id,
		/datum/prototype/alt_title/biomech::id,
		/datum/prototype/alt_title/mech_tech::id,
	)

/datum/prototype/alt_title/junior_roboticist
	id = "AltRoboticistJuinor"
	title = "Junior Roboticist"
	sorting_order = SSR_JUINOR
	menu_blurb = "A Junior Roboticist is someone still learning the field of robotics and should seek guidance from other roboticists and the research seniors and lead."

/datum/prototype/alt_title/biomech
	id = "AltRoboticistBiomech"
	title = "Biomechanical Engineer"
	menu_blurb = "A Biomechanical Engineer primarily works on prosthetics, and the organic parts attached to them. They may have some knowledge of the relatively simple surgical procedures used in making cyborgs and attaching prosthesis."

/datum/prototype/alt_title/mech_tech
	id = "AltRoboticistMechTech"
	title = "Mechatronic Engineer"
	menu_blurb = "A Mechatronic Engineer focuses on the construction and maintenance of Exosuits, and should be well versed in their use. They may also be called upon to work on synthetics and prosthetics, if needed."

/datum/outfit/job/station/roboticist
	name = OUTFIT_JOB_NAME("Roboticist")
	uniform = /obj/item/clothing/under/rank/roboticist
	shoes = /obj/item/clothing/shoes/black
	belt = /obj/item/storage/belt/utility/full

	id_type = /obj/item/card/id/science/roboticist
	pda_slot = SLOT_ID_RIGHT_POCKET
	pda_type = /obj/item/pda/roboticist
	l_ear = /obj/item/radio/headset/headset_sci

	backpack = /obj/item/storage/backpack
	satchel_one = /obj/item/storage/backpack/satchel/norm
	messenger_bag = /obj/item/storage/backpack/messenger/tox
	dufflebag = /obj/item/storage/backpack/dufflebag/sci

