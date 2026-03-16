/**
 * Used to give roles different titles with modified descriptions or outfits.
 */
/datum/prototype/alt_title
	abstract_type = /datum/prototype/alt_title

	//!Set id on downstreams
	//id = "AltStationFungineer"

	/// New title to replace base title.
	var/title = "GENERIC ALT TITLE"
	/// Text to replace the roles menu_blurb text
	var/menu_blurb = null
	/// Text to replace the roles spawn_blurb text
	var/spawn_blurb = null
	/// Override the sorting order for this role.
	var/sorting_order = null
	/// The outfit used by the alt-title. If it's the same as the base job, leave this null.
	var/datum/outfit/outfit = null
	/// If outfit replaces the base role outfit or adds on too it.
	var/outfit_flag = SSR_UNIFORM_REPLACE
