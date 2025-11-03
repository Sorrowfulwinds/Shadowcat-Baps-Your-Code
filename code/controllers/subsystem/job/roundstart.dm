/datum/controller/subsystem/job
	/// players who need jobs
	var/list/mob/new_player/divide_unassigned
	/// cached list of job priorities by the player
	var/list/mob/new_player/divide_priorities
	/// cached list of job overflow preferences by the player
	var/list/mob/new_player/divide_overflows

/datum/controller/subsystem/job/proc/reset_occupations()
	dispose_unassigned()
	for(var/mob/new_player/NP in GLOB.player_list)
		if(NP?.mind)
			NP.mind.assigned_role = null
			NP.mind.special_role = null
	for(var/datum/prototype/role/job/job as anything in RSroles.legacy_all_job_datums())
		job.current_positions = 0

/datum/controller/subsystem/job/proc/gather_unassigned()
	//Get the players who are ready
	divide_unassigned = list()
	divide_priorities = list()
	divide_overflows = list()
	for(var/mob/new_player/player in GLOB.player_list)
		if(!player.client)	// git out
			continue
		if(player.client.persistent.ligma)
			log_shadowban("[player] ([player.client]) roundstart blocked")
			continue // bye :)
		if(player.ready && player.mind && !player.mind.assigned_role)
			divide_unassigned += player
		var/list/priorities = player.client.effective_job_priorities()
		var/overflow_mode = player.client.prefs.get_job_alternative()
		divide_priorities[player] = priorities
		divide_overflows[player] = overflow_mode

/datum/controller/subsystem/job/proc/dispose_unassigned()
	divide_unassigned = null
	divide_priorities = null
	divide_overflows = null
