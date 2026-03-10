/datum/prototype/role/job/captain
	id = "JobNtCaptain"
	title = "Captain"

	menu_blurb = "The Captain manages the other Command Staff, and through them the rest of the station. Though they have access to everything, they do not understand everything, and are expected to delegate tasks to the appropriate crew member. The Captain is expected to have an understanding of Standard Operating Procedure, and is subject to it, and legal action, in the same way as every other crew member."

	spawn_blurb = "As the boss you report only to company officials and Corporate Regulations.\n" + IMPORTANT_JOB_TELL_ADMINS

	minimum_player_age = 14
	outfit = /datum/outfit/job/station/captain
	economy_payscale = ECONOMY_PAYSCALE_JOB_CAPTAIN

	selection_color = "#2F2F7F"
	departments = list(
		/datum/department/command::id,
	)
	sorting_order = 6 //One role above them all
	departments_managed = list(/datum/department/command::name)
	department_accounts = list(/datum/department/command::name)
	minimum_character_age = 25
	allow_jobhop = FALSE
	alt_titles = list(
		/datum/prototype/alt_title/captain/overseer::id,
		/datum/prototype/alt_title/captain/site::id,
		/datum/prototype/alt_title/captain/doo::id,
		/datum/prototype/alt_title/captain/facility_director::id,
		)

/datum/prototype/role/job/captain/get_access()
	return SSrole.access_ids_of_type(ACCESS_TYPE_STATION)

/datum/prototype/alt_title/captain
	abstract_type = /datum/prototype/alt_title/captain
	parent_role = /datum/prototype/role/job/captain::id

/datum/prototype/alt_title/captain/overseer
	id = "AltCaptOverseer"
	title = "Overseer"

/datum/prototype/alt_title/captain/site
	id = "AltCaptSite"
	title = "Site Manager"

/datum/prototype/alt_title/captain/doo
	id = "AltCaptDirector"
	title = "Director of Operations"

/datum/prototype/alt_title/captain/facility_director
	id = "AltCaptFacDir"
	title = "Facility Director"

/datum/outfit/job/station/captain
	name = OUTFIT_JOB_NAME("Captain")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/captain
	l_ear = /obj/item/radio/headset/heads/captain
	shoes = /obj/item/clothing/shoes/brown

	id_type = /obj/item/card/id/gold/captain
	pda_type = /obj/item/pda/captain

	backpack = /obj/item/storage/backpack/captain
	satchel_one = /obj/item/storage/backpack/satchel/cap
	messenger_bag = /obj/item/storage/backpack/messenger/com
	dufflebag = /obj/item/storage/backpack/dufflebag/captain

/datum/outfit/job/station/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	//Geezers get gold medals
	if(H.age>49)
		var/obj/item/clothing/uniform = H.inventory.get_slot_single(/datum/inventory_slot/inventory/uniform::id)
		if(uniform)
			var/obj/item/clothing/accessory/medal/gold/captain/medal = new()
			if(uniform.can_attach_accessory(medal))
				uniform.attach_accessory(null, medal)
			else
				qdel(medal)
