/**
 * Employment simulator roles. You work for a corporation and they pay you money.
 */
/datum/prototype/role/job
	/// Abstract type.
	abstract_type = /datum/prototype/role/job

	//? Intrinsics
	//! Dont forget id on children.
	//id = JobNtStationEngineer

	//? Economy
	/// starting money multiplier
	var/economy_payscale = ECONOMY_PAYSCALE_JOB_DEFAULT

	//? Access
	// Job access. The use of minimal_access and additional_access is determined by a config setting: config.jobs_have_minimal_access
	/// Minimal access
	var/list/minimal_access = list()
	/// With minimal access off, this gets added
	var/list/additional_access = list()

	//? Unsorted
	/// Selection screen color
	var/selection_color = COLOR_WHITE
	/// List of departments this job belongs to, if any. The first one on the list will be the 'primary' department.
	var/list/departments = list()
	/// Used for sorting jobs so boss jobs go above regular ones, and their boss's boss is above that. Larger number = higher in sorting.
	var/sorting_order = 0

	/// Is this a management position?  If yes, list of departments managed.  Otherwise null.
	var/departments_managed = null
	/// Which department accounts should people with this position be given the pin for? Hint: should match departments_managed.
	var/department_accounts = null

	/// How young a character can be for this job
	var/minimum_character_age = 0
	/// Character age discrimination for roundstart job assignment lottery
	var/ideal_character_age = 30

	/// Should it show up on things like the ID computer?
	var/can_assign = TRUE
	// Allow joining as this job midround from off-duty position via going on-duty
	var/allow_jobhop = TRUE
