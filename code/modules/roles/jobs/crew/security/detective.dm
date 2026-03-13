/datum/prototype/role/job/detective
	id = "JobNtDetective"
	title = "Detective"

	menu_blurb = "A Detective works to help Security find criminals who have not properly been identified, through interviews and forensic work. For crimes only witnessed after the fact, or those with no survivors, they attempt to piece together what they can from pure evidence."

	spawn_blurb = "You work in the Security department and report to the Head of Security."

	minimum_player_age = 3
	outfit = /datum/outfit/job/station/detective
	selection_color = "#601C1C"
	sorting_order = 3

	minimal_access = list(
		ACCESS_SECURITY_EQUIPMENT,
		ACCESS_SECURITY_FORENSICS,
		ACCESS_SECURITY_MAIN,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_ENGINEERING_AIRLOCK,
	)
	additional_access = list(
		ACCESS_COMMAND_EVA,
		ACCESS_ENGINEERING_AIRLOCK,
		ACCESS_ENGINEERING_MAINT,
		ACCESS_MEDICAL_MORGUE,
		ACCESS_SECURITY_BRIG,
	)

	departments = list(/datum/department/security::id)

	alt_titles = list(
		/datum/prototype/alt_title/detective/csi::id,
		/datum/prototype/alt_title/detective/forsensics_tech::id,
	)

/datum/prototype/alt_title/detective
	parent_role = /datum/prototype/role/job/detective::id
	abstract_type = /datum/prototype/alt_title/detective

/datum/prototype/alt_title/detective/csi
	id = "AltDetectiveCsi"
	title = "Crime Scene Investigator"

/datum/prototype/alt_title/detective/forsensics_tech
	id = "AltDetectiveForensics"
	title = "Forensic Technician"
	menu_blurb = "A Forensic Technician works more with hard evidence and labwork than a Detective, but they share the purpose of solving crimes."
	outfit = /datum/outfit/job/station/detective/forensic

/datum/outfit/job/station/detective
	name = OUTFIT_JOB_NAME("Detective")
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench
	gloves = /obj/item/clothing/gloves/forensic
	l_pocket = /obj/item/flame/lighter/zippo
	shoes = /obj/item/clothing/shoes/laceup
	l_ear = /obj/item/radio/headset/headset_sec
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	r_hand = /obj/item/storage/briefcase/crimekit

	id_type = /obj/item/card/id/security/detective
	pda_type = /obj/item/pda/detective

	backpack = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/storage/box/evidence = 1)
	satchel_one = /obj/item/storage/backpack/satchel/sec
	messenger_bag = /obj/item/storage/backpack/messenger/sec
	dufflebag = /obj/item/storage/backpack/dufflebag/sec

/datum/outfit/job/station/detective/forensic
	name = OUTFIT_JOB_NAME("Forensic technician")
	head = null
	suit = /obj/item/clothing/suit/storage/forensics/blue
