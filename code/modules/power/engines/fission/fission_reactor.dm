/**
 * The venerable nuclear reactor.
 * 3x3 tiles, rimatoimcs esque sprite
 * maybe cool ui for putting rods in and out?
 *
 * cold pipe in and hot pipe out for gas
 *
 * try to use fuel assemblys from RUST to reduce snowflake fuel spam
 *
 * INTEGRITY variable from /atom/ damage maybe?
 */
/obj/machinery/fission_reactor
	name = "fission reactor"
	desc = "A heavy reinforced structure for making power from fissile radioactive materials."
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "engine"
	density = TRUE
	anchored = TRUE
	rad_flags = RAD_NO_CONTAMINATE | RAD_BLOCK_CONTENTS
	//Energy trajectory of the reactors current fuel assembly configuration. (Are we getting hotter or colder)
	var/criticality = 0
	//List of our fuel assemblies in order.
	var/list/fuel_storage = list()

/obj/machinery/fission_reactor/update_criticality()
	//Painstakingly look at each rod, check every cardinal rod and determine neutron flow, update each rods criticality, then finally update the reactors overall criticality.
	for(var/rod in fuel_storage)
		!todo()

/**
 * Returns a list of all valid rod indexes in [direction] of [source_index].
 * ASSUMES reactor is a 5x5 grid pattern with all corners invalid.
 */
/obj/machinery/fission_reactor/get_cardinal_rods(var/source_index, var/direction)
	var/list/neighbors = list()
	var/x_coord = ceil(source_index / 5)
	var/y_coord = source_index % 5

	//Depending on direction and coordinates, return a list of indices in that row or column.
	if (direction == EAST)
		//We are on a short row that is only 3 long.
		if (y == 1) || (y == 5)
			for(var/i in x_coord to 3)
				neighbors.add((5*(y_coord-1)) + x_coord)
		else //We are on a normal row that is 5 long.
			for(var/i in x_coord to 5)
				neighbors.add((5*(y_coord-1)) + x_coord)

	else if (direction == WEST)
		if (y == 1) || (y == 5)
			for(var/i in x_coord to 3 step -1)
				neighbors.add((5*(y_coord-1)) + x_coord)
		else
			for(var/i in x_coord to 5 step -1)
				neighbors.add((5*(y_coord-1)) + x_coord)

	else if (direction == SOUTH)
		//We are on a short column that is only 3 tall.
		if (x == 1) || (x == 5)
			for(var/i in y_coord to 3)
				neighbors.add((5*(y_coord-1)) + x_coord)
		else //We are on a normal column that is 5 tall.
			for(var/i in y_coord to 5)
				neighbors.add((5*(y_coord-1)) + x_coord)

	else if (direction == NORTH)
		if (x == 1) || (x == 5)
			for(var/i in y_coord to 3 step -1)
				neighbors.add((5*(y_coord-1)) + x_coord)
		else
			for(var/i in y_coord to 5 step -1)
				neighbors.add((5*(y_coord-1)) + x_coord)

	return neighbors

/**
 * Easy way to virtually store the state of every rod in a fission reactor.
 */
/datum/fission_reactor_state
	var/list/rod_criticality = list()
