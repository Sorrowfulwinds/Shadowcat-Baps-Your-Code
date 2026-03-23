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

	//? Unsorted
	/// Selection screen color
	var/selection_color = COLOR_WHITE
	/// List of departments this job belongs to, if any. The first one on the list will be the 'primary' department.
	var/list/departments = list()
	/// Used for sorting jobs so boss jobs go above regular ones, and their boss's boss is above that. Larger number = higher in sorting.
	var/sorting_order = SSR_NOBODY

	/// Is this a management position?  If yes, list of departments managed.  Otherwise null.
	var/departments_managed = null
	/// Which department accounts should people with this position be given the pin for? Hint: should match departments_managed.
	var/department_accounts = null

	/// How young a character can be for this job
	var/minimum_character_age = 0

	/// Should it show up on things like the ID computer?
	var/can_assign = TRUE
	// Allow joining as this job midround from off-duty position via going on-duty
	var/allow_jobhop = TRUE

	roundstart_flag = SSR_DURING_ASSIGNMENT
	instancer = /datum/role_instantiator/job
	//uninstancer // TODO CAT: blah

/datum/prototype/role/job/get_access()
	. = ..()
	if(team == JOB_FACTION_STATION && CONFIG_GET(flag/almost_everyone_has_maintenance_access))
		. |= ACCESS_ENGINEERING_MAINT

/datum/prototype/role/job/VerifyPlayer(mob/player, datum/prototype/alt_title/alt_title, ignore_slots)
	. = ..()
	if(!.)
		return .
	var/datum/preferences/prefs = player.client.prefs

	if(prefs.age < minimum_character_age)
		return "Your character is too young; they must be at least [minimum_character_age] years old."
	if(!prefs.lore_faction_job_check(src))
		return "Your character is of the wrong faction."
	if(!prefs.character_species_job_check(src))
		return "This species is not allowed in this job."

	return .

/datum/prototype/role/job/proc/get_economic_payscale()
	if(departments[1])
		var/datum/department/dept = all_departments[departments[1]]
		return economy_payscale * dept.economy_payscale
	return economy_payscale
