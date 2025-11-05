/**
 * This datum is intended to hold basic information for a faction to attach to roles. This may be expanded later but lets admire its simplicity for now.
 * A "faction" may be a company, organization, government body, tribe, etc.
 */
/datum/prototype/struct/faction
	abstract_type = /datum/prototype/struct/faction

	//! Don't forget to set the ID downstream
	//id = "FactionGenericGuys"

	/// Name of the faction
	var/const/name = "Generic Company"
	/// Adverb for a member of this faction
	var/const/member_name = "Employee"
	/// Faction economy modifier later perhaps?
	// var/const/economy_payscale

///The only company that really matters
/datum/prototype/struct/faction/nanotransen
	id = "FactionNT"
	name = TSC_NT

/datum/prototype/struct/faction/freetrade
	id = "FactionFtu"
	name = "Free Trade Union"
	member_name = "Member"

/datum/prototype/struct/faction/oculum
	id = "FactionOcu"
	name = "Oculum News Network"
	member_name = "Reporter"

/datum/prototype/struct/faction/veymed
	id = "FactionVeyMed"
	name = TSC_VM

/datum/prototype/struct/faction/hephaestus
	id = "FactionHeph"
	name = TSC_HEPH

/datum/prototype/struct/faction/morpheus
	id = "FactionMorph"
	name = TSC_MORPH

/datum/prototype/struct/faction/bishop
	id = "FactionBishop"
	name = TSC_BC

/datum/prototype/struct/faction/glithari
	id = "FactionGlith"
	name = TSC_GIL

/datum/prototype/struct/faction/wardtak
	id = "FactionWardTak"
	name = TSC_WT

/datum/prototype/struct/faction/xion
	id = "FactionXion"
	name = TSC_XION

/datum/prototype/struct/faction/zenghu
	id = "FactionZeng"
	name = TSC_ZH
