/datum/prototype/role/job/chef
	id = "JobNtChef"
	title = "Chef"

	menu_blurb = "A Chef cooks food for the crew. They generally have permission to charge for food or deny service to unruly diners."

	spawn_blurb = "Operate the Kitchen, Appease your boss the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/chef
	selection_color = "#515151"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_GENERAL_KITCHEN,
	)
	additional_access = list(
		ACCESS_GENERAL_BAR,
		ACCESS_GENERAL_BOTANY,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(
		/datum/prototype/alt_title/chef/souschef::id,
		/datum/prototype/alt_title/chef/kitchen_worker::id,
		/datum/prototype/alt_title/chef/line::id,
		/datum/prototype/alt_title/chef/cook::id,
	)

/datum/prototype/alt_title/chef
	parent_role = /datum/prototype/role/job/chef::id
	abstract_type = /datum/prototype/alt_title/chef

/datum/prototype/alt_title/chef/souschef
	id = "AltChefSous"
	title = "Sous-chef"

/datum/prototype/alt_title/chef/kitchen_worker
	id = "AltChefKitchenWorker"
	title = "Kitchen Worker"
	menu_blurb = "A Kitchen Worker has the same duties as a Chef, though they may be less experienced."

/datum/prototype/alt_title/chef/line
	id = "AltChefLine"
	title = "Line Cook"

/datum/prototype/alt_title/chef/cook
	id = "AltChefCook"
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
