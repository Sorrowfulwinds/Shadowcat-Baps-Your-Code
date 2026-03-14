/**
 * Handles mob creation, mob manipulation, equip, and ckey transfer.
 * Instantiators can be generic or bespoke to a role. AttemptInstantiate() is the master call.
 * These either spawn a new mob or modify an existing one. Read the comments.
 */
/datum/role_instantiator
	//Cool comment

/**
 * Master proc to start the spawning/applying chain. Takes in the client and the role and tries to complete the spawning/applying process.
 *
 * player - the mob of the client to spawn in
 * role - the role datum to spawn
 * alt_title - optional alternate title for the role
 * extra_args - optional extra arguments for custom use
 *
 * Returns TRUE if spawning completes or a player readable string if spawning fails.
 */
/datum/role_instantiator/proc/AttemptInstantiate(mob/player, datum/prototype/role/role, datum/prototype/alt_title, list/extra_args) as text|null
	/**
	 * This is the last point for if the process actually spawns the player or rejects the spawning.
	 * The instantiator is past the point of confirming if a role is available or if a player is banned.
	 * Those checks should happen within /role and SSroles.
	 * Instantiators only fail if the client's spawnpoint/mob details/etc are unnacceptable.
	 * alt_title will be null or valid.
	 */
	WARNING("Role <[role.id]> called with the default instantiator!")
	return "Error! Please report this to staff immediately! Role [role.id] has the default instantiator and will not work."

/**
 * Admin override proc. Will try to push through any non-critical issues and complete the spawning.
 * Return TRUE if successful or an Admin-readable string if it fails.
 */
/datum/role_instantiator/proc/ForceInstantiate(mob/player, datum/prototype/role/role, datum/prototype/alt_title, list/extra_args) as text|num
	//If your instantiator is particularly simple consider just hooking this straight into AttemptInstantiate() above.
	return "No ForceInstantiate proc set for this instantiator. Try FALSE for force_instantiator"
