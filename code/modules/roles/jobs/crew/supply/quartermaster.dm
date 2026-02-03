/datum/prototype/role/job/quartermaster
	//? Basic Info
	id = "JobNtQuartermaster"
	title = "Quartermaster"

	menu_blurb = "The Quartermaster manages the Supply department under the Head of Personnel, checking cargo orders and ensuring supplies get to where they are needed."

	spawn_blurb = "As the manager of the Supply department you report to the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/quartermaster
	economy_payscale = ECONOMY_PAYSCALE_JOB_SENIOR

	minimal_access = list(
		ACCESS_ENGINEERING_MAINT,
		ACCESS_SUPPLY_BAY,
		ACCESS_SUPPLY_EDIT,
		ACCESS_SUPPLY_MAIN,
		ACCESS_SUPPLY_MINE,
		ACCESS_SUPPLY_MINE_OUTPOST,
		ACCESS_SUPPLY_MULEBOT,
		ACCESS_SUPPLY_QM,
	)

	selection_color =  "#9b633e"
	departments = list(
		/datum/department/cargo::id,
	)
	sorting_order = 4 //Senior because qm is a quasi-head
	departments_managed = list(/datum/department/cargo::name)
	department_accounts = list(/datum/department/cargo::name)

	alt_titles = list(
		/datum/prototype/alt_title/supply_chief::id,
		/datum/prototype/alt_title/logi_man::id,
		)

/datum/prototype/alt_title/supply_chief
	id = "AltQmSupplyChief"
	parent_role = /datum/prototype/role/job/quartermaster::id
	title = "Supply Chief"

/datum/prototype/alt_title/logi_man
	id = "AltQmLogiMan"
	parent_role = /datum/prototype/role/job/quartermaster::id
	title= "Logistics Manager"

/datum/outfit/job/station/quartermaster
	name = OUTFIT_JOB_NAME("Quartermaster")
	uniform = /obj/item/clothing/under/rank/cargo
	l_ear = /obj/item/radio/headset/headset_mine
	shoes = /obj/item/clothing/shoes/brown
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	id_type = /obj/item/card/id/cargo/head
	pda_type = /obj/item/pda/quartermaster
