/datum/prototype/role/job/trader
	id = "JobNebulaTrader"
	title = "Trader"

	menu_blurb = "You are an <b>non-antagonist</b> trader! Within the rules, try to provide interesting interaction for the crew. Try to make sure other players have <i>fun</i>! If you are confused or at a loss, always adminhelp, and before taking extreme actions, please try to also contact the administration! Think through your actions and make the roleplay immersive! <b>Please remember all rules apply to you.</b>"

	spawn_blurb = "As a crewmember of the Beruang, you answer to your manager and international laws of space."

	team = JOB_FACTION_TRADEPORT
	minimum_player_age = 14
	outfit = /datum/outfit/trade
	selection_color =  "#afccb8"
	sorting_order = SSR_STANDARD
	instancer = /datum/role_instantiator/job_trader

	minimal_access = list(
		ACCESS_FACTION_TRADER,
		ACCESS_ENGINEERING_AIRLOCK
		)

	departments = list(/datum/department/misc::id)

	alt_titles = list(
		/datum/prototype/alt_title/supply_chief::id,
		/datum/prototype/alt_title/logi_man::id,
		)

/datum/prototype/alt_title/merchant
	id = "AltTraderMerchant"
	title = "Merchant"

/datum/prototype/alt_title/trade_manager
	id = "AltTraderManager"
	sorting_order = SSR_SENIOR
	title= "Trade Manager"

/datum/outfit/trade
	name = OUTFIT_JOB_NAME("Trader")
	shoes = /obj/item/clothing/shoes/black
	gloves = /obj/item/clothing/gloves/brown
	back = /obj/item/storage/backpack/satchel
	l_ear = /obj/item/radio/headset/trader
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/trader_coveralls
	id_slot = SLOT_ID_WORN_ID
	id_type = /obj/item/card/id/external/merchant
	pda_slot = SLOT_ID_RIGHT_POCKET
	pda_type = /obj/item/pda/chef //cause I like the look
	id_pda_assignment = "Trader"
