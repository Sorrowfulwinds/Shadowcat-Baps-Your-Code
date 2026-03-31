/**
 * Instantiator for station jobs. The classic SS13 spawning experience.
 * Made for carbon humanoids and not borgs.
 * Creates a mob from the players currently selected preferences.
 * Deletes the old mob.
 * Creates a manifest, records, bank accounts, and email account for the new char.
 */
/datum/role_instantiator/job/AttemptInstantiate(mob/new_player/old_player, datum/prototype/role/job/job, datum/prototype/alt_title/alt_title, list/extra_args)
	/**
	 * ?Value checks
	 */
	if(!istype(job)) //Verify type so we can use the extra procs.
		WARNING("Instantiator called with non-job role [job.id]")
		return "Error! Please report this to staff. /role/job instantiator called with non-job role: [job.id]."

	if(!isnewplayer(old_player)) //We need the mob/new_player procs to make people.
		WARNING("Instantiator called without mob/new_player type: [old_player.type]")
		return "Error! Please report this to staff. /role/job instantiator called without mob/new_player type."

	var/obj/landmark/spawnpoint/S = SSrole.get_role_spawnpoint(old_player, job.id)
	if(!istype(S))
		WARNING("Instantiator could not find a valid spawnpoint for [job.id].")
		return "Error! Please report this to staff. Could not find a valid spawnpoint for [job.id]!"

	//Cache prefs in case client explodes during spawning.
	var/datum/preferences/prefs = old_player.client.prefs

	/**
	 * ?Spawning new mob and mob details setup / Deleting old mob
	 * !Here be dragons. Past this point actual ingame effects happen. Pray it works.
	 */
	//Creates a player's char mob at spawnpoint and moves the client to it. Ejects its own errors directly.
	var/mob/living/carbon/human/new_player = old_player.create_character(get_turf(S.GetSpawnLoc()))
	if(!istype(new_player))
		return "Spawning failed dramatically for [job.id]. If you don't see an error above you should report this to staff."

	//Tell spawn we used it
	S.OnSpawn(new_player)
	//toolbox_impact.ogg
	qdel(old_player)
	new_player.mind.assigned_role_id = job.id
	new_player.mind.alt_title_id = alt_title?.id

	//Legacy Manifest call
	data_core.manifest_inject(new_player)

	// Set up their accounts
	setup_bank_account(new_player, job.get_economic_payscale())
	if(job.department_accounts)
		setup_managed_accounts(new_player, job.department_accounts)
	email_setup(new_player)

	//We are actively in the world and recorded now so might as well log it.
	log_game("JOINED [key_name(new_player)] as \"[job.id]\"")
	log_game("SPECIES [key_name(new_player)] is a: \"[new_player.species.name]\"")

	/**
	 * ?Equipment setup
	 */
	//Equip clients personal loadout
	var/list/obj/item/loadout_rejected = list()
	prefs.equip_loadout(
		new_player,
		SSticker.current_state >= GAME_STATE_PLAYING ? PREF_COPY_TO_FOR_LATEJOIN : PREF_COPY_TO_FOR_ROUNDSTART,
		job.id,
		reject = loadout_rejected
		)

	// Equip job items.
	if(alt_title)
		if(alt_title.outfit_flag & SSR_UNIFORM_ADDON)
			job.outfit?.equip(new_player, job.title, alt_title.title)
			alt_title.outfit?.equip(new_player, job.title, alt_title.title)
		else
			alt_title.outfit?.equip(new_player, job.title, alt_title.title)
	else
		job.outfit?.equip(new_player, job.title, alt_title.title)

	// Species level equip post job
	new_player.equip_post_job()

	// Backpack any rejected items from loadout.
	prefs.overflow_loadout(
		new_player,
		SSticker.current_state >= GAME_STATE_PLAYING ? PREF_COPY_TO_FOR_LATEJOIN : PREF_COPY_TO_FOR_ROUNDSTART,
		loadout_rejected
		)

	//Wheelchair and glasses check
	give_cripple_equipment(new_player)

	// Fingerprints on everything they own
	for(var/obj/item/foo in new_player.contents)
		apply_fingerprints_to_item_recursive(new_player, foo)

	/**
	 * ?Tell player the basics of their stuff
	 */
	to_chat(new_player, SPAN_BOLD("You are [(SSrole.roles_total[job.id] == 1) ? "the" : "a"] [alt_title ? alt_title.title : job.title]."))

	to_chat(new_player, SPAN_BOLD("[job.spawn_blurb]"))


	if(istype(job.outfit.l_ear, /obj/item/radio) || istype(job.outfit.r_ear, /obj/item/radio))
		to_chat(new_player, SPAN_BOLD("To speak on your department's radio channel use :h. For the use of other channels, examine your headset."))

	/**
	 * ?Cleanup and HUD updates
	 */
	new_player.update_hud_sec_job()
	new_player.update_hud_sec_implants()
	new_player.update_hud_antag()
	new_player.reset_perspective(no_optimizations = TRUE)

	if(SSticker.current_state >= GAME_STATE_PLAYING)
		GLOB.global_announcer.autosay(S.RenderAnnounceMessage(
			new_player,
			new_player.client,
			job.id,
			new_player.real_name,
			(alt_title ? alt_title.title : job.title)
		), "Arrivals Announcement Computer")



