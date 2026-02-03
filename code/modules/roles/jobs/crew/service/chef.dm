/datum/prototype/role/job/chef
	id = "JobNtChef"
	title = "Chef"

	menu_blurb = "A Chef cooks food for the crew. They generally have permission to charge for food or deny service to unruly diners."

	spawn_blurb = "Operate the Kitchen, Appease your boss the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/chef

	minimal_access = list(
		ACCESS_GENERAL_KITCHEN,
	)
	additional_access = list(
		ACCESS_GENERAL_BAR,
		ACCESS_GENERAL_BOTANY,
	)

	selection_color = "#515151"
	departments = list(
		/datum/department/civilian::id,
	)
	sorting_order = 3
	alt_titles = list(
		/datum/prototype/alt_title/chef/souschef::id,
		/datum/prototype/alt_title/chef/kitchen_worker::id,
		/datum/prototype/alt_title/chef/line::id,
		/datum/prototype/alt_title/chef/cook::id,
	)

/datum/prototype/alt_title/chef
	abstract_type = /datum/prototype/alt_title/chef

/datum/prototype/alt_title/chef/souschef
	id = "AltChefSous"
	parent_role = /datum/prototype/role/job/chef::id
	title = "Sous-chef"

/datum/prototype/alt_title/chef/kitchen_worker
	id = "AltChefKitchenWorker"
	parent_role = /datum/prototype/role/job/chef::id
	title = "Kitchen Worker"
	menu_blurb = "A Kitchen Worker has the same duties as a Chef, though they may be less experienced."

/datum/prototype/alt_title/chef/line
	id = "AltChefLine"
	parent_role = /datum/prototype/role/job/chef::id
	title = "Line Cook"

/datum/prototype/alt_title/chef/cook
	id = "AltChefCook"
	parent_role = /datum/prototype/role/job/chef::id
	title = "Cook"
	menu_blurb = "A Cook has the same duties as a Chef, though they may be less experienced."

/datum/outfit/job/station/chef
	name = OUTFIT_JOB_NAME("Chef")
	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/chef
	head = /obj/item/clothing/head/chefhat
	id_type = /obj/item/card/id/civilian/chef
	pda_type = /obj/item/pda/chef
	l_ear = /obj/item/radio/headset/headset_service
