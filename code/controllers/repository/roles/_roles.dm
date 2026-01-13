//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

REPOSITORY_DEF(roles)
	name = "Repository - Roles"
	expected_type = /datum/prototype/role

/**
 * Verifies a role prototype id exists
 * @return
 * TRUE/FALSE
 */
/datum/controller/repository/roles/proc/verify_id(id)
	for(var/datum/prototype/role/r in fetch_subtypes_immutable(/datum/prototype/role))
		if (r.id == id)
			return TRUE
	return FALSE

/**
 * Only returns /datum/prototype/role
 */
/datum/controller/repository/roles/proc/get_role_by_id(id) as /datum/prototype/role
	return fetch_local_or_throw(id)

/**
 * Only returns /datum/prototype/role
 */
/datum/controller/repository/roles/proc/get_role_by_type(type) as /datum/prototype/role
	return fetch_local_or_throw(type)

/**
 * Only returns /list
 */
/datum/controller/repository/roles/proc/get_all_role_ids() as /list
	. = list()
	for(var/datum/prototype/role/r as anything in fetch_subtypes_immutable(/datum/prototype/role))
		. += r.id

/**
 * Only returns /list
 */
/datum/controller/repository/roles/proc/get_all_role_types() as /list
	. = list()
	for(var/datum/prototype/role/r as anything in fetch_subtypes_immutable(/datum/prototype/role))
		. += r.type

/**
 * Only returns /list
 */
/datum/controller/repository/roles/proc/get_all_role_titles() as /list
	. = list()
	for(var/datum/prototype/role/r as anything in fetch_subtypes_immutable(/datum/prototype/role))
		. += r.title

/**
 * Only returns a /list of /datum/prototype/role
 */
/datum/controller/repository/roles/proc/get_all_role_datums() as /list
	. = list()
	for(var/datum/prototype/role/r as anything in fetch_subtypes_immutable(/datum/prototype/role))
		. += r

/**
 * Only returns a /list of /datum/prototype/role
 */
/datum/controller/repository/roles/proc/legacy_all_sorted_role_datums() as /list
	. = get_all_role_datums()
	tim_sort(., /proc/cmp_job_datums)
