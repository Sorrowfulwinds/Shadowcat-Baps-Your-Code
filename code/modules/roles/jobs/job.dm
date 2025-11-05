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
	var/supervisors = "Big Jim and the investors"
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
	/// List of department IDs this position is manager of.
	var/departments_managed = null
	/// List of department accounts this position gets PINs of.
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

