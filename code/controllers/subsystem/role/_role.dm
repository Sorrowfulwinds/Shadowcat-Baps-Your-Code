/**
 * Subsystem for tracking available roles/jobs/ghostroles/antagonists/whatever and the total slots available for those roles.
 */
SUBSYSTEM_DEF(role)
	name = "Role"
	init_order = INIT_ORDER_JOBS
	init_stage = INIT_STAGE_EARLY
	subsystem_flags = SS_NO_FIRE

	///Max slots for each role in play, alist of id : count
	var/tmp/alist/roles_total = alist()
	///Remaining slots for each role, alist of id : count
	var/tmp/alist/roles_open = alist()
	///The last time we updated the any of the above roles alists. For caching checks.
	var/tmp/last_change = world.time
	///Default fallback role id. Set by the datum/map loaded.
	var/tmp/fallback_role_id

/datum/controller/subsystem/role/Initialize(timeofday)
	//Maps will self register new roles to jobs. populate_departments() must be called before then to work.
	_populate_departments()
	return SS_INIT_SUCCESS

/**
 * Adds [count] of [id] slots to the game. Invalidates role cache.
 */
/datum/controller/subsystem/role/proc/add_slots(id, count = 0, _register = TRUE)
	if(!RSroles.verify_id(id))
		//TODO CAT: Output an error for this. Bad id here means bad code somewhere else.
		return
	if(_register)
		_sort_jobs_into_departments(alist(id = count))

	if(roles_total[id] == INFINITY)
		return

	count = abs(count)
	//Add change to existing entry, else set new entry.
	roles_total[id] = roles_total[id] ? (roles_total[id] + count) : count
	//Add change to existing entry, else set new entry.
	roles_open[id] = roles_open[id] ? (roles_open[id] + count) : count
	last_change = world.time

/**
 * Removes [count] of [id] slots from the game. Invalidates role cache.
 * Does not affect players already in that id.
 */
/datum/controller/subsystem/role/proc/remove_slots(id, count = 0)
	if(!RSroles.verify_id(id))
		//TODO CAT: Output an error for this. Bad id here means bad code somewhere else.
		return
	if(isnull(roles_total[id]) || roles_open[id] == INFINITY)
		return

	count = abs(count)
	if(roles_total[id] <= count)
		roles_total.Remove(id)
		roles_open.Remove(id)
	else
		roles_total[id] -= count
		roles_open[id] = max(0, roles_open[id] - count)

	last_change = world.time

/**
 * Set a [id] slot to occupied. Use this when someone is assigned a role.
 * Does nothing if id does not exist or if all slots are already occupied.
 */
/datum/controller/subsystem/role/proc/fill_role(id)
	if(!RSroles.verify_id(id))
		return
		//TODO CAT: Also output a warning here.
	if(isnull(roles_open[id]) || roles_open[id] == INFINITY)
		return

	roles_open[id] = max(0, roles_open[id] - 1)
	last_change = world.time

/**
 * Free a [id] slot. Use this when someone leaves/is unassigned from a role.
 * Respects role_total maximums.
 */
/datum/controller/subsystem/role/proc/unfill_role(id)
	if(!RSroles.verify_id(id))
		return
		//TODO CAT: also also put a warning here too.
	if(isnull(roles_open[id]) || roles_open[id] == INFINITY)
		return

	roles_open[id] = min(roles_total[id], roles_open[id] + 1)
	last_change = world.time

/**
 * add_slots but for entire alists of roles
 * @params
 *  - fresh_roles - The roles alist of ID - Count you want to add.
 * @returns void
 */
/datum/controller/subsystem/role/proc/bulk_add_slots(alist/fresh_roles)
	for(var/role, count in fresh_roles)
		add_slots(role, count, FALSE)
	_sort_jobs_into_departments(fresh_roles)

/**
 * Set a role to Infinite availability or back to a finite amount. Role must already exist with at least one slot.
 * @params
 * - id - The id the role you want to set inifinity on.
 * - isInfinite - TRUE/FALSE
 * - finite_count = 1 - (Optional) If isInfinite is FALSE it will set the role to this many open slots. Must be at least 1.
 */
/datum/controller/subsystem/role/proc/set_role_infinity(var/id, var/isInfinite = TRUE, finite_count = 1) as null
	if(isnull(roles_total[id]) || finite_count < 1)
		return

	if(isInfinite)
		roles_total[id] = INFINITY
		roles_open[id] = INFINITY
	else
		roles_total[id] = finite_count
		roles_open[id] = finite_count
	last_change = world.time

/**
 * Get the number of slots open for a role.get_slots_available(id)
 * @params
 * - id - a valid role id
 * @returns
 * - 0 to INFINITY
 */
/datum/controller/subsystem/role/proc/get_slots_available(id) as num
	if (isnull(roles_open[id]) || !roles_open[id])
		return 0
	return roles_open[id]

