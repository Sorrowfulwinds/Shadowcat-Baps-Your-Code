/datum/prototype/role/job/assistant
	//? Basic Info
	id = "JobNtAssistant"
	title = "Assistant"

	menu_blurb = "Assist the station."

	spawn_blurb = "You report to no one. Self-actualize!\n"

	outfit = /datum/outfit/job/station/assistant
	selection_color =  "#515151"
	sorting_order = 1

	departments = list(/datum/department/civilian::id)

	alt_titles = list(
		/datum/prototype/alt_title/visitor::id,
		/datum/prototype/alt_title/server::id,
		/datum/prototype/alt_title/morale_officer::id,
	)

/datum/prototype/alt_title/visitor
	id = "AltCivVisitor"
	parent_role = /datum/prototype/role/job/assistant::id
	title = "Visitor"
	outfit = /datum/outfit/job/station/assistant/visitor
	menu_blurb = "An approved visitor to the station."
	spawn_blurb = "You are an approved visitor. You do not work here."

/datum/prototype/alt_title/server
	id = "AltCivServer"
	parent_role = /datum/prototype/role/job/assistant::id
	title = "Server"
	outfit = /datum/outfit/job/station/assistant/server
	menu_blurb = "An underpaid server for the dining facilities"
	spawn_blurb = "You are a server. Assist the dining staff."

/datum/prototype/alt_title/morale_officer
	id = "AltCivMoraleOfficer"
	parent_role = /datum/prototype/role/job/assistant::id
	title = "Morale Officer"


/datum/outfit/job/station/assistant
	name = OUTFIT_JOB_NAME("Assistant")
	id_type = /obj/item/card/id/assistant

/datum/outfit/job/station/assistant/server
	name = OUTFIT_JOB_NAME("Server")
	uniform = /obj/item/clothing/under/waiter
	l_ear = /obj/item/radio/headset/headset_service

/datum/outfit/job/station/assistant/visitor
	name = OUTFIT_JOB_NAME("Visitor")
	id_pda_assignment = "Visitor"
	uniform = /obj/item/clothing/under/assistantformal
