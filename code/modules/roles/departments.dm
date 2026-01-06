/**
 * A datum to hold information about specific departments for datum/role/jobs
 * Handled by SSroles.
 * Used for payscale and organizing things in manifests/timeclocks/id consoles.
 */
/datum/department
	/// Name used in UIs.
	var/const/name = "NOPE"
	/// UID and the index for the department assoc list in SSrole.
	var/const/id = "DeptCoderoops"
	/// Color to use in UIs to represent this department.
	var/const/color = COLOR_BLACK
	/// Job IDs with their 'primary' department are put here. Primary being the first department in their department list.
	var/list/primary_jobs = list()
	/// List of job IDs with this department not as its primary (not first in the department list).
	var/list/secondary_jobs = list()
	/// Used to sort departments in UIs, larger number means higher placement.
	var/sorting_order = 0
	/// starting pay modifier
	var/const/economy_payscale = ECONOMY_PAYSCALE_DEPT_DEFAULT

/datum/department/cargo
	name = DEPARTMENT_CARGO
	id = "DeptCargo"
	color = "#BB9040"
	sorting_order = 7
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SUP

/datum/department/centcom
	name = "Central Command"
	id = "DeptCentCom"
	color = "#A52A2A"
	sorting_order = 20
	economy_payscale = ECONOMY_PAYSCALE_DEPT_COM

/datum/department/civilian
	name = DEPARTMENT_CIVILIAN
	id = "DeptCivilian"
	color = "#A32800"
	sorting_order = 10
	economy_payscale = ECONOMY_PAYSCALE_DEPT_CIV

/datum/department/command
	name = DEPARTMENT_COMMAND
	id = "DeptCommand"
	color = "#3333FF"
	sorting_order = 1
	economy_payscale = ECONOMY_PAYSCALE_DEPT_COM

/datum/department/engineering
	name = DEPARTMENT_ENGINEERING
	id = "DeptEngineering"
	color = "#B27300"
	sorting_order = 3
	economy_payscale = ECONOMY_PAYSCALE_DEPT_ENG

/datum/department/medical
	name = DEPARTMENT_MEDICAL
	id = "DeptMedical"
	color = "#006600"
	sorting_order = 4
	economy_payscale = ECONOMY_PAYSCALE_DEPT_MED

/datum/department/misc
	name = "Off-Duty"
	id = "DeptMisc"
	color = "#666666"
	sorting_order = 15

/datum/department/exploration
	name = DEPARTMENT_PLANET
	id = "DeptExploration"
	color = "#bab421"
	sorting_order = 6
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SUP

/datum/department/research
	name = DEPARTMENT_RESEARCH
	id = "DeptResearch"
	color = "#A65BA6"
	sorting_order = 5
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SCI

/datum/department/security
	name = DEPARTMENT_SECURITY
	id = "DeptSecurity"
	color = "#8E0000"
	sorting_order = 2
	economy_payscale = ECONOMY_PAYSCALE_DEPT_SEC

/datum/department/synthetic
	name = DEPARTMENT_SYNTHETIC
	id = "DeptSynthetic"
	color = "#222222"
	sorting_order = 20


