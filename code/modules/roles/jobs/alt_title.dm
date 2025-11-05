/**
 * This datum is for holding alternate titles for roles. It allows you to change the title name, add to the description blurb, and change the outfit equipped. An alt-title may only be attached to a single role for simplicity. This allows fluff variation for roles without needing to manage them as unique standalone roles.
 */
/datum/prototype/struct/alt_title
	abstract_type = /datum/prototype/struct/alt_title

	//! Don't forget to set the ID downstream
	//id = "AltTitleGenericAltTitle"

	/// Datum ID of the role allowed to use this title
	var/const/parent_id

	/// Overwrites the base role title.
	var/const/title = "GENERIC ALT TITLE"
	/// Is amended to the base role description. If nothing is added, leave null.
	var/const/title_blurb
	/// Overwrites the base role outfit. If it's the same as the base role, leave null.
	var/const/title_outfit
