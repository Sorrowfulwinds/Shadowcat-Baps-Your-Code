/**
 * Used to give role's alternate titles with modified descriptions or outfits.
 */
/datum/prototype/alt_title
	abstract_type = /datum/prototype/alt_title

	//!Set id on downstreams
	//id = "AltStationFungineer"

	/// What role is this alt_title used by.
	var/const/datum/prototype/role/parent_role = null

	/// New title to replace base title.
	var/const/title = "GENERIC ALT TITLE"
	/// Text to add to the base roles spawntext. If nothing's added, leave null.
	var/const/additional_spawntext = null
	/// The outfit used by the alt-title. If it's the same as the base job, leave this null.
	var/const/datum/outfit/outfit = null
