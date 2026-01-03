/**
 * Instantiator for station jobs. The classic SS13 spawning experience.
 * Made for carbon humanoids and not borgs.
 */

/datum/role_instantiator/job/AttemptSpawn(mob/player, datum/prototype/role/job/job, datum/prototype/alt_title)
	if(!istype(job, /datum/prototype/role/job)) //Verify type so we can use the extra procs.
		return "Error! Please report this to staff. /role/job instantiator called with non-job role [job.id]."
		//TODO CAT: admin log error






/datum/role_instantiator/job/ForceSpawn(mob/player, datum/prototype/role/role, datum/prototype/alt_title)
	//If your instantiator is particularly simple consider just hooking this straight into AttemptSpawn() above.
	return "No ForceSpawn proc set for this instantiator. Try FALSE for force_instantiator"
