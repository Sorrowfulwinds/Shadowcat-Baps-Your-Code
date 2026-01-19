//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/datum/controller/subsystem/role
	/// All spawnpoints
	var/static/list/spawnpoints = list()
	/// Role spawnpoints keyed to role id, nested list role_id = list()
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

	for(var/obj/landmark/spawnpoint/S in GLOB.landmarks_list)
		spawnpoints += S
		switch(S.type)
			if(/obj/landmark/spawnpoint/job)
				var/obj/landmark/spawnpoint/job/S = S
				if(S.job_path)
					LAZYDISTINCTADD(job_spawnpoints[S.job_path], S)
				continue
			if(/obj/landmark/spawnpoint/latejoin)
				var/obj/landmark/spawnpoint/latejoin/S = S
				if(S.faction)
					LAZYDISTINCTADD(latejoin_spawnpoints[S.faction], S)
				continue
			if(/obj/landmark/spawnpoint/overflow)
				var/obj/landmark/spawnpoint/overflow/S = S
				if(S.faction)
					LAZYDISTINCTADD(overflow_spawnpoints[S.faction], S)
				continue
			if(/obj/landmark/spawnpoint/custom)
				var/obj/landmark/spawnpoint/custom/S = S
				if(S.key)
					LAZYDISTINCTADD(custom_spawnpoints[S.key], S)
				continue

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


/**
 * Gets a valid spawnpoint for the provided parameters. Or CRASH trying.
 *
 * @params
 * - M - (Optional) the mob being spawned
 * - role_id - id of the role
 * - harder - (Optional) used when the first iteration failed, tells spawnpoints to skip certain checks
 *
 * @returns
 * A /obj/landmark/spawnpoint if successful
 * null if failed
 */
/datum/controller/subsystem/role/proc/get_role_spawnpoint(mob/M, role_id, harder = FALSE)
	RETURN_TYPE(/obj/landmark/spawnpoint)
	var/datum/prototype/role/role = RSroles.get_role_by_id(role_id)

	if(!istype(role)) //fuck
		return null

	var/round_started = (SSticker.current_state >= GAME_STATE_PLAYING)
	var/pref_method
	. = list()

	// Priority 1: Pref specific spawnpoint - Latejoin only
	//Checks for
	if(round_started && spawntypes[M?.client?.prefs.spawnpoint])
		//If spawnpoint is in spawntypes it is valid to try.
		//Legacy generic pref spawnpoints
		var/datum/spawnpoint/spawnpos = spawntypes[M.client.prefs.spawnpoint]
		if(spawnpos.check_job_spawning(role_id))
			pref_method = spawnpos.method

	// Priority 2: Job specific spawnpoints - Roundstart/Latejoin
	if(length(job_spawnpoints[role_id]))
		for(var/obj/landmark/spawnpoint/job/J in job_spawnpoints[role_id])
			if(round_started ? !J.latejoin : !J.roundstart)
				continue
			if(round_started && !J.latejoin_override && pref_method && (pref_method != J.method))
				continue
			if(!J.Available(M, null, harder))
				continue
			. += J
	if(length(.))
		return pick(.)

	// Priority 3: Latejoin spawnpoints - Latejoin only
	if(round_started && length(latejoin_spawnpoints[role.team]))
		for(var/obj/landmark/spawnpoint/latejoin/S in latejoin_spawnpoints[role.team])
			if(!S.Available(M, null, harder))
				continue
			if(pref_method && (pref_method != S.method))
				continue
			. += S
	if(length(.))
		return pick(.)

	// Priority 3: Overflow spawnpoints - Roundstart/Latejoin
	if(length(overflow_spawnpoints[role.team]))
		for(var/obj/landmark/spawnpoint/overflow/S in overflow_spawnpoints[role.team])
			if(!S.Available(M, null, harder))
				continue
			. += S
	if(length(.))
		return pick(.)

	. = null
	if(!harder)
		subsystem_log("get_role_spawnpoint() failed to get a spawnpoint, trying against with harder = TRUE")
		return get_role_spawnpoint(M, role_id, TRUE)
	else
		CRASH("get_role_spawnpoint() failed to get a spawnpoint.")

