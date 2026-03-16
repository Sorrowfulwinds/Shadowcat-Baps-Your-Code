/datum/prototype/role/job/cyborg
	id = "JobNtCyborg"
	title = "Cyborg"

	menu_blurb = "A Cyborg is a mobile station synthetic, piloted by a cybernetically preserved brain. It is considered a person, but is still required to follow its Laws."

	spawn_blurb = "You follow only your Laws and the AI.\n"

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/cyborg
	selection_color = "#254C25"
	sorting_order = SSR_STANDARD
	can_assign = FALSE
	allow_jobhop = FALSE
	instancer = /datum/role_instantiator/job_borg

	departments = list(/datum/department/synthetic::id)

	alt_titles = list(
		/datum/prototype/alt_title/robot::id,
		/datum/prototype/alt_title/drone::id,
		)

/datum/prototype/alt_title/robot
	id = "AltCyborgRobot"
	title = "Robot"
	sorting_order = SSR_JUINOR
	menu_blurb = "A Robot is a mobile station synthetic, piloted by an advanced piece of technology called a Positronic Brain. It is considered a person, legally, but is required to follow its Laws."

/datum/prototype/alt_title/drone
	id = "AltCyborgDrone"
	title = "Drone"
	sorting_order = SSR_INTERN
	menu_blurb = "A Drone is a mobile station synthetic, piloted by a simple computer-based AI. As such, it is not a person, but rather an expensive and and important piece of station property, and is expected to follow its Laws."

/datum/outfit/job/station/cyborg
	name = OUTFIT_JOB_NAME("Cyborg")
	head = /obj/item/clothing/head/cardborg
	suit = /obj/item/clothing/suit/cardborg
