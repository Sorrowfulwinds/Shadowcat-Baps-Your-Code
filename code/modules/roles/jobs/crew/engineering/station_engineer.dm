/datum/prototype/role/job/engineer
	id = "JobNtStationEngineer"
	title = "Station Engineer"

	menu_blurb = "A Station Engineer keeps the facility running. They repair damages, keep the atmosphere stable, and ensure that power is being generated and distributed. On quiet shifts, they may be called upon to make cosmetic alterations to the facility."

	spawn_blurb = "You work in the Engineering department and report to the Chief Engineer."

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/station_engineer
	selection_color =  "#5B4D20"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_ENGINEERING_MAIN,
		ACCESS_ENGINEERING_ENGINE,
		ACCESS_ENGINEERING_TECHSTORAGE,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_ENGINEERING_CONSTRUCTION,
	)
	additional_access = list(
		ACCESS_ENGINEERING_ATMOS,
	)

	departments = list(/datum/department/engineering::id)

	alt_titles = list(
		/datum/prototype/alt_title/engi/maint_tech::id,
		/datum/prototype/alt_title/engi/engine_tech::id,
		/datum/prototype/alt_title/engi/electrician::id,
		/datum/prototype/alt_title/engi/apprentice_engineer::id,
		/datum/prototype/alt_title/engi/construction_engi::id,
		/datum/prototype/alt_title/engi/damage_tech::id,
	)

/datum/prototype/alt_title/engi
	abstract_type = /datum/prototype/alt_title/engi

/datum/prototype/alt_title/engi/maint_tech
	id = "AltEngiMaintTech"
	title = "Maintenance Technician"
	sorting_order = SSR_JUINOR
	menu_blurb = "A Maintenance Technician is generally a junior Engineer, and can be expected to run the mildly unpleasant or boring tasks that other Engineers don't care to do."

/datum/prototype/alt_title/engi/engine_tech
	id = "AltEngiEngineTech"
	title = "Engine Technician"
	menu_blurb = "An Engine Technician tends to the primary engine, whatever form it takes. They are expected to be able to keep it stable, and possibly even run it beyond normal tolerances."

/datum/prototype/alt_title/engi/electrician
	id = "AltEngiElectrician"
	title = "Electrician"
	menu_blurb = "An Electrician's primary duty is making sure power is properly distributed throughout the facility, utilizing solars, substations, and other methods to ensure every department has power in an emergency."

/datum/prototype/alt_title/engi/apprentice_engineer
	id = "AltEngiApprentice"
	title = "Apprentice Engineer"
	sorting_order = SSR_JUINOR
	menu_blurb = "An Apprentice Engineer is still learning the art of engineering, and should listen to other engineers for direction."

/datum/prototype/alt_title/engi/construction_engi
	id = "AltEngiConstruction"
	title = "Construction Engineer"
	menu_blurb = "A Construction Engineer fulfills similar duties to other engineers, but usually occupies spare time with construction of extra facilities in dedicated areas or as additions to facility layout."

/datum/prototype/alt_title/engi/damage_tech
	id = "AltEngiDamageTech"
	title = "Damage Control Technician"
	menu_blurb = "A Damage Control Technician specializes in repairing a damaged facility as quickly as possible, usually possessing good skills with both atmospherics and quick repair work."

/datum/outfit/job/station/station_engineer
	name = OUTFIT_JOB_NAME("Engineer")
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/rank/engineer
	id_type = /obj/item/card/id/engineering/engineer
	pda_type = /obj/item/pda/engineering
	l_ear = /obj/item/radio/headset/headset_eng
	belt = /obj/item/storage/belt/utility/atmostech
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/t_scanner

	id_type = /obj/item/card/id/engineering/atmos
	pda_type = /obj/item/pda/atmos

	backpack = /obj/item/storage/backpack/industrial
	satchel_one = /obj/item/storage/backpack/satchel/eng
	messenger_bag = /obj/item/storage/backpack/messenger/engi
	pda_slot = SLOT_ID_LEFT_POCKET
	dufflebag = /obj/item/storage/backpack/dufflebag/eng

	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
