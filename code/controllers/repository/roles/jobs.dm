/**
 * !!/role/job specific calls
 */

/**
 * Only returns /datum/prototype/role/job
 */
/datum/controller/repository/roles/proc/get_all_job_ids(filter_faction) as /list
	. = list()
	for(var/datum/prototype/role/job/r as anything in fetch_subtypes_immutable(/datum/prototype/role/job))
		. += r.id

/**
 * Only returns /datum/prototype/role/job
 */
/datum/controller/repository/roles/proc/get_all_job_types(filter_faction) as /list
	. = list()
	for(var/datum/prototype/role/job/r as anything in fetch_subtypes_immutable(/datum/prototype/role/job))
		. += r.type

/**
 * Only returns /datum/prototype/role/job
 */
/datum/controller/repository/roles/proc/get_all_job_titles(filter_faction) as /list
	. = list()
	for(var/datum/prototype/role/job/r as anything in fetch_subtypes_immutable(/datum/prototype/role/job))
		. += r.title

/**
 * Only returns /datum/prototype/role/job
 */
/datum/controller/repository/roles/proc/get_all_job_datums(filter_faction) as /list
	. = list()
	for(var/datum/prototype/role/job/r as anything in fetch_subtypes_immutable(/datum/prototype/role/job))
		. += r

/**
 * Only returns /datum/prototype/role/job
 */
/datum/controller/repository/roles/proc/legacy_all_sorted_job_datums(filter_faction) as /list
	. = get_all_job_datums(filter_faction)
	tim_sort(., /proc/cmp_job_datums)
