/**
 * Handles mob creation, equip, and ckey transfer.
 * Instantiators can be generic or bespoke to a role. AttemptSpawn() is the master call.
 */
/datum/role_instantiator
	//Cool comment

/**
 * Master proc to start the spawning chain. Takes in the client and the role and tries to complete the spawning process.
 *
 * C - the client to spawn in
 * role - the role datum to spawn
 * alt_title - optional alternate title for the role
 *
 * Returns TRUE if spawning completes or a player readable string if spawning fails.
 */
/datum/role_instantiator/proc/AttemptSpawn(client/C, datum/prototype/role/role, datum/prototype/alt_title)
	/**
	 * This is the last point for if the process actually spawns the player or rejects the spawning.
	 * The instantiator is past the point of confirming if a role is available or if a player is banned.
	 * Those checks should happen within /role and SSroles.
	 * Instantiators only fail if the client's spawnpoint/mob details/etc are unnacceptable.
	 * C and Role are type verified and are not null by this point.
	 * alt_title will be null or valid.
	 */
	return "Error! Please report this to staff immediately! Role [role.id] has the default instantiator and will not work."

/**
 * Admin override proc. Will try to push through any non-critical issues and complete the spawning.
 * Return TRUE if successful or an Admin-readable string if it fails.
 */
/datum/role_instantiator/proc/ForceSpawn(client/C, datum/prototype/role/role, datum/prototype/alt_title)
	//If your instantiator is particularly simple consider just hooking this straight into AttemptSpawn() above.
	return "No ForceSpawn proc set for this instantiator. Try FALSE for force_instantiator"
