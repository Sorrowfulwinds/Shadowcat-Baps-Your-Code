//? Alt Titles

/**
 * all alt title datums
 */
/datum/prototype/role/legacy_job/proc/alt_title_datums()
	. = list()
	// todo: why do we do assoc list? why don't we just cache? why why why????
	for(var/title in alt_titles)
		var/datum/prototype/struct/alt_title/alt_datum = RSstructs.fetch(alt_titles[title])
		if(!alt_datum)
			continue
		. += alt_datum

/**
 * get available alt title names for a given set of character backgrounds
 */
/datum/prototype/role/legacy_job/proc/alt_title_query(list/background_ids)
	RETURN_TYPE(/list)
	var/strict = FALSE
	var/list/strict_titles = list()
	var/list/all_titles = list()
	for(var/datum/prototype/struct/alt_title/alt_datum as anything in alt_title_datums())
		// check if we can be picked at all
		if(!alt_datum.check_background_ids(background_ids, FALSE))
			continue
		// yes? add to all titles
		all_titles |= alt_datum.title
		// check if we can be picked under enforcement
		if(alt_datum.check_background_ids(background_ids, TRUE))
			strict_titles |= alt_datum.title
			// are we enforcing? if so, flip it so we choose from strict_titles after
			// this is only valid if we're valid under enforcement
			if(alt_datum.background_enforce)
				strict = TRUE
	// return list, always ensuring there's atleast one title
	// if we're enforcing strictness there should already be one so we don't check
	// if we're not we always add our own title regardless of what alt datums say so there's one title
	if(strict)
		return strict_titles
	return all_titles | title

/**
 * check if an alt title is available for a given set of backgrounds
 */
/datum/prototype/role/legacy_job/proc/alt_title_check(alt_title, list/background_ids)
	if(alt_title == title)
		// check if any enforced datums are there that forces them to be certain titles, and if so,
		// that our 'normal' title is in there.
		var/list/enforced = list()
		for(var/datum/prototype/struct/alt_title/alt_datum as anything in alt_title_datums())
			if(alt_datum.background_enforce && alt_datum.check_background_ids(background_ids))
				enforced += alt_datum.title
		return !length(enforced) || (alt_title in enforced)
	var/datum/prototype/struct/alt_title/alt_datum = RSstructs.fetch(alt_titles?[alt_title])
	return alt_datum?.check_background_ids(background_ids)

/**
 * check if we enforce an alt title that isn't root for a list of backgrounds.
 *
 * @return enforced title as string, or null for none
 */
/datum/prototype/role/legacy_job/proc/alt_title_enforcement(list/background_ids)
	for(var/datum/prototype/struct/alt_title/alt_datum as anything in alt_title_datums())
		// don't need to potentially enforce
		if(!alt_datum.background_enforce)
			continue
		// we perform a strict check, as enforcement only happens against strict checks
		if(!alt_datum.check_background_ids(background_ids, TRUE))
			continue
		// both enforcing and strictly avail, this is a valid title for someone without one
		return alt_datum.title

//? Unsorted

/datum/prototype/role/legacy_job/proc/equip(var/mob/living/carbon/human/H, var/alt_title)
	var/datum/outfit/outfit = get_outfit(H, alt_title)
	if(!outfit)
		return FALSE
	. = outfit.equip(H, title, alt_title)
	return 1

/datum/prototype/role/legacy_job/proc/get_outfit(var/mob/living/carbon/human/H, var/alt_title)
	if(alt_title && alt_titles)
		var/datum/prototype/struct/alt_title/A = alt_titles[alt_title]
		if(A && initial(A.title_outfit))
			. = initial(A.title_outfit)
	. = . || outfit_type
	if(ispath(., /datum/outfit))
		return new .

	// TODO: job refactor

/datum/prototype/role/legacy_job/proc/get_economic_payscale()
	var/datum/department/D = SSjob.get_primary_department_of_job(src)
	return economy_payscale * (istype(D)? D.economy_payscale : 1)

