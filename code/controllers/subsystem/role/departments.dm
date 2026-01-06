///All departments keyed by id - datum/department
var/alist/all_departments = alist()

/**
 *
 */
/datum/controller/subsystem/role/proc/populate_departments()
	all_departments = alist()

	for(var/datum/department/dept in (typesof(/datum/department)-/datum/department))
		all_departments[dept.id] = dept

	for(var/roleid, _value in roles_total)
		var/datum/prototype/role/job/role = RSroles.get_role_by_id(roleid)
		if(!istype(role))
			continue
			//TODO CAT: Complain someone screwed up bad
		for(var/role_dept_id in role.departments)
			if(role_dept_id == role.departments[1])
				all_departments[role_dept_id]?:primary_jobs?:Add(roleid)
				continue
			all_departments[role_dept_id]?:secondary_jobs?:Add(roleid)

