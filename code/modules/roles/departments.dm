/**
 * A datum to hold information about specific departments for datum/role/jobs
 * Handled by SSroles.
 * Used for payscale and organizing things in manifests/timeclocks/id consoles.
 */
/datum/department
	/// Name used in UIs, and the index for the department assoc list in SSrole.
	var/name = "NOPE"
	/// Color to use in UIs to represent this department.
	var/color = COLOR_BLACK
	/// List of jobs in this department by id.
	var/list/jobs = list()
	/// Same as above, but only jobs with their 'primary' department are put here. Primary being the first department in their list.
	var/list/primary_jobs = list()
	/// Used to sort departments in UIs, larger number means higher placement.
	var/sorting_order = 0
	/// starting pay modifier
	var/economy_payscale = ECONOMY_PAYSCALE_DEPT_DEFAULT
