/datum/prototype/role/job/atmo_tech
	id = "JobNtAtmoTech"
	title = "Atmospherics Technician"

	menu_blurb = "An Atmospheric Technician is primarily concerned with keeping the station's atmosphere breathable. They are expected to have a good understanding of the pipes, vents, and scrubbers that move gasses around the station, and to be familiar with proper firefighting procedure."

	spawn_blurb = "You work in the Engineering department and report to the Chief Engineer."

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/atmospherics_technician
	selection_color =  "#5B4D20"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_ENGINEERING_MAIN,
		ACCESS_ENGINEERING_ATMOS,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_TRIAGE,
		ACCESS_ENGINEERING_CONSTRUCTION,
		ACCESS_ENGINEERING_AIRLOCK,
	)
	additional_access = list(
		ACCESS_ENGINEERING_ENGINE,
		ACCESS_ENGINEERING_TECHSTORAGE,
	)

	departments = list(/datum/department/engineering::id)

	alt_titles = list(
		/datum/prototype/alt_title/atmotech/life_support::id,
		/datum/prototype/alt_title/atmotech/pipe_spec::id,
		/datum/prototype/alt_title/atmotech/disposals_tech::id,
		)

/datum/prototype/alt_title/atmotech
	abstract_type = /datum/prototype/alt_title/atmotech
	parent_role = /datum/prototype/role/job/atmo_tech::id

/datum/prototype/alt_title/atmotech/life_support
	id = "AltAtmoLifeSupport"
	title = "Life Support Technician"
	menu_blurb = "A Life Support Technician is an Atmospheric Technician who specializes in establishing and maintaining breathable air in a needed area, whether that's the primary facility or a forward base."

/datum/prototype/alt_title/atmotech/pipe_spec
	id = "AltAtmoPipeSpec"
	title = "Pipe Network Specialist"
	menu_blurb = "A Pipe Network Specialist is an Atmospheric Technician who specializes in the complicated art of pipe networks."

/datum/prototype/alt_title/atmotech/disposals_tech
	id = "AltAtmoDisposalTech"
	title = "Disposals Technician"
	menu_blurb = "A Disposals Technician is an Atmospheric Technician still and can fulfill all the same duties, although specializes more in disposals delivery system's operations and configurations."

/datum/outfit/job/station/atmospherics_technician
	name = OUTFIT_JOB_NAME("Atmospheric technician")
	uniform = /obj/item/clothing/under/rank/atmospheric_technician
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
