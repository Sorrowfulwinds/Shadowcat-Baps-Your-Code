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
	desc = "A heavy reinforced structure for making power from radioactive materials."
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "engine"
	base_icon_state = "engine"
	density = 1
	anchored = 1
	rad_flags = RAD_NO_CONTAMINATE | RAD_BLOCK_CONTENTS


