//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * A role is something you can join the game as, usually from the lobby or from the observer panel.
 */
/datum/prototype/role
	abstract_type = /datum/prototype/role
	//Blindly ports variables to /role :3

	//! Don't forget id on children!
	//id = RoleSkissuemancer

	//? Basic Info
	///The name of the role. What players see ic.
	var/title = "Coder skill issue"
	/// Short description - use spawntext for long one.
	var/desc = "Wow, a coder fucked up."
	/// Default message to show after join, also shows in spawners menu.
	var/spawntext
	/// Important rules/policy info
	var/important_info

	//? Requirements
	/// Determines when this role can be spawned into by players
	var/join_types = JOB_ROUNDSTART | JOB_LATEJOIN
	/// If you have use_age_restriction_for_jobs config option enabled and the database set up, this option will add a requirement for players to be at least this many days old. (meaning they first signed in at least that many days before.)
	var/minimum_player_age = 0
	/// This option will require players to be whitelisted for this role.
	var/whitelisted = FALSE

	//? Advanced Info
	/// Lazylist of alternate title ids, if any.
	var/list/alt_titles = null
	/// The faction string this role belongs to. May be replaced by a datum later.
	var/faction = JOB_FACTION_STATION
	/// Outfit to equip to this role, if any. May be trampled by spawner if invalid.
	var/datum/outfit/outfit
	/// The instantiator to spawn this role. May override player character.
	var/datum/role_instantiator/instancer
	/// The uninstantiator to clean up this role.
	var/datum/role_uninstantiator/uninstancer

	//? Settings
	/// Flags for this role's behavior on manifests. See flags for more details.
	var/manifest_flags = MANIFEST_SHOW_ALL

/datum/prototype/role/can_be_unloaded()
	return FALSE

/**
 * How many more days since client C first logged in to unlock this role.
 *
 * @return 0 to X days remaining to unlock this role.
 */
/datum/prototype/role/proc/unlock_in_days(client/C)
	if(C.has_jexp_bypass())
		return 0
	if(!CONFIG_GET(flag/job_check_account_age))
		return 0
	return max(0, minimum_player_age - C.player.player_age)

/**
 * Start the spawning process for client C in this role.
 * Calls the instantiator set for this role unless you left it blank.
 * Override if you need to do something deranged.
 *
 * @params
 * C - The client to spawn in this role
 * alt_title - Alternate title to use for this role
 *
 * @return
 * TRUE if the spawning process succeeded.
 * A player-readable error string if the process failed.
 */
/datum/prototype/role/proc/try_spawn_role(client/C, datum/prototype/alt_title)
	if(alt_title?.parent_role != self.id)
		return "Error! Please report this to staff immediately! Tried spawning [id] role with invalid [alt_title.id] alt title."

	if (!istype(spawner, /datum/role_instantiator) || isnull(spawner))
		return "Error! No instantiator set for this role. Please report this to staff immediately! [id] role has no instantiator set and failed spawn_role()."

	return spawner.try_spawning(C, self, alt_title)
