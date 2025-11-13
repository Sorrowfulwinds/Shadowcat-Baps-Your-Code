SUBSYSTEM_DEF(role)
	name = "Role"
	init_order = INIT_ORDER_JOBS
	init_stage = INIT_STAGE_EARLY
	subsystem_flags = SS_NO_FIRE

/datum/controller/subsystem/role/Initialize(timeofday)
	return SS_INIT_SUCCESS

