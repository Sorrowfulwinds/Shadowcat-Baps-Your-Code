/datum/prototype/role/job/ai
	//? Basic Info
	id = "JobNtAi"
	title = "AI"

	menu_blurb = "The AI oversees the operation of the station and its crew, but has no real authority over them. The AI is required to follow its Laws, and Lawbound Synthetics that are linked to it are expected to follow the AI's commands, and their own Laws."

	spawn_blurb = "You follow only your Laws.\n" + IMPORTANT_JOB_TELL_ADMINS

	//? Requirements
	minimum_player_age = 7

	//? Advanced Info
	outfit = /datum/outfit/job/station/ai

	//? Unsorted
	selection_color = "#3F823F"
	departments = list(
		/datum/department/synthetic::id,
	)
	sorting_order = 5
	can_assign = FALSE
	allow_jobhop = FALSE

/datum/outfit/job/station/ai
	name = OUTFIT_JOB_NAME("AI")
	head = /obj/item/clothing/head/cardborg
	suit = /obj/item/clothing/suit/straight_jacket
