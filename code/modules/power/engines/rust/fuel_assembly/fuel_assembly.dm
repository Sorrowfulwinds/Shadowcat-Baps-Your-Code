// todo: material system
/obj/item/fuel_assembly
	name = "fuel rod assembly"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "fuel_assembly"

	var/material_name

	var/percent_depleted = 1
	var/list/rod_quantities = list()
	var/fuel_type = "composite"
	var/fuel_colour
	var/radioactivity
	var/const/initial_amount = 300

/obj/item/fuel_assembly/Initialize(mapload, _material, _colour, _radiation)
	. = ..()
	fuel_type = _material
	fuel_colour = _colour
	radioactivity = _radiation

/obj/item/fuel_assembly/Initialize(mapload)
	. = ..()
	var/datum/prototype/material/material = RSmaterials.fetch_local_or_throw(fuel_type)
	if(istype(material, /datum/prototype/material))
		name = "[material.use_name] fuel rod assembly"
		desc = "A fuel rod for a fusion reactor. This one is made from [material.use_name]."
		fuel_colour = material.icon_colour
		fuel_type = material.use_name
		material
	else
		name = "[fuel_type] fuel rod assembly"
		desc = "A fuel rod for a fusion reactor. This one is made from [fuel_type]."

	icon_state = "blank"
	var/image/I = image(icon, "fuel_assembly")
	I.color = fuel_colour
	add_overlay(list(I, image(icon, "fuel_assembly_bracket")))
	rod_quantities[fuel_type] = initial_amount

// Mapper shorthand.
/obj/item/fuel_assembly/deuterium/Initialize(mapload, material_key)
	return ..(mapload, "deuterium")

/obj/item/fuel_assembly/tritium/Initialize(mapload, material_key)
	return ..(mapload, "tritium")

/obj/item/fuel_assembly/phoron/Initialize(mapload, material_key)
	return ..(mapload, "phoron")

/obj/item/fuel_assembly/supermatter/Initialize(mapload, material_key)
	return ..(mapload, "supermatter")

/obj/item/fuel_assembly/uranium/Initialize(mapload, material_key)
	return ..(mapload, "uranium")
