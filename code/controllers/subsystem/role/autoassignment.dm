/**
 * Does math and stuff to assign ready players to roles
 */
/datum/controller/subsystem/role/proc/auto_assign_ready_roles() as list|num
	#define ROLE_KEY 1
	#define COUNT_KEY 2


	//This proc should ONLY be run at roundstart.
	if(SSticker.current_state != GAME_STATE_SETTING_UP)
		return FALSE

	///The final return variable keyed mob/new_player : role_id
	var/alist/final_player_assignments = alist()

	/**
	 * ?Divide all current roles by assignment flags in order of priority.
	 */
	var/list/pre_assign = list()
	var/list/assign = list()
	var/list/post_assign = list()

	for(var/key, total in roles_total)
		var/datum/prototype/role/role = RSroles.get_role_by_id(key)

		if(role.roundstart_flag & SSR_NO_ASSIGNMENT)
			continue
		if(role.roundstart_flag & SSR_PRE_ASSIGNMENT)
			pre_assign[key] = list(role, total)
			continue
		if(role.roundstart_flag & SSR_DURING_ASSIGNMENT)
			assign[key] = list(role, total)
			continue
		if(role.roundstart_flag & SSR_POST_ASSIGNMENT)
			post_assign[key] = list(role, total)
			continue

	/**
	 * ?Gather all players that are ready and divide their data into useful segments
	 */
	///All players that are ready and unassigned.
	var/list/ready_players = list()

	///keyed mob/new_player : JOB_ALTERNATIVE_X
	var/alist/player_nopick_choices = alist()
	///keyed mob/new_player : list(role_id : alt_title_id)
	var/alist/player_alt_titles = alist()

	// I know its a horrible 3D list setup but it makes processing it so much easier.
	///list of priorities (high, med, low) >> list(role_id : list(mob/new_player))
	var/list/pre_assign_priorities 	= list(list(), list(), list())
	var/list/assign_priorities 		= list(list(), list(), list())
	var/list/post_assign_priorities = list(list(), list(), list())
	//I lied its a 4D list
	var/list/all_assignments = list(pre_assign_priorities, assign_priorities, post_assign_priorities)


	for(var/mob/new_player/player in GLOB.player_list)
		if(!player.client)
			continue
		if(player.client.persistent.ligma) //ligma balls
			log_shadowban("[player] ([player.client]) roundstart blocked")
			continue
		if(!player.ready && !player.mind && player.mind.assigned_role_id)
			continue

		ready_players += player
		player_nopick_choices[player] = player.client.prefs.get_character_data(CHARACTER_DATA_OVERFLOW_MODE)
		player_alt_titles[player] = player.client.prefs.get_character_data(CHARACTER_DATA_ALT_TITLES)

		var/list/priorities = player.client.prefs.get_character_data(CHARACTER_DATA_JOBS)
		for(var/id, prio in priorities)
			///Are we LOW/MEDIUM/HIGH desire
			switch(prio)
				if(JOB_PRIORITY_HIGH)
					prio = 1
				if(JOB_PRIORITY_MEDIUM)
					prio = 2
				if(JOB_PRIORITY_LOW)
					prio = 3
				else //Player doesn't want this, leave.
					continue

			///Are we pre/during/post assignment role
			var/assid = 0
			if(pre_assign[id])
				assid = 1
			else if(assign[id])
				assid = 2
			else if(post_assign[id])
				assid = 3
			else //Role isn't anything we care about, leave.
				continue

			///Assign player to the ID's list sorted into its proper categories.
			LAZYADDASSOC(all_assignments[assid][prio], player, id)

	if(!ready_players.len) //Nobody here
		return FALSE


	/**
	 * ?SSR_PRE_ASSIGN
	 * ? Attempt to fill *ALL* pre_assign roles first. These are intended to be early grab important antags or similar roles that must be filled.
	 * Assigns jobs biased by player priority but it will keep going until it runs out of players with any priority or until it runs out of roles to work on.
	 * TODO: JOB_PRIORITY_ULTRA 4 to replace antag check boxes? PRE and POST Assign jobs shouldnt really use priority at all as its not respected compared to everything else.
	 */
	shuffle_inplace(pre_assign)
	for(var/pre_role_id, pair_key in pre_assign)
		/// pair_key[ROLE_KEY] is role, pair_key[COUNT_KEY] is count
		var/datum/prototype/role/pre_role = pair_key[ROLE_KEY]

		/// Iterate through each priority HIGH > MED > LOW
		for(var/list/single_priority_list in pre_assign_priorities)
			shuffle_inplace(single_priority_list[pre_role_id])

			/// Iterate through the players in each priority list
			for(var/player in single_priority_list[pre_role_id])
				if(player in ready_players)
					if(!pre_role.VerifyPlayer(player, player_alt_titles[player]?[pre_role_id], FALSE))
						final_player_assignments[player] = pre_role_id
						ready_players.Remove(player)

						pre_assign[pre_role_id][COUNT_KEY]--
						if(!pre_assign[pre_role_id][COUNT_KEY])
							goto PriorityDoubleLoopExit
		//Exits the double loop
		PriorityDoubleLoopExit: //Need to goto to here unless byond lets us do a double break

	/**
	 * ? SSR_DURING_ASSIGN
	 * ? Attempt to fill all roles in the DURING_ASSIGNMENT category. This section does respect priority when handing out jobs. These are your normal station jobs.
	 */
	/// Iterate through each priority HIGH>LOW, then
	for(var/list/single_priority_list in assign_priorities)
		//Check that we haven't run out of players
		if(!ready_players.len) break

		/// Iterate through all roles in the single priority
		shuffle_inplace(single_priority_list)
		for(var/role_id, player_list in single_priority_list)
			var/datum/prototype/role/role = assign[role_id][ROLE_KEY]
			//Check that we haven't run out of players again
			if(!ready_players.len) break

			/// Iterate through each player and give them the role if valid.
			shuffle_inplace(player_list)
			for(var/player in player_list)

				if(player in ready_players)
					if(!role.VerifyPlayer(player, player_alt_titles[player]?[role_id], FALSE))
						final_player_assignments[player] = role_id
						ready_players.Remove(player)

						assign[role_id][COUNT_KEY]--
						//If role is full break to next role and clear it.
						if(!assign[role_id][COUNT_KEY])
							assign.Remove(role_id)
							break

	/**
	 * ? FALLBACK CHOICE
	 * ? At this point any players left in ready_players has no prioritized role to claim. They need to be flushed out to the lobby/assistant/random role.
	 */
	for(var/remaining_player in ready_players)
		switch(player_nopick_choices[remaining_player])
			if(JOB_ALTERNATIVE_GET_RANDOM)
				var/tries = 3
				while(tries)
					var/random_job = pick(assign)
					if(assign[random_job][COUNT_KEY])
						final_player_assignments[remaining_player] = random_job
						break
					tries--

				//If we can't find something in 3 tries just make them an assistant.
				final_player_assignments[remaining_player] = fallback_role_id

			if(JOB_ALTERNATIVE_BE_ASSISTANT)
				final_player_assignments[remaining_player] = fallback_role_id

			if(JOB_ALTERNATIVE_RETURN_LOBBY)
				INVOKE_ASYNC(remaining_player, TYPE_PROC_REF(/mob/new_player, new_player_panel_proc))
				to_chat(remaining_player, SPAN_WARNING("You have been returned to the lobby, as you do not qualify for any selected role(s)."))

	/**
	 * ? SSR_POST_ASSIGN
	 * ? Assign special roles to
	 */
















