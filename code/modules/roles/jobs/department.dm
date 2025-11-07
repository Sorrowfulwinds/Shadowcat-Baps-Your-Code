// A datum that holds information about a specific department.
// It is held inside, and managed by, the SSjob subsystem automatically,
// just define a department, and put that department's name in one or more job datums' departments list.
/datum/prototype/struct/department
	abstract_type = /datum/prototype/struct/department

	//! Don't forget to set the ID downstream
	//id = "DeptGenericName"

	/// Name used in UIs, and the index for the department assoc list in SSjob.
	var/const/name = "NOPE"
	/// Shorter name, used for things like external Topic() responses.
	var/const/short_name = "NO"
	/// Color to use in UIs to represent this department.
	var/const/color = "#000000"
	///Lazy Assoc list. Key is the job ID, and the value is a reference to the job datum. Populated by SSjob subsystem.
	var/tmp/alist/jobs = null
	/// Same as above, but only jobs with their 'primary' department are put here. Primary being the first department in their list.
	var/tmp/alist/primary_jobs = null
	/// Used to sort departments, e.g. Command always being on top. 0 is highest priority.
	var/const/sorting_order = 0
	/// Departmental pay modifier
	var/const/economy_payscale = ECONOMY_PAYSCALE_DEPT_DEFAULT

/**
 * Generic departments can go here. These are all applicable to a lot of situations so I will leave them stuffed together.
 */

/datum/prototype/struct/department/cargo
	id = "DeptCargo"
	name = "Cargo"
	short_name = "Car"
	color = "#BB9040"
	sorting_order = 7
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SUP

/datum/prototype/struct/department/civilian
	id = "DeptCivilian"
	name = "Civilian"
	short_name = "Civ"
	color = "#A32800"
	sorting_order = 10
	economy_payscale = ECONOMY_PAYSCALE_DEPT_CIV

/datum/prototype/struct/department/command
	id = "DeptCivilian"
	name = "Command"
	short_name = "Heads"
	color = "#3333FF"
	sorting_order = 1
	economy_payscale = ECONOMY_PAYSCALE_DEPT_COM

/datum/prototype/struct/department/engineering
	id = "DeptEngineering"
	name = "Engineering"
	short_name = "Eng"
	color = "#B27300"
	sorting_order = 3
	economy_payscale = ECONOMY_PAYSCALE_DEPT_ENG

/datum/prototype/struct/department/exploration
	name = "Exploration"
	short_name = "Explo"
	color = "#bab421"
	sorting_order = 6
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SUP

/datum/prototype/struct/department/medical
	id = "DeptMedical"
	name = "Medical"
	short_name = "Med"
	color = "#006600"
	sorting_order = 4
	economy_payscale = ECONOMY_PAYSCALE_DEPT_MED

/datum/prototype/struct/department/research
	id = "DeptResearch"
	name = "Research"
	short_name = "Sci"
	color = "#A65BA6"
	sorting_order = 5
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SCI

/datum/prototype/struct/department/security
	id = "DeptSecurity"
	name = "Security"
	short_name = "Sec"
	color = "#8E0000"
	sorting_order = 2
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SEC

/**
 * These aren't as generic but I'll leave them here for now. Some of these might become useless with more refactors on their constituents.
 */

/datum/prototype/struct/department/centcom
	id = "DeptCentCom"
	name = "Central Command"
	short_name = "Centcom"
	color = "#A52A2A"
	sorting_order = 0

/datum/prototype/struct/department/misc
	id = "DeptMisc"
	name = "Miscellaneous"
	short_name = "Misc"
	color = "#666666"
	sorting_order = 18

/datum/prototype/struct/department/offduty
	id = "DeptOffDuty"
	name = "Off-Duty"
	short_name = "Offduty"
	color = "#666666"
	sorting_order = 15

/datum/prototype/struct/department/synthetic
	id = "DeptSynthetic"
	name = "Synthetic"
	short_name = "Bot"
	color = "#222222"
	sorting_order = 20
