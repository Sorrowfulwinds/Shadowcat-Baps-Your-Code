/datum/prototype/role/job/pilot
	id = "JobNtPilot"
	title = "Pilot"

	menu_blurb = "A Pilot flies the various shuttles attached to the installation."

	spawn_blurb = "You fly shuttles and report to the Head of Personnel.\n"

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/pilot
	economy_payscale = ECONOMY_PAYSCALE_JOB_HELM
	selection_color = "#515151"
	sorting_order = 3

	minimal_access = list(
		ACCESS_GENERAL_PILOT,
		ACCESS_ENGINEERING_AIRLOCK,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(
		/datum/prototype/alt_title/pilot/junior::id,
		/datum/prototype/alt_title/pilot/navigator::id,
		)

/datum/prototype/alt_title/pilot
	parent_role = /datum/prototype/role/job/pilot::id
	abstract_type = /datum/prototype/alt_title/pilot

/datum/prototype/alt_title/pilot/junior
	id = "AltPilotJunior"
	title = "Junior Pilot"
	menu_blurb = "A Junior Pilot is still a trainee, here to learn from the Pilot and assist them. They are not qualified to pilot a shuttlecraft solo."

/datum/prototype/alt_title/pilot/navigator
	id = "AltPilotNavigator"
	title = "Navigator"

/datum/outfit/job/station/pilot
	name = OUTFIT_JOB_NAME("Pilot")
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	l_ear = /obj/item/radio/headset/pilot/alt
	id_slot = SLOT_ID_WORN_ID
	pda_slot = SLOT_ID_BELT
	pda_type = /obj/item/pda
	id_type = /obj/item/card/id/explorer/pilot
	id_pda_assignment = "Pilot"
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
