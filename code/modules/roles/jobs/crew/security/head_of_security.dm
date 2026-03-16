/datum/prototype/role/job/head_of_security
	id = "JobNtHos"
	title = "Head of Security"

	menu_blurb = "The Head of Security manages the Security Department, keeping the station safe and making sure the rules are followed. They are expected to keep the other Department Heads, and the rest of the crew, aware of developing situations that may be a threat. If necessary, the HoS may perform the duties of absent Security roles, such as distributing gear from the Armory."

	spawn_blurb = CAPTAIN_REPORTEE + IMPORTANT_JOB_TELL_ADMINS

	minimum_player_age = 14
	outfit = /datum/outfit/job/station/head_of_security
	selection_color = "#8E2929"
	sorting_order = SSR_BOSS
	minimum_character_age = 25
	allow_jobhop = FALSE

	minimal_access = list(
		ACCESS_COMMAND_ANNOUNCE,
		ACCESS_COMMAND_BRIDGE,
		ACCESS_COMMAND_EVA,
		ACCESS_COMMAND_KEYAUTH,
		ACCESS_COMMAND_LOCKERS,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_GENERAL_GATEWAY,
		ACCESS_SECURITY_ARMORY,
		ACCESS_SECURITY_BRIG,
		ACCESS_SECURITY_EDIT,
		ACCESS_SECURITY_EQUIPMENT,
		ACCESS_SECURITY_FORENSICS,
		ACCESS_SECURITY_HOS,
		ACCESS_SECURITY_MAIN,
		ACCESS_SECURITY_GENPOP_ENTER,
		ACCESS_SECURITY_GENPOP_EXIT,
	)
	additional_access = list(
		ACCESS_ENGINEERING_CONSTRUCTION,
		ACCESS_ENGINEERING_MAIN,
		ACCESS_MEDICAL_MAIN,
		ACCESS_SCIENCE_MAIN,
		ACCESS_SUPPLY_MAIN,
		ACCESS_SUPPLY_MINE,
	)

	departments = list(
		/datum/department/security::id,
		/datum/department/command::id,
	)

	departments_managed = list(/datum/department/security::name)
	department_accounts = list(/datum/department/security::name)

	alt_titles = list(
		/datum/prototype/alt_title/hos/commander::id,
		/datum/prototype/alt_title/hos/chief::id,
		/datum/prototype/alt_title/hos/director::id,
	)

/datum/prototype/alt_title/hos
	parent_role = /datum/prototype/role/job/head_of_security::id
	abstract_type = /datum/prototype/alt_title/hos

/datum/prototype/alt_title/hos/commander
	id = "AltHosCommander"
	title = "Security Commander"

/datum/prototype/alt_title/hos/chief
	id = "AltHosChief"
	title = "Chief of Security"

/datum/prototype/alt_title/hos/director
	id = "AltHosDirector"
	title = "Defense Director"

/datum/outfit/job/station/head_of_security
	name = OUTFIT_JOB_NAME("Head of security")
	l_ear = /obj/item/radio/headset/heads/hos
	uniform = /obj/item/clothing/under/rank/head_of_security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots
	belt = /obj/item/storage/belt/security/nt_isd_preload

	// todo below
	// belt = /obj/item/storage/belt/security/nt_isd_preload

	id_type = /obj/item/card/id/security/head
	pda_type = /obj/item/pda/heads/hos

	backpack = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/handcuffs = 1)
	satchel_one = /obj/item/storage/backpack/satchel/sec
	messenger_bag = /obj/item/storage/backpack/messenger/sec
	dufflebag = /obj/item/storage/backpack/dufflebag/sec
