SUBSYSTEM_DEF(role)
	name = "Role"
	init_order = INIT_ORDER_JOBS
	init_stage = INIT_STAGE_EARLY
	subsystem_flags = SS_NO_FIRE

	///All available roles associated with available slots count.
	var/alist/roles_in_play = alist()
	///All actively filled roles associated with filled slots count.
	var/alist/roles_filled = alist()
	///All roles suppressed by admin fiat with total suppressed count.
	var/alist/supressed_roles = alist()

/datum/controller/subsystem/role/Initialize(timeofday)
	//todo: Go forth and gather all roles_in_play from map datums.
	return SS_INIT_SUCCESS

/datum/controller/subsystem/role/add_role_slots(role_id, count)
	//todo: add slots

/datum/controller/subsystem/role/remove_role_slots(role_id, count)
	//todo: remove slots







//todo: stuff
//todo: Handle tracking available roles. func for registering roles, checking out roles, checking in roles. Register all map-load roles. Handle round-start assignment of roles.
