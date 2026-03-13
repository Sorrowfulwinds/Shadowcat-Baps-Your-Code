/datum/prototype/role/job/mime
	id = "JobNtMime"
	title = "Mime"

	menu_blurb = "A Mime is there to entertain the crew and keep high morale using unbelievable performances and acting skills!"

	spawn_blurb = "You report to the spirit of performance./n"

	outfit = /datum/outfit/job/station/mime
	economy_payscale = ECONOMY_PAYSCALE_JOB_SENIOR
	selection_color = "#515151"
	sorting_order = 4
	whitelisted = TRUE

	minimal_access = list(
		ACCESS_GENERAL_ENTERTAINMENT,
		ACCESS_GENERAL_CLOWN,
		ACCESS_GENERAL_MIME,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(/datum/prototype/alt_title/poseur::id)

/datum/prototype/alt_title/poseur
	id = "AltMimePoseur"
	parent_role = /datum/prototype/role/job/mime::id
	title = "Poseur"

/datum/outfit/job/station/mime
	name = OUTFIT_JOB_NAME("Mime")
	shoes = /obj/item/clothing/shoes/mime
	uniform = /obj/item/clothing/under/mime
	mask = /obj/item/clothing/mask/gas/mime
	l_ear = /obj/item/radio/headset
	id_slot = SLOT_ID_WORN_ID
	r_pocket = /obj/item/pen/crayon/mime
	id_type = /obj/item/card/id/civilian
	pda_slot = SLOT_ID_BELT
	pda_type = /obj/item/pda/mime
	id_pda_assignment = "Mime"

	backpack = /obj/item/storage/backpack/mime
