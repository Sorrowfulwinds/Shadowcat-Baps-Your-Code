var/list/datum/spawnpoint/spawntypes = alist()

//TODO: Delete /datum/spawnpoint and just use method directly
/proc/populate_spawn_points()
	spawntypes = alist()
	for(var/type in typesof(/datum/spawnpoint)-/datum/spawnpoint)
		var/datum/spawnpoint/S = new type()
		//Only keep map valid spawns to simplify lookup
		if (S.method in (LEGACY_MAP_DATUM).allowed_spawns)
			spawntypes[S.method] = S

// pending removal
/datum/spawnpoint
	// join method
	var/method
	var/display_name //Name used in preference setup.
	var/list/restrict_job = null
	var/list/disallow_job = null
	var/announce_channel = "Common"

/datum/spawnpoint/proc/check_job_spawning(job)
	if(restrict_job && !(job in restrict_job))
		return 0

	if(disallow_job && (job in disallow_job))
		return 0

	return 1

/datum/spawnpoint/arrivals
	display_name = LATEJOIN_METHOD_ARRIVALS_SHUTTLE
	method = LATEJOIN_METHOD_ARRIVALS_SHUTTLE

/datum/spawnpoint/gateway
	display_name = LATEJOIN_METHOD_GATEWAY
	method = LATEJOIN_METHOD_GATEWAY

/datum/spawnpoint/cryo
	display_name = LATEJOIN_METHOD_CRYOGENIC_STORAGE
	disallow_job = list("Cyborg")
	method = LATEJOIN_METHOD_CRYOGENIC_STORAGE

/datum/spawnpoint/cyborg
	display_name = LATEJOIN_METHOD_ROBOT_STORAGE
	restrict_job = list("Cyborg")
	method = LATEJOIN_METHOD_ROBOT_STORAGE
