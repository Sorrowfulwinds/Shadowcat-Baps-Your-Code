/datum/prototype/role/job/miner
	//? Basic Info
	id = "JobNtMiner"
	title = "Shaft Miner"

	menu_blurb = "A Shaft Miner mines and processes minerals to be delivered to departments that need them."

	spawn_blurb = "You report to the Quartermaster and the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/shaft_miner
	economy_payscale = ECONOMY_PAYSCALE_JOB_DANGER

	minimal_access = list(
		ACCESS_SUPPLY_MINE,
		ACCESS_SUPPLY_MINE_OUTPOST,
		ACCESS_SUPPLY_MAIN,
		ACCESS_SUPPLY_BAY,
		ACCESS_SUPPLY_MULEBOT,
	)
	additional_access = list(
		ACCESS_ENGINEERING_MAINT,
	)

	selection_color =  "#7a4f33"
	departments = list(
		/datum/department/cargo::id,
	)
	sorting_order = 3
	alt_titles = list(
		/datum/prototype/alt_title/miner/drill_tech::id,
		/datum/prototype/alt_title/miner/belt::id,
		/datum/prototype/alt_title/miner/apprenticemine::id,
		/datum/prototype/alt_title/miner/apprenticesalv::id,
		/datum/prototype/alt_title/miner/salvage::id,
	)

/datum/prototype/alt_title/miner
	parent_role = /datum/prototype/role/job/miner::id
	abstract_type = /datum/prototype/alt_title/miner

/datum/prototype/alt_title/miner/drill_tech
	id = "AltMinerDrillTech"
	title = "Drill Technician"
	menu_blurb = "A Drill Technician specializes in operating and maintaining the machinery needed to extract ore from veins deep below the surface."

/datum/prototype/alt_title/miner/belt
	id = "AltMinerBelt"
	title = "Belt Miner"

/datum/prototype/alt_title/miner/apprenticemine
	id = "AltMinerApprentice"
	title = "Apprentice Miner"
	menu_blurb = "An Apprentice Miner is still learning about the typical grind of a miner, and should seek the guidance of other miners and salvagers for direction."

/datum/prototype/alt_title/miner/apprenticesalv
	id = "AltMinerApprenticeSalv"
	title = "Apprentice Salvager"
	menu_blurb = "An Apprentice Salvager is still learning about the typical grind of a salvager, and should seek the guidance of other miners and salvagers for direction."

/datum/prototype/alt_title/miner/salvage
	id = "AltMinerSalvage"
	title = "Salvage Technician"
	menu_blurb = "A Salvage Technician specialized in traveling to wrecks and stripping them of useful items and materials."

/datum/outfit/job/station/shaft_miner
	name = OUTFIT_JOB_NAME("Shaft Miner")
	uniform = /obj/item/clothing/under/rank/miner
	l_ear = /obj/item/radio/headset/headset_mine
	backpack = /obj/item/storage/backpack/industrial
	satchel_one  = /obj/item/storage/backpack/satchel/eng
	id_type = /obj/item/card/id/cargo/mining
	pda_type = /obj/item/pda/shaftminer
	backpack_contents = list(/obj/item/tool/crowbar = 1, /obj/item/storage/bag/ore = 1)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