/**
 * Makes a bank acount for mob H.
 * @params
 * - H - mob/living/carbon/human
 */
/datum/role_instantiator/job/proc/setup_bank_account(var/mob/living/carbon/human/H, var/economic_payscale)
	if(H?.mind?.initial_account)
		return

	var/money_amount = round(economic_payscale * ECONOMY_PAYSCALE_BASE * ECONOMY_PAYSCALE_MULT * H.mind.original_pref_economic_modifier + gaussian(ECONOMY_PAYSCALE_RANDOM_MEAN, ECONOMY_PAYSCALE_RANDOM_DEV))

	var/datum/money_account/M = create_account(H.real_name, money_amount, null)

	var/remembered_info = "<b>Your account number is:</b> #[M.account_number]<br>\
							<b>Your account pin is:</b> [M.remote_access_pin]<br>\
							<b>Your account funds are:</b> $[M.money]<br>"

	if(M.transaction_log.len)
		var/datum/transaction/T = M.transaction_log[1]
		remembered_info += "<b>Your account was created:</b> [T.time], [T.date] at [T.source_terminal]<br>"
	H.mind.store_memory(remembered_info)

	H.mind.initial_account = M

	to_chat(H, "<span class='notice'><b>Your account number is: [M.account_number], your account pin is: [M.remote_access_pin], you have $[M.money].</b></span>")

/**
 * Tell H all the department accounts they manage and their info.
 * @params
 * - H - A /carbon/human with a mind
 */
/datum/role_instantiator/job/proc/setup_managed_accounts(var/mob/living/carbon/human/H, var/list/department_accounts)
	var/remembered_info = ""
	for(var/D in department_accounts)
		var/datum/money_account/d_a = GLOB.department_accounts[D]
		remembered_info += "<b>[d_a.owner_name] number:</b> #[d_a.account_number]<br>\
							<b>[d_a.owner_name] pin:</b> [d_a.remote_access_pin]<br>\
							<b>[d_a.owner_name] funds:</b> $[d_a.money]<br>"

	H.mind.store_memory(remembered_info)

/**
 * Set up an NT email for H.
 * @params
 * - H - A /carbon/human to set up an email for.
 */
/datum/prototype/role/job/proc/email_setup(var/mob/living/carbon/human/H)
	var/domain = "freemail.nt"
	if((LEGACY_MAP_DATUM) && LAZYLEN((LEGACY_MAP_DATUM).usable_email_tlds))
		domain = (LEGACY_MAP_DATUM).usable_email_tlds[1]

	var/sanitized_name = sanitize(replacetext(replacetext(lowertext(H.real_name), " ", "."), "'", ""))
	var/complete_login = "[sanitized_name]@[domain]"

	//Try making a unique login up to 10 times.
	var/fail_out = 0
	while(ntnet_global.does_email_exist(complete_login) && (fail_out < 10))
		complete_login = "[sanitized_name][random_id(/datum/computer_file/data/email_account/, 100, 999)]@[domain]"

	// If login generation failed they dont get an email.
	if(ntnet_global.does_email_exist(complete_login))
		to_chat(H, "You were not assigned an email address.")
		H.mind.store_memory("You were not assigned an email address.")
	else
		var/datum/computer_file/data/email_account/EA = new/datum/computer_file/data/email_account()
		EA.password = GenerateKey()
		EA.login = 	complete_login
		to_chat(H, "Your email account address is <b>[EA.login]</b> and the password is <b>[EA.password]</b>. This information has also been placed into your notes.")
		H.mind.store_memory("Your email account address is [EA.login] and the password is [EA.password].")

/**
 * Give them a wheel chair and glasses if they need it.
 * @params
 * - H - A /carbon/human to give aids to.
 */
/datum/prototype/role/job/proc/give_cripple_equipment(var/mob/living/carbon/human/H)
		//Deploy wheelchair if they have it or if they need it
	if(istype(H))
		var/obj/item/organ/external/l_foot = H.get_organ("l_foot")
		var/obj/item/organ/external/r_foot = H.get_organ("r_foot")

		var/obj/item/storage/S = locate() in H.contents
		var/obj/item/wheelchair/R

		if(S)
			R = locate() in S.contents

		if(!l_foot || !r_foot || R)
			var/wheelchair_type = R?.unfolded_type || /obj/structure/bed/chair/wheelchair
			var/obj/structure/bed/chair/wheelchair/W = new wheelchair_type(H.loc)
			W.buckle_mob(H)
			W.add_fingerprint(H)
			if(R)
				W.color = R.color
				qdel(R)

	//Try giving the blind glasses
	if(H.disabilities & DISABILITY_NEARSIGHTED)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/regular(H), SLOT_ID_GLASSES)
