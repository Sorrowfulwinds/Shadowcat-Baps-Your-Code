/**
 * Instantiator for station borgs. The classic synthetic experience.
 *
 */
/datum/role_instantiator/job_ai/AttemptInstantiate(mob/new_player/player, datum/prototype/role/job/job, datum/prototype/alt_title/alt_title)
	/**
	 * ?Value checks
	 */
	if(!istype(job) //Verify type so we can use the extra procs.
		return "Error! Please report this to staff. /role/job instantiator called with non-job role [job.id]."
		//TODO CAT: admin log error

	if(!isnewplayer(player)) //We need the mob/new_player procs to make people.
		return "Error! Please report this to staff. /role/job instantiator called without mob/new_player type."
		//TODO CAT: admin log error

	var/obj/landmark/spawnpoint/S = SSrole.get_role_spawnpoint(null, job.id)
	if(!istype(S))
		return "Error! Please report this to staff. Could not find a valid spawnpoint for [job.id]!"

	/**
	 * ?Spawning new mob and mob details setup / Deleting old mob
	 */


	player.mind.assigned_role_id = job.id
	player.mind.alt_title_id = alt_title?.id

	var/mob/living/silicon/ai/new_ai = player.AIize(TRUE, S)
	S.OnSpawn(new_ai)

	//Useless shim, pending story-tellers update.
	UpdateFactionList(new_ai)

	//We are actively in the world and recorded now so might as well log it.
	log_game("JOINED [key_name(new_ai)] as \"[job.id]\"")
	log_game("SPECIES [key_name(new_ai)] is a: \"[new_ai.species.name]\"")

	/**
	 * ?Tell player the basics of their stuff
	 */
	to_chat(new_ai, SPAN_BOLD("You are [SSrole.roles_total[job.id] == 1 ? "the" : "a"] [alt_title ? alt_title.title : job.title]."))

	if(job.spawntext)
		to_chat(new_ai, SPAN_BOLD("[job.spawntext]"))

	if(job.important_info)
		to_chat(new_ai, SPAN_BOLD("[job.important_info]"))

	/**
	 * ?Cleanup and HUD updates
	 */
	new_ai.update_hud_sec_job()
	new_ai.update_hud_sec_implants()
	new_ai.update_hud_antag()
	new_ai.reset_perspective(no_optimizations = TRUE)
