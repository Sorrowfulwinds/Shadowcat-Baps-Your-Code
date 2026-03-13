/datum/prototype/role/job/clown
	id = "JobNtClown"
	title = "Clown"

	menu_blurb = "A Clown is there to entertain the crew and keep high morale using various harmless pranks and ridiculous jokes!"

	spawn_blurb = "You report to the spirit of laughter./n"

	outfit = /datum/outfit/job/station/clown
	economy_payscale = ECONOMY_PAYSCALE_JOB_SENIOR
	selection_color = "#515151"
	sorting_order = 4
	whitelisted = TRUE

	minimal_access = list(
		ACCESS_GENERAL_ENTERTAINMENT,
		ACCESS_GENERAL_CLOWN,
		ACCESS_GENERAL_TOMFOOLERY,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(
		/datum/prototype/alt_title/jester::id,
		/datum/prototype/alt_title/fool::id,
		)

/datum/prototype/alt_title/jester
	id = "AltClownJester"
	parent_role = /datum/prototype/role/job/clown::id
	title = "Jester"

/datum/prototype/alt_title/fool
	id = "AltClownFool"
	parent_role = /datum/prototype/role/job/clown::id
	title = "Fool"

/datum/outfit/job/station/clown
	name = OUTFIT_JOB_NAME("Clown")
	shoes = /obj/item/clothing/shoes/clown_shoes
	uniform = /obj/item/clothing/under/rank/clown
	mask = /obj/item/clothing/mask/gas/clown_hat
	r_pocket = /obj/item/bikehorn
	l_ear = /obj/item/radio/headset
	id_slot = SLOT_ID_WORN_ID
	id_type = /obj/item/card/id/civilian
	pda_slot = SLOT_ID_BELT
	pda_type = /obj/item/pda/clown
	id_pda_assignment = "Clown"

	backpack = /obj/item/storage/backpack/clown
	dufflebag = /obj/item/storage/backpack/dufflebag/clown
