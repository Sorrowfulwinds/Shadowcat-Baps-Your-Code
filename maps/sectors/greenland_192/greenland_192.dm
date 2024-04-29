/datum/map/sector/greenland_192
	id = "greenland_192"
	name = "Sector - Greenland"
	width = 192
	height = 192
	levels = list(
		/datum/map_level/sector/greenland_192/beach,
		/datum/map_level/sector/greenland_192/mountain,
		/datum/map_level/sector/greenland_192/valley
	)

/datum/map_level/sector/greenland_192
	base_turf = /turf/simulated/floor/outdoors/grass
	traits = list(
		ZTRAIT_GRAVITY,
	)
	planet_path = /datum/planet/greenland
	air_outdoors = /datum/atmosphere/planet/classm

/** Initial landing level */
/datum/map_level/sector/greenland_192/beach
	id = "GreenlandBeach192"
	name = "Sector - Greenland: Beach"
	display_name = "Greenland - Beach"
	absolute_path = "maps/sectors/greenland_192/levels/greenland_192_beach.dmm"
	link_east = /datum/map_level/sector/greenland_192/mountain

/** Middle valley level */
/datum/map_level/sector/greenland_192/valley
	id = "GreenlandValley192"
	name = "Sector - Greenland: Valley"
	display_name = "Greenland - Valley"
	absolute_path = "maps/sectors/greenland_192/levels/greenland_192_valley.dmm"
	link_east = /datum/map_level/sector/greenland_192/mountain
	link_west = /datum/map_level/sector/greenland_192/beach
/*
/datum/map_level/sector/greenland_192/valley/on_loaded_immediate(z_index, list/datum/callback/additional_generation)
	. = ..()
	additional_generation?.Add(
		CALLBACK(
			GLOBAL_PROC,
			GLOBAL_PROC_REF(seed_submaps),
			list(z_index),
			225,
			//TODO: make this things
			/area/tether_away/beach/desert/unexplored,
			/datum/map_template/submap/level_specific/class_h,
		)
	)
*/
/** Caves under the mountain level */
/datum/map_level/sector/greenland_192/mountain
	id = "GreenlandMountain192"
	name = "Sector - Greenland: Mountain"
	display_name = "Greenland - Mountain"
	absolute_path = "maps/sectors/greenland_192/levels/greenland_192_mountain.dmm"
	base_turf = /turf/simulated/floor/outdoors/rocks/caves
	link_west = /datum/map_level/sector/greenland_192/mountain
/*
/datum/map_level/sector/greenland_192/mountain/on_loaded_immediate(z_index, list/datum/callback/additional_generation)
	. = ..()
	additional_generation?.Add(
		CALLBACK(
			GLOBAL_PROC,
			GLOBAL_PROC_REF(seed_submaps),
			list(z_index),
			225,
			//TODO: Make this things
			/area/tether_away/cave/unexplored/normal,
			/datum/map_template/submap/level_specific/mountains/normal,
		)
	)
	// todo: yield invoke generation
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, z_index, world.maxx - 4, world.maxy - 4)
*/
