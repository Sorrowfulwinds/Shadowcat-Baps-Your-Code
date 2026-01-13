///All departments keyed by id - datum/department
var/alist/all_departments

/**
 * Internal setup proc - Called on init
 * Populate all_departments var with datum/department's
 */
/datum/controller/subsystem/role/proc/_populate_departments()
	all_departments = alist()

	for(var/datum/department/dept in (typesof(/datum/department)-/datum/department))
		all_departments[dept.id] = dept


/**
 * Internal proc
 * Sorts an alist of jobs into
 */
/datum/controller/subsytem/role/proc/_sort_jobs_into_departments(alist/new_jobs)
	for(var/roleid, _value in new_jobs)
		var/datum/prototype/role/job/role = RSroles.get_role_by_id(roleid)

		for(var/role_dept_id in role.departments)
			var/datum/department/dept = all_departments[role_dept_id]
			if(role_dept_id == role.departments[1])
				dept.primary_jobs.Add(roleid)
				continue
			dept.secondary_jobs.Add(roleid)
