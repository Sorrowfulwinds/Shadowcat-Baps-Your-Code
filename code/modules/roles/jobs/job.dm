/**
 * A role in which you are employed by someone. Typically main ship crew but not limited to it.
 */
/datum/prototype/role/job
	abstract_type = /datum/prototype/role/job

	//! Don't forget the id downstream.
	// id = JobFtuCoffeeArtisan

	//? Intrinsics
	/// The name of the job used in ids, preferences, etc.  //!This is NOT used for identifying this job. That is what the id value is for.
	var/title = "Wage Slave"
	/// Description of the job
	var/desc = "No description provided."
	/// What outfit datum does this job use in its default title?
	var/outfit
	/// The id of the faction hosting this job. A veymed doctor working on station is an NT role.
	var/faction
	/// List of alternate title id's.
	var/list/alt_titles = null
	/// List of department IDs this job belongs to, if any. The first one on the list will be the 'primary' department.
	var/list/departments = null
	/// Supervisors text blurb, explain who this job reports too.
	var/supervisors = "Ultracommand and his lieutenants"
	/// Used for sorting jobs so boss jobs go above regular ones, and their boss's boss is above that. Higher numbers = higher in sorting.
	var/sorting_order = 0

	//? Economy
	/// starting money multiplier
	var/economy_payscale = ECONOMY_PAYSCALE_JOB_DEFAULT
	/// Does this role get a bank account? (Tribals dont have banks!)
	var/account_allowed = TRUE

	//? Access
	// Job access. The use of minimal_access and additional_access is determined by a config setting: config.jobs_have_minimal_access
	/// Minimal access
	var/list/minimal_access = null
	/// With minimal access off, this gets added
	var/list/additional_access = null
	/// List of department IDs and accounts this position is manager of.
	var/departments_managed = null
	/// List of additional department accounts this position gets PINs of.
	var/department_accounts = null

	//? Off-Duty
	/// are we an off duty role?
	var/is_off_duty = FALSE
	/// Disallow joining as this job midround from off-duty position via going on-duty
	var/disallow_jobhop = FALSE

	//? Restrictions & Admin
	/// Determines if this job can be spawned into by players
	var/join_types = JOB_ROUNDSTART | JOB_LATEJOIN
	/// Should it show up on things like the manifest?
	var/is_manifest = TRUE
	/// Should it show up on things like the ID computer?
	var/is_assignable = TRUE
	/// If this is set to TRUE, a text is printed to the player when jobs are assigned, telling him that he should let admins know that he has to disconnect.
	var/req_admin_notify = FALSE
	/// If you have use_age_restriction_for_jobs config option enabled and the database set up, this option will add a requirement for players to be at least minimal_player_age days old. (meaning they first signed in at least that many days before.)
	var/minimal_player_age = 0
	/// Minimum lore age of the character to join this role.
	var/minimum_character_age = 0
	/// Weights the roundstart job picker towards characters of this lore age.
	var/ideal_character_age = 30
	/// Requires a ckey to be whitelisted in jobwhitelist.txt
	var/whitelist_only = FALSE

	//? Available positions
	//! Holding this here for legacy support. These should not be hardcoded on the role itself in the future but added dynamically by maps/random gen/config list. And managed by SSroles.
	/// How many players can be this job.
	var/tmp/total_positions = 0
	/// How many players can spawn in as this job.
	var/tmp/spawn_positions = 0
	/// How many players have this job.
	var/tmp/current_positions = 0

	//? Unsorted
	/// Selection screen color
	var/selection_color = COLOR_WHITE
	///Do people with this job need to be given headsets and told how to use them?  E.g. Cyborgs don't.
	var/has_headset = TRUE
	/// Bitflags representing mob type this job spawns
	var/mob_type = JOB_CARBON

/datum/prototype/role/job/New()
	. = ..()
	department_accounts = department_accounts || departments_managed

//? Availability
/**
 * checks slots remaining
 *
 * @return 0 to X number of slots remaining.
 */
/datum/prototype/role/job/proc/slots_remaining(latejoin)
	//If roundstart, return available spawns.
	if(!latejoin)
		if(spawn_positions == -1)
			return INFINITY
		return max(spawn_positions, 0)
	//If latejoin, return available positions.
	if(total_positions == -1)
		return INFINITY
	return max(total_positions - current_positions, 0)

/**
 * how many days till the client unlocks this role
 *
 * @return 0 to X number of days remaining.
 */
