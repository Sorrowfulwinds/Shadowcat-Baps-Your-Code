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
	var/const/title = "Coder skill issue"
	/// Short description - use spawntext for long one.
	var/const/desc = "Wow, a coder fucked up."
	/// Default message to show after join, also shows in spawners menu.
	var/const/spawntext
	/// Important rules/policy info
	var/const/important_info

	//? Access
	// The use of minimal_access and additional_access is determined by a config setting: config.jobs_have_minimal_access. May be irrelivant if this role never has an ID card.
	/// Minimum access
	var/const/list/minimal_access
	/// With minimal access off, this gets added
	var/const/list/additional_access

	//? Requirements
	/// Determines when this role can be spawned into by players
	var/const/join_types = JOB_ROUNDSTART | JOB_LATEJOIN
	/// If you have use_age_restriction_for_jobs config option enabled and the database set up, this option will add a requirement for players to be at least this many days old. (meaning they first signed in at least that many days before.)
	var/const/minimum_player_age = 0
	/// This option will require players to be whitelisted for this role.
	var/const/whitelisted = FALSE

	//? Advanced Info
	/// Lazylist of alternate title ids, if any.
	var/const/list/alt_titles = null
	/// The faction string this role belongs to. May be replaced by a datum later.
	var/const/team = JOB_FACTION_STATION
	/// Outfit to equip to this role, if any. May be trampled by spawner if invalid.
	var/const/datum/outfit/outfit
	/// The instantiator to spawn this role. May override player character.
	var/const/datum/role_instantiator/instancer
	/// The uninstantiator to clean up this role.
	var/const/datum/role_uninstantiator/uninstancer

	//? Settings
	/// Flags for this role's behavior on manifests. See flags for more details.
	var/const/manifest_flags = MANIFEST_SHOW_ALL

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
 * @return a list of access macros for this role.
 */
/datum/prototype/role/proc/get_access()
	. = minimal_access
	. |= config_legacy.jobs_have_minimal_access ? 0 : additional_access

/**
 * Start the spawning process for client C.
 * Calls the instantiator set for this role.
 * Override if you need to do something deranged.
 *
 * @params
 * ignore_availability - Ignore availability checks for infinite roles.
 * C - The client to spawn in
 * alt_title - Optional alternate title to use
 *
 * @return
 * TRUE if the spawning process succeeded.
 * A player-readable error string if the process failed.
 */
/datum/prototype/role/proc/AttemptSpawn(ignore_availability, client/C, datum/prototype/alt_title/alt_title)
	if(!istype(C, /client)) //Should be impossible.
		return "Error! Please report this to staff immediately! Tried spawning [id] role with no client!"
		//TODO CAT: admin log this error

	if(!ignore_availability && !SSrole.get_position_available(id))
		return "No open positions for this role. Please refresh your menu."

	if(C.persistent.ligma)
		log_shadowban("[key_name(C)] ghostrole join as [id] blocked.")
		return "No open positions for this role. Please refresh your menu."

	var/bancheck = jobban_isbanned(C.mob, id)
	if (bancheck != FALSE)
		return "You cannot spawn due to a role ban. Reason: [bancheck]"

	if(whitelisted && !Configuration.check_role_whitelist(id, C.ckey))
		return "You are not whitelisted for this role."

	if(!unlock_in_days(C))
		return "Your account is not old enough for this role. Please try again in [unlock_in_days(C)] days."

	if(alt_title?.parent_role != id) //Should be impossible to select
		return "Error! Please report this to staff! Tried spawning [id] role with invalid [alt_title.id] alt title."
		//TODO CAT: admin log this error too

	if(!istype(instancer, /datum/role_instantiator)) //Coder error if true
		return "Error! No instantiator set for this role. Please report this to staff! [id] role has no instantiator set and failed AttemptSpawn()."
		//TODO CAT: definitely admin log this error

	. = instancer.AttemptSpawn(C, src, alt_title)
	if(. == TRUE) //Spawn suceeded
		SSrole.fill_role(id)
	return .

/**
 * Admin override for FORCING a role to spawn. Only does core functionality checks. Ignores bans, filled roles, etc. Use at your own risk.
 *
 * @params
 * nofill - Do not fill a role slot
 * C - The client to spawn in
 * alt_title - Optional alternate title to use
 * force_instancer - Tell the spawner to try its absolute hardest
 *
 * @return
 * TRUE if the spawning process succeeded.
 * A admin-readable error string if the process failed.
 */
/datum/prototype/role/proc/ForceSpawn(nofill, client/C, datum/prototype/alt_title/alt_title, force_instancer)
	if(!istype(C, /client))
		return "Error! Invalid client parameter."

	if(alt_title?.parent_role != id)
		return "Error! Invalid alt-title, null is acceptable."

	if(!istype(instancer, /datum/role_instantiator))
		return "Error! No instantiator set for this role. Its coded wrong."

	//TODO CAT: Put one of those admin log macros here. No good deed can go unpunished.

	if(force_instancer)
		. = instancer.ForceSpawn(C, src, alt_title)
	else
		. = instancer.AttemptSpawn(C, src, alt_title)
	if(. == TRUE && !nofill)
		SSrole.fill_role(id)
	return .
