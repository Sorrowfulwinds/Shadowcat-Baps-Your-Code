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
	var/const/economy_payscale = ECONOMY_PAYSCALE_JOB_DEFAULT

	//? Unsorted
	/// Selection screen color
	var/const/selection_color = COLOR_WHITE
	/// List of departments this job belongs to, if any. The first one on the list will be the 'primary' department.
	var/const/list/departments = list()
	/// Used for sorting jobs so boss jobs go above regular ones, and their boss's boss is above that. Larger number = higher in sorting.
	var/const/sorting_order = 0

	/// Is this a management position?  If yes, list of departments managed.  Otherwise null.
	var/const/departments_managed = null
	/// Which department accounts should people with this position be given the pin for? Hint: should match departments_managed.
	var/const/department_accounts = null

	/// How young a character can be for this job
	var/const/minimum_character_age = 0
	/// Character age discrimination for roundstart job assignment lottery
	var/const/ideal_character_age = 30

	/// Should it show up on things like the ID computer?
	var/const/can_assign = TRUE
	// Allow joining as this job midround from off-duty position via going on-duty
	var/const/allow_jobhop = TRUE

/datum/prototype/role/job/AttemptSpawn(mob/player, datum/prototype/alt_title/alt_title, ignore_availability)
	. = ..()
	if(. != TRUE)
		return .
	var/client/C = player.client

	if(C.prefs.age < minimum_character_age)
		return "Your character is too young; they must be at least [minimum_character_age] years old."
	if(!C.prefs.lore_faction_job_check(src))
		return "Your character is of the wrong faction."
	if(!C.prefs.character_species_job_check(src))
		return "This species is not allowed in this job."

	return .

/datum/prototype/role/job/get_access()
	. = ..()
	if(team == JOB_FACTION_STATION && CONFIG_GET(flag/almost_everyone_has_maintenance_access))
		. |= ACCESS_ENGINEERING_MAINT