/datum/prototype/role/legacy_job/proc/setup_account(var/mob/living/carbon/human/H)
	if(!account_allowed || (H.mind && H.mind.initial_account))
		return

	// Give them an account in the station database
	var/money_amount = round(get_economic_payscale() * ECONOMY_PAYSCALE_BASE * ECONOMY_PAYSCALE_MULT * \
	H.mind.original_pref_economic_modifier + gaussian(ECONOMY_PAYSCALE_RANDOM_MEAN, ECONOMY_PAYSCALE_RANDOM_DEV))
	var/datum/money_account/M = create_account(H.real_name, money_amount, null, offmap_spawn)
	if(H.mind)
		var/remembered_info = ""
		remembered_info += "<b>Your account number is:</b> #[M.account_number]<br>"
		remembered_info += "<b>Your account pin is:</b> [M.remote_access_pin]<br>"
		remembered_info += "<b>Your account funds are:</b> $[M.money]<br>"

		if(M.transaction_log.len)
			var/datum/transaction/T = M.transaction_log[1]
			remembered_info += "<b>Your account was created:</b> [T.time], [T.date] at [T.source_terminal]<br>"
		H.mind.store_memory(remembered_info)

		H.mind.initial_account = M

	to_chat(H, "<span class='notice'><b>Your account number is: [M.account_number], your account pin is: [M.remote_access_pin]</b></span>")

// Overrideable separately so AIs/borgs can have cardborg hats without unneccessary new()/qdel()
/datum/prototype/role/legacy_job/proc/equip_preview(mob/living/carbon/human/H, var/alt_title)
	var/datum/outfit/outfit = get_outfit(H, alt_title)
	if(!outfit)
		return FALSE
	. = outfit.equip_base(H, title, alt_title)

/datum/prototype/role/legacy_job/proc/get_access()
	. = minimal_access | (config_legacy.jobs_have_minimal_access? list() : additional_access)
	if(faction == JOB_FACTION_STATION && CONFIG_GET(flag/almost_everyone_has_maintenance_access))
		. |= ACCESS_ENGINEERING_MAINT

/datum/prototype/role/legacy_job/proc/apply_fingerprints(var/mob/living/carbon/human/target)
	if(!istype(target))
		return 0
	for(var/obj/item/item in target.contents)
		apply_fingerprints_to_item(target, item)
	return 1

/datum/prototype/role/legacy_job/proc/apply_fingerprints_to_item(var/mob/living/carbon/human/holder, var/obj/item/item)
	item.add_fingerprint(holder,1)
	if(item.contents.len)
		for(var/obj/item/sub_item in item.contents)
			apply_fingerprints_to_item(holder, sub_item)

/datum/prototype/role/legacy_job/proc/is_position_available()
	return (current_positions < total_positions) || (total_positions == -1)

/datum/prototype/role/legacy_job/proc/has_alt_title(var/mob/H, var/supplied_title, var/desired_title)
	return (supplied_title == desired_title) || (H.mind && H.mind.role_alt_title == desired_title)

/datum/prototype/role/legacy_job/proc/get_description_blurb(var/alt_title)
	var/list/message = list()
	message |= desc

	if(alt_title && alt_titles)
		var/typepath = alt_titles[alt_title]
		if(typepath)
			var/datum/prototype/struct/alt_title/A = new typepath()
			if(A.title_blurb)
				message |= A.title_blurb
	return message

/datum/prototype/role/legacy_job/proc/get_job_icon()
	if(!SSjob.job_icons[title])
		var/mob/living/carbon/human/dummy/mannequin/mannequin = get_mannequin("#job_icon")
		dress_mannequin(mannequin)
		mannequin.dir = SOUTH
		mannequin.compile_overlays()
		var/icon/preview_icon = get_flat_icon(mannequin)

		preview_icon.Scale(preview_icon.Width() * 2, preview_icon.Height() * 2)	// Scaling here to prevent blurring in the browser.
		SSjob.job_icons[title] = preview_icon

	return SSjob.job_icons[title]

/datum/prototype/role/legacy_job/proc/dress_mannequin(mob/living/carbon/human/dummy/mannequin/mannequin)
	mannequin.delete_inventory(TRUE)
	equip_preview(mannequin)
	if(mannequin.back)
		qdel(mannequin.back)

/datum/prototype/role/legacy_job/proc/equip_backpack(mob/living/carbon/human/H)
	switch(H.backbag)
		if(2)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack(H), SLOT_ID_BACK)
		if(3)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/norm(H), SLOT_ID_BACK)
		if(4)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(H), SLOT_ID_BACK)
		if(5)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/messenger(H), SLOT_ID_BACK)
		if(6)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/rig(H), SLOT_ID_BACK)
		if(7)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/dufflebag(H), SLOT_ID_BACK)
