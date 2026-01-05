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

	var/obj/landmark/spawnpoint/S

	if(SSticker.HasRoundStarted())
		S = SSrole.get_latejoin_spawnpoint(old_player.client, job.id, job.team)
	else
		S = SSrole.get_roundstart_spawnpoint(old_player, old_player.client, job.id, job.team)

	if(!istype(S))
		return "Could not find a valid spawnpoint. Try a s."


	//!Here be dragons. Past this point actual ingame effects happen. Pray it works.
	//Creates a player's char mob at spawnpoint and moves the client to it. Ejects its own errors directly.
	var/mob/living/carbon/human/new_player = old_player.create_character(get_turf(S.GetSpawnLoc()))
	if(istype(new_player))
		qdel(old_player)
		//Legacy Manifest call
		data_core.manifest_inject(new_player)
	else
		return "Spawning failed dramatically for [job.id]. If you don't see an error above you should report this to staff."

	//Useless shim, pending story-tellers update.
	UpdateFactionList(new_player)



/datum/role_instantiator/job/ForceInstantiate(mob/player, datum/prototype/role/role, datum/prototype/alt_title)
	//If your instantiator is particularly simple consider just hooking this straight into AttemptSpawn() above.
	return "No ForceSpawn proc set for this instantiator. Try FALSE for force_instantiator"
