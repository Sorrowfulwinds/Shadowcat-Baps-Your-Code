/datum/prototype/role/job/bridge_officer
	id = "JobNtBridgeOfficer"
	title = "Bridge Officer"

	menu_blurb = "A bridge officer is often considered command staff in-training. Their duties are to assist the command staff with things like paperwork, as well as to assist in piloting the ship when deemed necessary and applicable."

	spawn_blurb = "You report to command staff."

	minimum_player_age = 5
	outfit = /datum/outfit/job/station/command_secretary/bridge_officer
	economy_payscale = ECONOMY_PAYSCALE_JOB_HELM
	selection_color = "#1D1D4F"
	sorting_order = 2

	minimal_access = list(
		ACCESS_COMMAND_BRIDGE,
		ACCESS_COMMAND_KEYAUTH,
		ACCESS_ENGINEERING_MAINT,
	)

	departments = list(/datum/department/command::id)
	department_accounts = list(/datum/department/command::name)

	alt_titles = list(
		/datum/prototype/alt_title/command_intern::id,
		/datum/prototype/alt_title/helmsman::id,
		/datum/prototype/alt_title/commsec::id,
		)

/datum/prototype/alt_title/command_intern
	id = "AltBrofIntern"
	parent_role = /datum/prototype/role/job/bridge_officer::id
	title = "Command Intern"
	outfit = /datum/outfit/job/station/command_secretary

/datum/prototype/alt_title/helmsman
	id = "AltBrofHelmsman"
	parent_role = /datum/prototype/role/job/bridge_officer::id
	title = "Helmsman"

/datum/prototype/alt_title/commsec
	id = "AltBrofCommsec"
	parent_role = /datum/prototype/role/job/bridge_officer::id
	title = "Command Secretary"
	outfit = /datum/outfit/job/station/command_secretary

/datum/outfit/job/station/command_secretary
	name = OUTFIT_JOB_NAME("Command Secretary")
	l_ear = /obj/item/radio/headset/headset_adj
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/card/id/silver/secretary
	pda_type = /obj/item/pda/heads/hop
	l_hand = /obj/item/clipboard

/datum/outfit/job/station/command_secretary/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/suit_jacket/female/skirt
	else
		uniform = /obj/item/clothing/under/suit_jacket/charcoal

/datum/outfit/job/station/command_secretary/bridge_officer
	name = OUTFIT_JOB_NAME("Bridge Officer")
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/card/id/silver/secretary
	pda_type = /obj/item/pda/heads/hop
	l_hand = /obj/item/clipboard
	head = /obj/item/clothing/head/bocap
	suit = /obj/item/clothing/suit/storage/bridgeofficer
	glasses = /obj/item/clothing/glasses/sunglasses

/datum/outfit/job/station/command_secretary/bridge_officer/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/bridgeofficerskirt
	else
		uniform = /obj/item/clothing/under/bridgeofficer
