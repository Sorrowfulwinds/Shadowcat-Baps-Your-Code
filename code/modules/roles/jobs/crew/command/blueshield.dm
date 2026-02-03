/datum/prototype/role/job/blueshield
	id = "JobNtBlueshield"
	title = "Blueshield"

	menu_blurb = "A Blueshield is concerned with maintaining the safety and security of command personnel, dealing with direct threats while not going out of their way to apprehend distant criminals. A Blueshield is directly responsible for the health and safety of the Director and other command entities, within reason. Being only one person, use your best judgement on who needs overseeing at that very moment, as well as over the course of the shift. The priority of a Blueshield is to ensure extraction and security of the client, not the apprehension or neutralization of the offender. No one is above corporate regulations however, neither Security nor Command."

	spawn_blurb = "Protect command personnel, You report to the Captain, Corporate Regulations, and the Head of Security"

	minimum_player_age = 10
	outfit = /datum/outfit/job/station/blueshield

	minimal_access = list(
		ACCESS_COMMAND_BLUESHIELD,
		ACCESS_COMMAND_BRIDGE,
		ACCESS_COMMAND_CAPTAIN,
		ACCESS_COMMAND_EVA,
		ACCESS_COMMAND_HOP,
		ACCESS_COMMAND_IAA,
		ACCESS_COMMAND_LOCKERS,
		ACCESS_COMMAND_TELEPORTER,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_ENGINEERING_CONSTRUCTION,
		ACCESS_ENGINEERING_MAIN,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_MEDICAL_MAIN,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_GENERAL_GATEWAY,
		ACCESS_SCIENCE_MAIN,
		ACCESS_SCIENCE_FABRICATION,
		ACCESS_SCIENCE_ROBOTICS,
		ACCESS_SCIENCE_XENOBIO,
		ACCESS_SECURITY_BRIG,
		ACCESS_SECURITY_EQUIPMENT,
		ACCESS_SECURITY_MAIN,
		ACCESS_SUPPLY_MAIN,
		ACCESS_SUPPLY_MINE,
	)

	departments = list(
		/datum/department/command::id,
	)
	economy_payscale = ECONOMY_PAYSCALE_JOB_COMMAND
	selection_color = "#1D1D4F"
	sorting_order = 2 //Command's lapdog

/datum/outfit/job/station/blueshield
	name = OUTFIT_JOB_NAME("Blueshield")
	uniform = /obj/item/clothing/under/oricon/utility/sysguard/crew/blueshield
	l_pocket = /obj/item/flash
	glasses = /obj/item/clothing/glasses/sunglasses/medhud
	l_ear = /obj/item/radio/headset/heads/blueshield
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots

	id_type = /obj/item/card/id/silver/blueshield
	pda_type = /obj/item/pda/heads/blueshield

	backpack = /obj/item/storage/backpack/blueshield
	satchel_one = /obj/item/storage/backpack/satchel/blueshield
	messenger_bag = /obj/item/storage/backpack/messenger/blueshield
	dufflebag = /obj/item/storage/backpack/dufflebag/blueshield
