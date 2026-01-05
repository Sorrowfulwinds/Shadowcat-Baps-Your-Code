//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/datum/controller/subsystem/role
	/// All spawnpoints
	var/static/list/spawnpoints = list()
	/// Job spawnpoints keyed to job id/typepath
	var/static/alist/job_spawnpoints = alist()
	/// Generic latejoin spawnpoints, nested list faction = list()
	var/static/alist/latejoin_spawnpoints = alist()
	/// Generic overflow spawnpoints, nested list faction = list()
	var/static/alist/overflow_spawnpoints = alist()
	/// Custom spawnpoints, nested list key = list()
	var/static/alist/custom_spawnpoints = alist()

/**
 * Fully resets spawnpoints list and ensures validity
 */
/datum/controller/subsystem/role/proc/reconstruct_spawnpoints()
	spawnpoints = list()
	job_spawnpoints = alist()
	latejoin_spawnpoints = alist()
	overflow_spawnpoints = alist()
	custom_spawnpoints = alist()
	// O(2n) but sue me
	for(var/obj/landmark/spawnpoint/S in GLOB.landmarks_list)
		spawnpoints += S
	for(var/obj/landmark/spawnpoint/job/S in GLOB.landmarks_list)
		if(!S.job_path)
			continue
		LAZYDISTINCTADD(job_spawnpoints[S.job_path], S)
	for(var/obj/landmark/spawnpoint/latejoin/S in GLOB.landmarks_list)
		if(!S.faction)
			continue
		LAZYDISTINCTADD(latejoin_spawnpoints[S.faction], S)
	for(var/obj/landmark/spawnpoint/overflow/S in GLOB.landmarks_list)
		if(!S.faction)
			continue
		LAZYDISTINCTADD(overflow_spawnpoints[S.faction], S)
	for(var/obj/landmark/spawnpoint/custom/S in GLOB.landmarks_list)
		if(!S.key)
			continue
		LAZYDISTINCTADD(custom_spawnpoints[S.key], S)

/**
 * Gets a valid spawnpoint to use for a roundstart spawn
 *
 * @params
 * - M - the mob being spawned
 * - C - (optional) the client of the player
 * - job_path - (optional) path to job
 * - faction - what faction the player is in terms of job factions
 * - random - deterministic first pick or random?
 * - harder - used when the first iteration failed, tells spawnpoints to skip certain checks
 *
 */
/datum/controller/subsystem/role/proc/get_roundstart_spawnpoint(mob/M, client/C, job_path, faction, random = TRUE, harder = FALSE)
	RETURN_TYPE(/obj/landmark/spawnpoint)
	if(random)
		. = list()
	// Priority 1: Job specific spawnpoints
	if(job_path && length(job_spawnpoints[job_path]))
		for(var/obj/landmark/spawnpoint/job/J as anything in job_spawnpoints[job_path])
			if(!J.roundstart)
				continue
			if(!J.Available(M, C, harder))
				continue
			if(random)
				. += J
			else
				return J
	if(random && length(.))
		return pick(.)
	// Priority 2: Overflow spawnpoints as a last resort
	if(length(overflow_spawnpoints[faction]))
		for(var/obj/landmark/spawnpoint/overflow/S as anything in overflow_spawnpoints[faction])
			if(!S.Available(M, C, harder))
				continue
			if(random)
				. += S
			else
				return S
	if(random && length(.))
		return pick(.)
	if(!harder)
		subsystem_log("get_roundstart_spawnpoint() failed to get a spawnpoint, trying against with harder = TRUE")
		return get_roundstart_spawnpoint(M, C, job_path, faction, random, TRUE)
	else
		CRASH("get_roundstart_spawnpoint() failed to get a spawnpoint.")

/**
 * Gets a spawnpoint to use for a latejoin spawn
 * Note that there's no mob argument, since latejoin won't make the mob until there's a free spawnpoint
 *
 * This is not a random pick, this is first priority-availability first server and fully deterministic.
 *
 * @params
 * - C - (optional) the client of the player
 * - job_path - (optional) path to job
 * - faction - what faction the player is in terms of job factions
 * - method - (optional) required method for the spawnpoint - this will make the proc return null instead of an overflow, if it can't find something for the method.
 * - random - deterministic first pick or random?
 * - harder - used when the first iteration failed, tells spawnpoints to skip certain checks
 */
/datum/controller/subsystem/role/proc/get_latejoin_spawnpoint(client/C, job_path, faction = JOB_FACTION_STATION, method, random = TRUE, harder = FALSE)
	RETURN_TYPE(/obj/landmark/spawnpoint)
	if(random)
		. = list()
	// Priority 1: Job specific spawnpoints
	if(job_path && length(job_spawnpoints[job_path]))
		for(var/obj/landmark/spawnpoint/job/J as anything in job_spawnpoints[job_path])
			if(!J.latejoin)
				continue
			if(!J.latejoin_override && method && (method != J.method))
				continue
			if(!J.Available(null, C, harder))
				continue
			if(random)
				. += J
			else
				return J
	if(random && length(.))
		return pick(.)
	// Priority 2: Latejoin spawnpoints, if latejoin
	if(length(latejoin_spawnpoints[faction]))
		for(var/obj/landmark/spawnpoint/latejoin/S as anything in latejoin_spawnpoints[faction])
			if(!S.Available(null, C, harder))
				continue
			if(method && (S.method != method))
				continue
			if(random)
				. += S
			else
				return S
	if(random && length(.))
		return pick(.)
	// Priority 3: Overflow spawnpoints as a last resort
	if(length(overflow_spawnpoints[faction]))
		for(var/obj/landmark/spawnpoint/overflow/S as anything in overflow_spawnpoints[faction])
			if(!S.Available(null, C, harder))
				continue
			if(random)
				. += S
			else
				return S
	if(random)
		if(length(.))
			return pick(.)
		else
			. = null
	if(!harder)
		subsystem_log("get_latejoin_spawnpoint() failed to get a spawnpoint, trying against with harder = TRUE")
		return get_roundstart_spawnpoint(C, job_path, faction, method, random, TRUE)
	else
		. = null
		CRASH("get_latejoin_spawnpoint() failed to get a spawnpoint.")

