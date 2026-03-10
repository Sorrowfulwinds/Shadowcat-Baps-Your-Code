/datum/prototype/role/job/janitor
	id = "JobNtJanitor"
	title = "Janitor"

	menu_blurb = "A Janitor keeps the station clean, as long as it doesn't interfere with active crime scenes."

	spawn_blurb = "Clean floors, Appease your boss the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/janitor

	minimal_access = list(
		ACCESS_GENERAL_JANITOR,
	)
	additional_access = list(
		ACCESS_ENGINEERING_MAINT,
	)

	selection_color = "#515151"
	departments = list(
		/datum/department/civilian::id,
	)
	sorting_order = 3
	alt_titles = list(
		/datum/prototype/alt_title/janitor/custodian::id,
		/datum/prototype/alt_title/janitor/tech::id,
		/datum/prototype/alt_title/janitor/gorecleaner::id,
		/datum/prototype/alt_title/janitor/maid::id,
	)

/datum/prototype/alt_title/janitor
	parent_role = /datum/prototype/role/job/janitor::id
	abstract_type = /datum/prototype/alt_title/janitor

/datum/prototype/alt_title/janitor/custodian
	id = "AltJanitorCustodian"
	title = "Custodian"

/datum/prototype/alt_title/janitor/tech
	id = "AltJanitorTech"
	title = "Sanitation Technician"

/datum/prototype/alt_title/janitor/gorecleaner
	id = "AltJanitorViscera"
	title = "Viscera Cleaner"

/datum/prototype/alt_title/janitor/maid
	id = "AltJanitorMaid"
	title = "Maid"
	outfit = /datum/outfit/job/station/janitor/maid

/datum/outfit/job/station/janitor
	name = OUTFIT_JOB_NAME("Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	id_type = /obj/item/card/id/civilian/janitor
	pda_type = /obj/item/pda/janitor
	l_ear = /obj/item/radio/headset/headset_service

/datum/outfit/job/station/janitor/maid
	name = OUTFIT_JOB_NAME("Maid")
	uniform = /obj/item/clothing/under/dress/maid
	head = /obj/item/clothing/head/headband/maid
