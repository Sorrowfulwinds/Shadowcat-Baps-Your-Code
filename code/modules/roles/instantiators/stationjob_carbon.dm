/**
 * Instantiator for station jobs. The classic SS13 spawning experience.
 * Made for carbon humanoids and not borgs.
 * Creates a mob from the players currently selected preferences.
 * Deletes the old mob.
 * Creates a manifest, records, bank accounts, and email account for the new char.
 */
/datum/role_instantiator/job/AttemptInstantiate(mob/new_player/old_player, datum/prototype/role/job/job, datum/prototype/alt_title/alt_title)
	/**
	 * ?Value checks
	 */
	if(!istype(job)) //Verify type so we can use the extra procs.
		return "Error! Please report this to staff. /role/job instantiator called with non-job role [job.id]."
		//TODO CAT: admin log error

	if(!isnewplayer(old_player)) //We need the mob/new_player procs to make people.
		return "Error! Please report this to staff. /role/job instantiator called without mob/new_player type."
		//TODO CAT: admin log error

	var/obj/landmark/spawnpoint/S = SSrole.get_role_spawnpoint(old_player, job.id)
	if(!istype(S))
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
	job.setup_bank_account(new_player, job.team)
	job.setup_managed_accounts(new_player, job.team)
	job.email_setup(new_player)

	//Useless shim, pending story-tellers update.
	UpdateFactionList(new_player)

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
		SSticker.HasRoundStarted()? PREF_COPY_TO_FOR_LATEJOIN : PREF_COPY_TO_FOR_ROUNDSTART,
		job.id,
		reject = loadout_rejected
		)

	// Equip job items.
	var/datum/outfit/outfit = alt_title?.outfit ? alt_title.outfit : job.outfit
	outfit?.equip(new_player, job.title, alt_title?.title ? alt_title.title : job.title)

	// Species level equip post job
	new_player.equip_post_job()

	// Backpack any leftover items from loadout.
	prefs.overflow_loadout(
		new_player,
		SSticker.HasRoundStarted()? PREF_COPY_TO_FOR_LATEJOIN : PREF_COPY_TO_FOR_ROUNDSTART,
		loadout_rejected
		)

	//Deploy wheelchair if they have it or if they need it
	if(istype(new_player))
		var/obj/item/organ/external/l_foot = new_player.get_organ("l_foot")
		var/obj/item/organ/external/r_foot = new_player.get_organ("r_foot")

		var/obj/item/storage/S = locate() in new_player.contents
		var/obj/item/wheelchair/R

		if(S)
			R = locate() in S.contents

		if(!l_foot || !r_foot || R)
			var/wheelchair_type = R?.unfolded_type || /obj/structure/bed/chair/wheelchair
			var/obj/structure/bed/chair/wheelchair/W = new wheelchair_type(new_player.loc)
			W.buckle_mob(new_player)
			W.add_fingerprint(new_player)
			if(R)
				W.color = R.color
				qdel(R)

	//Try giving the blind glasses
	if(new_player.disabilities & DISABILITY_NEARSIGHTED)
		new_player.equip_to_slot_or_del(new /obj/item/clothing/glasses/regular(new_player), SLOT_ID_GLASSES)

	// Fingerprints on everything they own
	for(var/obj/item/foo in new_player.contents)
		apply_fingerprints_to_item_recursive(new_player, foo)

	/**
	 * ?Tell player the basics of their stuff
	 */
	to_chat(new_player, SPAN_BOLD("You are [SSrole.roles_total[job.id] == 1 ? "the" : "a"] [alt_title ? alt_title.title : job.title]."))

	if(job.spawntext)
		to_chat(new_player, SPAN_BOLD("[job.spawntext]"))

	if(job.important_info)
		to_chat(new_player, SPAN_BOLD("[job.important_info]"))

	if(istype(job.outfit.l_ear, /obj/item/radio) || istype(job.outfit.r_ear, /obj/item/radio))
		to_chat(new_player, SPAN_BOLD("To speak on your department's radio channel use :h. For the use of other channels, examine your headset."))

	/**
	 * ?Cleanup and HUD updates
	 */
	new_player.update_hud_sec_job()
	new_player.update_hud_sec_implants()
	new_player.update_hud_antag()
	new_player.reset_perspective(no_optimizations = TRUE)