/**
 * Gets a list of possible join methods
 *
 * If latejoining and a job-specific spawnpoint has latejoin override, only that method will be returned
 *
 * The "harder" argument is automatically set to TRUE here, as we're checking for all possibilities.
 *
 * @params
 * - C - (optional) the client of the player
 * - job_path - (optional) path to job
 * - faction - what faction the player is in terms of job factions
 */
/datum/controller/subsystem/role/proc/possible_latejoin_spawnpoints(client/C, job_path, faction)
	. = list()
	// Get all job specific methods, and allow for override if needed
	if(job_path && length(job_spawnpoints[job_path]))
		for(var/obj/landmark/spawnpoint/job/J as anything in job_spawnpoints[job_path])
			if(!J.latejoin)
				continue
			if(J.latejoin_override)
				return list(J.method)
			if(J.Available(null, C, TRUE))
				continue
			. |= J.method
	// Get all standard latejoin methods
	if(length(latejoin_spawnpoints[faction]))
		for(var/obj/landmark/spawnpoint/latejoin/S as anything in latejoin_spawnpoints[faction])
			if(!S.Available(null, C, TRUE))
				continue
			. |= S.method
	// If there's none, add overflow method if overflow spawnpoints exist
	if(!length(.) && length(overflow_spawnpoints[faction]))
		for(var/obj/landmark/spawnpoint/overflow/S as anything in overflow_spawnpoints[faction])
			if(S.Available(null, C, TRUE))
				return list("Overflow")

/**
 * Gets a valid custom spawnpoint to use by key
 *
 * @params
 * - M - (optional) mob being spawned
 * - C - (optional) client of player
 * - key - spawnpoint key to look for
 */
/datum/controller/subsystem/role/proc/get_custom_spawnpoint(mob/M, client/C, key)
	if(!length(custom_spawnpoints[key]))
		return
	for(var/obj/landmark/spawnpoint/S as anything in custom_spawnpoints[key])
		if(!S.Available(M, C))
			continue
		return S

/**
 * Get all spawnpoint landmarks
 */
/datum/controller/subsystem/role/proc/get_all_spawnpoints()
	return spawnpoints








//! ---------- New spawnpoint proc so I can stop pulling my hair out. The above spawnpoint behaviour will be somewhat invalid.----
/**
 * Gets a valid spawnpoint for the provided parameters.
 *
 * @params
 * - M - the mob being spawned
 * - C - (optional) the client of the player
 * - role_id - id of the role
 * - team - what team the player is on
 * - harder - used when the first iteration failed, tells spawnpoints to skip certain checks
 *
 */
/datum/controller/subsystem/role/proc/try_get_spawnpoint(mob/M, client/C, role_id, team, harder = FALSE)
	RETURN_TYPE(/obj/landmark/spawnpoint)

	//Put logic here to determine if we are using mob or client var and establish that internally.

	// Priority 1: Pref specific spawnpoint - Latejoin only
	//Checks for and turns pref spawnpoint method into a real spawnpoint.
	if(C && spawntypes[C.prefs.spawnpoint]) //If the prefs spawnpoint is in spawntypes[] it exists and is valid.
		//Legacy generic pref spawnpoints
		var/datum/spawnpoint/spawnpos = spawntypes[C.prefs.spawnpoint]

		if(spawnpos.check_job_spawning(role_id)) //Check white/black-list
			//! Instead of doing this, record method and check it below if true.
			S = SSjob.get_latejoin_spawnpoint(method = spawnpos.method)



	if(random)
		. = list()
	// Priority 2: Job specific spawnpoints - Roundstart/Latejoin
	if(job_path && length(job_spawnpoints[job_path]))
		for(var/obj/landmark/spawnpoint/job/J as anything in job_spawnpoints[job_path])
			if(!J.roundstart)
				continue
			if(!J.Available(M, C, harder))
				continue
			if(random)
				. += J
			else
				return J
	if(random && length(.))
		return pick(.)
	// Priority 3: Latejoin spawnpoints - Latejoin only
	if(length(latejoin_spawnpoints[faction]))
		for(var/obj/landmark/spawnpoint/latejoin/S as anything in latejoin_spawnpoints[faction])
			if(!S.Available(null, C, harder))
				continue
			if(method && (S.method != method))
				continue
			if(random)
				. += S
			else
				return S
	if(random && length(.))
		return pick(.)
	// Priority 3: Overflow spawnpoints - Roundstart/Latejoin
	if(length(overflow_spawnpoints[faction]))
		for(var/obj/landmark/spawnpoint/overflow/S as anything in overflow_spawnpoints[faction])
			if(!S.Available(M, C, harder))
				continue
			if(random)
				. += S
			else
				return S
	if(random && length(.))
		return pick(.)
	if(!harder)
		subsystem_log("get_roundstart_spawnpoint() failed to get a spawnpoint, trying against with harder = TRUE")
		return get_roundstart_spawnpoint(M, C, job_path, faction, random, TRUE)
	else
		CRASH("get_roundstart_spawnpoint() failed to get a spawnpoint.")

