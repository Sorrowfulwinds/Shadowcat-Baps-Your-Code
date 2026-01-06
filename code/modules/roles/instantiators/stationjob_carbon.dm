/**
 * Instantiator for station jobs. The classic SS13 spawning experience.
 * Made for carbon humanoids and not borgs.
 */

/datum/role_instantiator/job/AttemptInstantiate(mob/new_player/old_player, datum/prototype/role/job/job, datum/prototype/alt_title)
	if(!istype(job, /datum/prototype/role/job)) //Verify type so we can use the extra procs.
		return "Error! Please report this to staff. /role/job instantiator called with non-job role [job.id]."
		//TODO CAT: admin log error

	if(!isnewplayer(old_player)) //We need the mob/new_player procs to make people.
		return "Error! Please report this to staff. /role/job instantiator called without mob/new_player type."
		//TODO CAT: admin log error

	var/obj/landmark/spawnpoint/S = SSrole.get_role_spawnpoint(old_player, job.id)
	if(!istype(S))
		return "Error! Please report this to staff. Could not find a valid spawnpoint for [job.id]!"

	//!Here be dragons. Past this point actual ingame effects happen. Pray it works.
	//Creates a player's char mob at spawnpoint and moves the client to it. Ejects its own errors directly.
	var/mob/living/carbon/human/new_player = old_player.create_character(get_turf(S.GetSpawnLoc()))
	if(!istype(new_player))
		return "Spawning failed dramatically for [job.id]. If you don't see an error above you should report this to staff."

	qdel(old_player)
	new_player.mind.assigned_role_id = job.id
	new_player.mind.alt_title_id = alt_title?.id

	//Legacy Manifest call
	data_core.manifest_inject(new_player)

	//Useless shim, pending story-tellers update.
	UpdateFactionList(new_player)

	//Equip clients personal loadout
	var/list/obj/item/loadout_rejected = list()
	new_player.client.prefs.equip_loadout(
		new_player,
		SSticker.HasRoundStarted()? PREF_COPY_TO_FOR_LATEJOIN : PREF_COPY_TO_FOR_ROUNDSTART,
		job.id,
		reject = loadout_rejected
		)

	// Equip job items.
	job.equip(H, H.mind ? H.mind.role_alt_title : "")

	// Set up their account
	job.setup_account(H)

	// Stick their fingerprints on literally everything
	job.apply_fingerprints(H)

	// Species level equip post job
	new_player.equip_post_job()




/datum/role_instantiator/job/ForceInstantiate(mob/player, datum/prototype/role/role, datum/prototype/alt_title)
	//If your instantiator is particularly simple consider just hooking this straight into AttemptSpawn() above.
	return "No ForceSpawn proc set for this instantiator. Try FALSE for force_instantiator"
