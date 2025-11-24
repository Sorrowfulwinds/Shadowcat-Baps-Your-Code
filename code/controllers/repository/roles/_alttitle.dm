//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

REPOSITORY_DEF(alttitle)
	name = "Repository - Alt Titles"
	expected_type = /datum/prototype/alt_title

/**
 * Only returns /datum/prototype/alt_title
 */
/datum/controller/repository/alttitle/proc/get_alt_by_id(id) as /datum/prototype/alt_title
	return fetch_local_or_throw(id)
