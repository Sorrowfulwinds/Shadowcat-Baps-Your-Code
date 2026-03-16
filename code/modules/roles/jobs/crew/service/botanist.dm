/datum/prototype/role/job/botanist
	id = "JobNtBotanist"
	title = "Botanist"

	menu_blurb = "A Botanist grows plants for the Chef and Bartender."

	spawn_blurb = "Grow plants for the Chef and Bartender. Appease your boss the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/botanist
	selection_color = "#515151"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_GENERAL_BOTANY,
	)
	additional_access = list(
		ACCESS_GENERAL_BAR,
		ACCESS_GENERAL_KITCHEN,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(/datum/prototype/alt_title/gardener::id)

/datum/prototype/alt_title/gardener
	id = "AltBotanistGardener"
	title = "Gardener"
	menu_blurb = "A Gardener may be less professional than their counterparts, and are more likely to tend to the public gardens if they aren't needed elsewhere."
	outfit = /datum/outfit/job/station/botanist/gardener

/datum/outfit/job/station/botanist
	name = OUTFIT_JOB_NAME("Botanist")
	pda_type = /obj/item/pda/botanist
	id_type = /obj/item/card/id/civilian/botanist
	l_ear = /obj/item/radio/headset/headset_service

	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/storage/apron
	suit_store = /obj/item/plant_analyzer
	gloves = /obj/item/clothing/gloves/botanic_leather

	backpack = /obj/item/storage/backpack/hydroponics
	satchel_one = /obj/item/storage/backpack/satchel/hyd
	messenger_bag = /obj/item/storage/backpack/messenger/hyd
	dufflebag = /obj/item/storage/backpack/dufflebag/hydroponics

/datum/outfit/job/station/botanist/gardener
	name = OUTFIT_JOB_NAME("Gardener")
	id_pda_assignment = "Gardener"