/datum/prototype/role/job/proc/unlocks_in_daysclient/C)
	if(C.has_jexp_bypass())
		return 0
	if(!CONFIG_GET(flag/job_check_account_age))
		return 0
	if(isnum(C.player.player_age) && isnum(minimal_player_age))
		return max(0, minimal_player_age - C.player.player_age)
	return 0

/**
 * checks if we're available for a given client,
 * but short circuits with the most common checks first
 * for efficiency
 *
 * @params
 * - C - client
 * - check_char - TRUE/FALSE check the current loaded character for violations
 *
 * @return ROLE_UNAVAILABLE_X bitflag
 * todo: check ckey proc too?
 */
/datum/prototype/role/job/proc/check_client_availability(client/C, check_char, latejoin)
	. = NONE
	if(whitelist_only && !Configuration.check_role_whitelist(id, C.ckey))
		return ROLE_UNAVAILABLE_WHITELIST
	else if(latejoin && !slots_remaining(TRUE))
		return ROLE_UNAVAILABLE_SLOTS_FULL
	else if(jobban_isbanned(C.mob, title))
		return ROLE_UNAVAILABLE_BANNED
	else if(!unlocks_in_daysC))
		return ROLE_UNAVAILABLE_CONNECT_TIME
	if(check_char)
		var/datum/preferences/P = C.prefs
		if(P.age < minimum_character_age)
			return ROLE_UNAVAILABLE_CHAR_AGE
		//TODO: Unscrungle faction check
		if(!P.lore_faction_job_check(src))
			return ROLE_UNAVAILABLE_CHAR_FACTION
		//TODO: Dud check till Species V2
		if(!P.character_species_job_check(src))
			return ROLE_UNAVAILABLE_CHAR_SPECIES

	// todo: JEXP/ROLE-EXP hours system

/**
 * get an user-friendly reason of why they can't spawn as us
 *
 * @params
 * - C - client
 * - reason - ROLE_UNAVAILABLE_X bitfield
 *
 * @return a string explaining the first ROLE_UNAVAILABLE bitflag found.
 */
/datum/prototype/role/job/proc/get_availability_reason(client/C, reason)
	if(reason & ROLE_UNAVAILABLE_BANNED)
		return "BANNED"
	if(reason & ROLE_UNAVAILABLE_SLOTS_FULL)
		return "Slots are currently full; Please refresh the join menu."
	if(reason & ROLE_UNAVAILABLE_ROLE_TIME)
		return "You do not have enough hours in the relevant department(s)."
	if(reason & ROLE_UNAVAILABLE_WHITELIST)
		return "This role is whitelisted."
	if(reason & ROLE_UNAVAILABLE_CONNECT_TIME)
		return "Your account is too new; please wait a few days or contact administration if this is in error."
	if(reason & ROLE_UNAVAILABLE_CHAR_AGE)
		return "Your character is too young; they must be at least [minimum_character_age] years old."
	if(reason & ROLE_UNAVAILABLE_CHAR_FACTION)
		return "This faction is not allowed in this job."
	if(reason & ROLE_UNAVAILABLE_CHAR_SPECIES)
		return "This species is not allowed in this job."
	return "This role is available; seeing this message is a bug. How did you get here?"

/**
 * get a short abbreviation for why they can't spawn as us; used for preferences
 *
 * @params
 * - C - client
 * - reason - ROLE_UNAVAILABLE_X bitfield
 *
 * @return a short string explaining the first ROLE_UNAVAILABLE bitflag found.
 */
/datum/prototype/role/job/proc/get_availability_error(client/C, reason)
	if(reason & ROLE_UNAVAILABLE_BANNED)
		return "BANNED"
	if(reason & ROLE_UNAVAILABLE_SLOTS_FULL)
		return "SLOTS FULL"
	if(reason & ROLE_UNAVAILABLE_ROLE_TIME)
		return "INSUFFICIENT HOURS"
	if(reason & ROLE_UNAVAILABLE_WHITELIST)
		return "WHITELISTED"
	if(reason & ROLE_UNAVAILABLE_CONNECT_TIME)
		return C? "IN [unlocks_in_daysC)] DAYS" : "MIN ACCOUNT AGE"
	if(reason & ROLE_UNAVAILABLE_CHAR_AGE)
		return "MIN AGE: [minimum_character_age]"
	if(reason & ROLE_UNAVAILABLE_CHAR_FACTION)
		return "FACTION"
	if(reason & ROLE_UNAVAILABLE_CHAR_SPECIES)
		return "SPECIES"
	return "UNKNOWN (BUG)"

