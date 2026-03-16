/datum/prototype/role/job/bartender
	id = "JobNtBartender"
	title = "Bartender"

	menu_blurb = "A Bartender mixes drinks for the crew. They generally have permission to charge for drinks or deny service to unruly patrons."

	spawn_blurb = "Operate the Bar. Appease your boss the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/bartender
	selection_color = "#515151"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_GENERAL_BAR,
	)
	additional_access = list(
		ACCESS_GENERAL_BOTANY,
		ACCESS_GENERAL_KITCHEN,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(
		/datum/prototype/alt_title/bartender/barkeeper::id,
		/datum/prototype/alt_title/bartender/barmaid::id,
		/datum/prototype/alt_title/bartender/barista::id,
	)

/datum/prototype/alt_title/bartender/barkeeper
	id = "AltBarKeep"
	parent_role = /datum/prototype/role/job/bartender::id
	title = "Barkeeper"

/datum/prototype/alt_title/bartender/barmaid
	id = "AltBarMaid"
	parent_role = /datum/prototype/role/job/bartender::id
	title = "Barmaid"

/datum/prototype/alt_title/bartender/barista
	id = "AltBarBarista"
	parent_role = /datum/prototype/role/job/bartender::id
	title = "Barista"
	menu_blurb = "A barista mans the Cafe, serving primarily non-alcoholic drinks to the crew. They generally have permission to charge for drinks or deny service to unruly patrons."
	spawn_blurb = "Operate the Cafe. Appease your boss the Head of Personnel.\n"
	outfit = /datum/outfit/job/station/bartender/barista

/datum/outfit/job/station/bartender
	name = OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	id_type = /obj/item/card/id/civilian/bartender
	pda_type = /obj/item/pda/bar
	l_ear = /obj/item/radio/headset/headset_service
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/bar = 1)

/datum/outfit/job/station/bartender/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/bar/permit in H.back.contents)
		permit.set_name(H.real_name)

/datum/outfit/job/station/bartender/barista
	name = OUTFIT_JOB_NAME("Barista")
	id_pda_assignment = "Barista"
	backpack_contents = null
