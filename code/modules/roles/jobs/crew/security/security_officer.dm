/datum/prototype/role/job/security_officer
	id = "JobNtSecOff"
	title = "Security Officer"

	menu_blurb = "A Security Officer is concerned with maintaining the safety and security of the station as a whole, dealing with external threats and apprehending criminals. A Security Officer is responsible for the health, safety, and processing of any prisoner they arrest. No one is above the Law, not Security or Command."

	spawn_blurb = "You work in the Security department and report to the Head of Security."

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/security_officer

	minimal_access = list(
		ACCESS_SECURITY_EQUIPMENT,
		ACCESS_COMMAND_EVA,
		ACCESS_SECURITY_MAIN,
		ACCESS_SECURITY_BRIG,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_SECURITY_GENPOP_ENTER,
		ACCESS_SECURITY_GENPOP_EXIT,
	)
	additional_access = list(
		ACCESS_MEDICAL_MORGUE,
	)

	selection_color = "#601C1C"
	departments = list(
		/datum/department/security::id,
	)
	sorting_order = 3

	alt_titles = list(
		/datum/prototype/alt_title/security_officer/juinor::id,
		/datum/prototype/alt_title/security_officer/cadet::id,
		/datum/prototype/alt_title/security_officer/guard::id,
	)

/datum/prototype/alt_title/security_officer
	parent_role = /datum/prototype/role/job/security_officer::id
	abstract_type = /datum/prototype/alt_title/security_officer

/datum/prototype/alt_title/security_officer/juinor
	id = "AltSecOffJuinor"
	title = "Juinor Officer"
	menu_blurb = "A Junior Officer is an inexperienced Security Officer. They likely have training, but not experience, and are frequently paired off with a more senior co-worker. Junior Officers may also be expected to take over the boring duties of other Officers including patrolling the station or maintaining specific posts."

/datum/prototype/alt_title/security_officer/cadet
	id = "AltSecOffCadet"
	title = "Security Cadet"
	menu_blurb = "A Security Cadet is in training to become an Officer. They have very little understanding of standard operations and procedure and should most often be partnered with an Officer to complete their training. Should the need arise a Cadet is treated in all respects as an Officer, such as if they need to make an arrest or handle a station threat. When functioning as part of a larger team, Cadets are often meant to observe and assist rather than take initiative."

/datum/prototype/alt_title/security_officer/guard
	id = "AltSecOffGuard"
	title = "Security Guard"

/datum/outfit/job/station/security_officer
	name = OUTFIT_JOB_NAME("Security Officer")
	uniform = /obj/item/clothing/under/rank/security
	l_pocket = /obj/item/flash
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	l_ear = /obj/item/radio/headset/headset_sec
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots

	// todo below
	// belt = /obj/item/storage/belt/security/nt_isd_preload

	id_type = /obj/item/card/id/security/officer
	pda_type = /obj/item/pda/security

	backpack = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/handcuffs = 1)
	satchel_one = /obj/item/storage/backpack/satchel/sec
	messenger_bag = /obj/item/storage/backpack/messenger/sec
	dufflebag = /obj/item/storage/backpack/dufflebag/sec
