/datum/prototype/role/job/internal_affairs_agent
	id = "JobNtInternalAffairsAgent"
	title = "Internal Affairs Agent"

	menu_blurb = "An Internal Affairs Agent makes sure that the crew is following Standard Operating Procedure. They also handle complaints against crew members, and can have issues brought to the attention of Central Command, assuming their paperwork is in order."

	spawn_blurb = "You report to company officials and Corporate Regulations"

	minimum_player_age = 7
	outfit = /datum/outfit/job/station/internal_affairs_agent
	selection_color = "#515151"
	sorting_order = SSR_SENIOR

	minimal_access = list(
		ACCESS_COMMAND_IAA,
		ACCESS_SECURITY_MAIN,
		ACCESS_COMMAND_BRIDGE,
	)

	departments = list(/datum/department/civilian::id)

/datum/outfit/job/station/internal_affairs_agent
	name = OUTFIT_JOB_NAME("Internal affairs agent")
	l_ear = /obj/item/radio/headset/ia
	uniform = /obj/item/clothing/under/rank/internalaffairs
	suit = /obj/item/clothing/suit/storage/toggle/internalaffairs
	shoes = /obj/item/clothing/shoes/brown
	glasses = /obj/item/clothing/glasses/sunglasses/big
	l_hand = /obj/item/clipboard
	id_type = /obj/item/card/id/civilian/internal_affairs_agent
	pda_type = /obj/item/pda/lawyer
