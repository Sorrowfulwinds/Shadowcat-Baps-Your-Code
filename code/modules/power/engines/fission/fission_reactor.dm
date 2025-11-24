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
	name = "Einstien Engines fission reactor"
	desc = "A high pressure gas cooled reactor for station heating. This is the economy model."
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "engine"
	density = TRUE
	anchored = TRUE
	rad_flags = RAD_NO_CONTAMINATE | RAD_BLOCK_CONTENTS

	///Determines the internal size of the reactor. Radius of a circle of square cells on a grid, rounded to the nearest integer euclidean distance. 3 = 37, 4 = 69, etc.
	var/radius = 3

	///Our internal grid is centered on 0,0. We need to offset it by radius length to avoid negative indexes.
	var/vector/offset = vector(radius, radius)

	///Energy trajectory of the reactors current fuel assembly configuration. (Are we getting hotter or colder)
	var/criticality = 0

	///Dictionary of our fuel assemblies keyed by vector coordinates.
	var/alist/fuel_storage = alist()

/obj/machinery/fission_reactor/update_criticality()
	//Painstakingly look at each rod, check every cardinal rod and determine neutron flow, update each rods criticality, then finally update the reactors overall criticality.
	for(var/rod in fuel_storage)
		!todo()

/**
 * Returns a list of all valid rod indexes in [direction] of [source_index].
 * ASSUMES reactor is a 5x5 grid pattern with all corners invalid.
 */
/obj/machinery/fission_reactor/get_cardinal_rods(var/source_index, var/direction)


/**
 * Easy way to virtually store the state of every rod in a fission reactor.
 */
/datum/fission_reactor_state
	var/list/rod_criticality = list()
