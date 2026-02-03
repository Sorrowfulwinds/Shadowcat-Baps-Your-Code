/datum/prototype/role/job/cyborg
	id = "JobNtCyborg"
	title = "Cyborg"

	menu_blurb = "A Cyborg is a mobile station synthetic, piloted by a cybernetically preserved brain. It is considered a person, but is still required to follow its Laws."

	spawn_blurb = "You follow only your Laws and the AI.\n"

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/cyborg

	//? Unsorted
	selection_color = "#254C25"
	departments = list(
		/datum/department/synthetic::id,
	)
	sorting_order = 3
	can_assign = FALSE
	allow_jobhop = FALSE

	alt_titles = list(
		/datum/prototype/alt_title/robot::id,
		/datum/prototype/alt_title/drone::id,
		)

/datum/prototype/alt_title/robot
	id = "AltCyborgRobot"
	parent_role = /datum/prototype/role/job/cyborg::id
	title = "Robot"
	menu_blurb = "A Robot is a mobile station synthetic, piloted by an advanced piece of technology called a Positronic Brain. It is considered a person, legally, but is required to follow its Laws."

/datum/prototype/alt_title/drone
	id = "AltCyborgDrone"
	parent_role = /datum/prototype/role/job/cyborg::id
	title = "Drone"
	menu_blurb = "A Drone is a mobile station synthetic, piloted by a simple computer-based AI. As such, it is not a person, but rather an expensive and and important piece of station property, and is expected to follow its Laws."

/datum/outfit/job/station/cyborg
	name = OUTFIT_JOB_NAME("Cyborg")
	head = /obj/item/clothing/head/cardborg
	suit = /obj/item/clothing/suit/cardborg
