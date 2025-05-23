SUBSYSTEM_DEF(planets)
	name = "Planets"
	init_order = INIT_ORDER_PLANETS
	priority = FIRE_PRIORITY_PLANETS
	wait = 2 SECONDS
	subsystem_flags = SS_BACKGROUND
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/static/list/new_outdoor_turfs = list()
	var/static/list/new_outdoor_walls = list()

	var/static/list/planets = list()
	var/static/list/z_to_planet = list()

	var/static/list/currentrun = list()

	var/static/list/needs_sun_update = list()
	var/static/list/needs_temp_update = list()

/datum/controller/subsystem/planets/Initialize(timeofday)
	report_progress("Initializing planetary weather.")
	allocateTurfs(TRUE)
	fire() // Fire once to preemptively set up weather and planetary ambient lighting.
	return SS_INIT_SUCCESS

/datum/controller/subsystem/planets/on_max_z_changed(old_z_count, new_z_count)
	. = ..()
	z_to_planet.len = new_z_count

/datum/controller/subsystem/planets/proc/legacy_planet_assert(z_index, planet_path)
	var/datum/planet/existing = locate(planet_path) in planets
	if(isnull(existing))
		existing = new planet_path
		planets += existing
	z_to_planet[z_index] = existing
	LAZYDISTINCTADD(existing.expected_z_levels, z_index)

/datum/controller/subsystem/planets/proc/addTurf(turf/T)
	if(T.turf_flags & (TURF_PLANET_QUEUED | TURF_PLANET_REGISTERED))
		return
	T.turf_flags |= TURF_PLANET_QUEUED
	new_outdoor_turfs += T

/datum/controller/subsystem/planets/proc/addWall(turf/T)
	if(T.turf_flags & (TURF_PLANET_QUEUED | TURF_PLANET_REGISTERED))
		return
	T.turf_flags |= TURF_PLANET_QUEUED
	new_outdoor_walls += T

/datum/controller/subsystem/planets/proc/removeTurf(turf/T)
	new_outdoor_turfs -= T
	T.turf_flags &= ~(TURF_PLANET_QUEUED | TURF_PLANET_REGISTERED)
	if(z_to_planet.len >= T.z)
		var/datum/planet/P = z_to_planet[T.z]
		if(!P)
			return
		P.planet_floors -= T
		T.vis_contents -= P.weather_holder.visuals
		T.vis_contents -= P.weather_holder.special_visuals

/datum/controller/subsystem/planets/proc/removeWall(turf/T)
	new_outdoor_walls -= T
	T.turf_flags &= ~(TURF_PLANET_QUEUED | TURF_PLANET_REGISTERED)
	if(z_to_planet.len >= T.z)
		var/datum/planet/P = z_to_planet[T.z]
		if(!P)
			return
		P.planet_walls -= T
		T.vis_contents -= P.weather_holder.visuals
		T.vis_contents -= P.weather_holder.special_visuals

/datum/controller/subsystem/planets/proc/allocateTurfs(initial)
	// if initial we're going to do optimizations
	var/planet_z_count = z_to_planet.len
	if(initial)
		// make sure no duplicates are there
		for(var/turf/simulated/S in new_outdoor_turfs)
			S.turf_flags &= ~TURF_PLANET_QUEUED
			S.turf_flags |= TURF_PLANET_REGISTERED
			if(planet_z_count < S.z)
				continue
			var/datum/planet/P = z_to_planet[S.z]
			if(!P)
				continue
			P.planet_floors += S
			S.vis_contents |= P.weather_holder.visuals
			S.vis_contents |= P.weather_holder.special_visuals
			CHECK_TICK
		for(var/turf/unsimulated/wall/planetary/S in new_outdoor_walls)
			S.turf_flags &= ~TURF_PLANET_QUEUED
			S.turf_flags |= TURF_PLANET_REGISTERED
			if(planet_z_count < S.z)
				continue
			var/datum/planet/P = z_to_planet[S.z]
			if(!P)
				continue
			P.planet_walls += S
			CHECK_TICK
		new_outdoor_turfs = list()
		new_outdoor_walls = list()
		return
	var/list/curr = new_outdoor_turfs
	while(curr.len)
		var/turf/simulated/S = curr[curr.len]
		S.turf_flags &= ~TURF_PLANET_QUEUED
		S.turf_flags |= TURF_PLANET_REGISTERED
		curr.len--
		if(!istype(S))
			continue
		if(planet_z_count < S.z)
			continue
		var/datum/planet/P = z_to_planet[S.z]
		if(!P)
			continue
		P.planet_floors += S
		S.vis_contents |= P.weather_holder.visuals
		S.vis_contents |= P.weather_holder.special_visuals
		if(MC_TICK_CHECK)
			return
	curr = new_outdoor_walls
	while(curr.len)
		var/turf/unsimulated/wall/planetary/S = curr[curr.len]
		S.turf_flags &= ~TURF_PLANET_QUEUED
		S.turf_flags |= TURF_PLANET_REGISTERED
		curr.len--
		if(!istype(S))
			continue
		if(planet_z_count < S.z)
			continue
		var/datum/planet/P = z_to_planet[S.z]
		if(!P)
			continue
		P.planet_walls += S
		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/planets/fire(resumed = FALSE)
	if(new_outdoor_turfs.len || new_outdoor_walls.len)
		allocateTurfs()

	if(!resumed)
		src.currentrun = planets.Copy()

	var/list/needs_sun_update = src.needs_sun_update
	while(needs_sun_update.len)
		var/datum/planet/P = needs_sun_update[needs_sun_update.len]
		needs_sun_update.len--
		P.update_sunlight()

		if(MC_TICK_CHECK)
			return

	var/list/needs_temp_update = src.needs_temp_update
	while(needs_temp_update.len)
		var/datum/planet/P = needs_temp_update[needs_temp_update.len]
		needs_temp_update.len--
		updateTemp(P)
		if(MC_TICK_CHECK)
			return

	var/list/currentrun = src.currentrun
	var/dt = nominal_dt_s
	while(currentrun.len)
		var/datum/planet/P = currentrun[currentrun.len]
		currentrun.len--

		P.process(dt, last_fire)

		//Sun light needs changing
		if(P.needs_work & PLANET_PROCESS_SUN)
			P.needs_work &= ~PLANET_PROCESS_SUN
			needs_sun_update |= P

		//Temperature needs updating
		if(P.needs_work & PLANET_PROCESS_TEMP)
			P.needs_work &= ~PLANET_PROCESS_TEMP
			needs_temp_update |= P

		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/planets/proc/updateTemp(datum/planet/P)
	//Set new temperatures
	for(var/turf/T in P.planet_walls)
		T.sector_set_temperature(P.weather_holder.temperature)
		CHECK_TICK
