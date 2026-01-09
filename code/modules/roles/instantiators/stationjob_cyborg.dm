/**
 * Instantiator for station borgs. The classic synthetic experience.
 *
 */
/datum/role_instantiator/job_borg/AttemptInstantiate(mob/new_player/old_player, datum/prototype/role/job/job, datum/prototype/alt_title/alt_title)
	/**
	 * ?Value checks
	 */
	if(!istype(job) //Verify type so we can use the extra procs.
		return "Error! Please report this to staff. /role/job instantiator called with non-job role [job.id]."
		//TODO CAT: admin log error

	if(!isnewplayer(old_player)) //We need the mob/new_player procs to make people.
		return "Error! Please report this to staff. /role/job instantiator called without mob/new_player type."
		//TODO CAT: admin log error

	var/obj/landmark/spawnpoint/S = SSrole.get_role_spawnpoint(null, job.id)
	if(!istype(S))
		return "Error! Please report this to staff. Could not find a valid spawnpoint for [job.id]!"

	/**
	 * ?Spawning new mob and mob details setup / Deleting old mob
	 */
	//Creates a player's char mob at spawnpoint and moves the client to it. Ejects its own errors directly.
	var/mob/living/carbon/human/new_player = old_player.create_character(get_turf(S.GetSpawnLoc()))
	if(!istype(new_player))
		return "Spawning failed dramatically for [job.id]. If you don't see an error above you should report this to staff."

	new_player.mind.assigned_role_id = job.id
	new_player.mind.alt_title_id = alt_title?.id

	//TODO: Making a /carbon/human to call Robotize() on it, which then immediately deletes the character to make a borg is stupid. Borgs/AI need to be integrated into the character slot system and be able to be directly created from /mob/new_player.
	var/mob/living/silicon/robot/new_borg = new_player.Robotize()

	S.OnSpawn(new_borg)

	//Useless shim, pending story-tellers update.
	UpdateFactionList(new_borg)

	//We are actively in the world and recorded now so might as well log it.
	log_game("JOINED [key_name(new_borg)] as \"[job.id]\"")
	log_game("SPECIES [key_name(new_borg)] is a: \"[new_borg.species.name]\"")

	/**
	 * ?Tell player the basics of their stuff
	 */
	to_chat(new_borg, SPAN_BOLD("You are [SSrole.roles_total[job.id] == 1 ? "the" : "a"] [alt_title ? alt_title.title : job.title]."))

	if(job.spawntext)
		to_chat(new_borg, SPAN_BOLD("[job.spawntext]"))

	if(job.important_info)
		to_chat(new_borg, SPAN_BOLD("[job.important_info]"))

	/**
	 * ?Cleanup and HUD updates
	 */
	new_borg.update_hud_sec_job()
	new_borg.update_hud_sec_implants()
	new_borg.update_hud_antag()
	new_borg.reset_perspective(no_optimizations = TRUE)
