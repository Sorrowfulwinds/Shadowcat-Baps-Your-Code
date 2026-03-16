/datum/prototype/role/job/warden
	id = "JobNtWarden"
	title = "Warden"

	menu_blurb = "The Warden watches over the physical Security Department, making sure the Brig and Armoury are secure and in order at all times. They oversee prisoners that have been processed and brigged, and are responsible for their well being. The Warden is also in charge of distributing Armoury gear in a crisis, and retrieving it when the crisis has passed. In an emergency, the Warden may be called upon to direct the Security Department as a whole."

	spawn_blurb = "You work in the Security department and report to the Head of Security."

	minimum_player_age = 5
	outfit = /datum/outfit/job/station/warden
	selection_color = "#601C1C"
	sorting_order = SSR_SENIOR

	minimal_access = list(
		ACCESS_SECURITY_EQUIPMENT,
		ACCESS_SECURITY_MAIN,
		ACCESS_SECURITY_BRIG,
		ACCESS_SECURITY_ARMORY,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_SECURITY_GENPOP_ENTER,
		ACCESS_SECURITY_GENPOP_EXIT,
	)
	additional_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_ENGINEERING_AIRLOCK,
	)

	departments = list(/datum/department/security::id)

	alt_titles = list(
		/datum/prototype/alt_title/warden/overseer::id,
		/datum/prototype/alt_title/warden/dispatch_officer::id,
	)

/datum/prototype/alt_title/warden
	parent_role = /datum/prototype/role/job/warden::id
	abstract_type = /datum/prototype/alt_title/warden

/datum/prototype/alt_title/warden/overseer
	id = "AltWardenOverseer"
	title = "Brig Overseer"

/datum/prototype/alt_title/warden/dispatch_officer
	id = "AltWardenDispatch"
	title = "Dispatch Officer"
	menu_blurb = "The Dispatch Officer fulfills the standard duties of the Warden, but also assists with dispatching officers to needed locations to lessen the load on the Head of Security."

/datum/outfit/job/station/warden
	name = OUTFIT_JOB_NAME("Warden")
	uniform = /obj/item/clothing/under/rank/warden
	l_pocket = /obj/item/flash
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	l_ear = /obj/item/radio/headset/headset_sec
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots

	// todo below
	// belt = /obj/item/storage/belt/security/nt_isd_preload

	id_type = /obj/item/card/id/security/warden
	pda_type = /obj/item/pda/warden

	backpack = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/handcuffs = 1)
	satchel_one = /obj/item/storage/backpack/satchel/sec
	messenger_bag = /obj/item/storage/backpack/messenger/sec
	dufflebag = /obj/item/storage/backpack/dufflebag/sec
