/*///////////////Circuit Imprinter (By Darem)////////////////////////
	Used to print new circuit boards (for computers and similar systems) and AI modules. Each circuit board pattern are stored in
a /datum/desgin on the linked R&D console. You can then print them out in a fasion similar to a regular lathe. However, instead of
using metal and glass, it uses glass and reagents (usually sulphuric acid).
*/

/obj/machinery/r_n_d/circuit_imprinter
	name = "Circuit Imprinter"
	icon = 'icons/obj/machines/fabricators/imprinter.dmi'
	icon_state = "imprinter"
	base_icon_state = "imprinter"
	atom_flags = OPENCONTAINER
	circuit = /obj/item/circuitboard/circuit_imprinter
	var/list/datum/prototype/design/queue = list()
	var/progress = 0

	var/max_material_storage = 75000
	var/mat_efficiency = 1
	var/speed = 1

	stored_materials = list(
		MAT_STEEL = 0,
		MAT_GLASS = 0,
		MAT_PLASTEEL = 0,
		MAT_PLASTIC = 0,
		MAT_GOLD = 0,
		MAT_SILVER = 0,
		MAT_COPPER = 0,
		MAT_OSMIUM = 0,
		MAT_LEAD = 0,
		MAT_PHORON = 0,
		MAT_URANIUM = 0,
		MAT_DIAMOND = 0,
		MAT_DURASTEEL = 0,
		MAT_VERDANTIUM = 0,
		MAT_MORPHIUM = 0,
		MAT_METALHYDROGEN = 0,
		MAT_SUPERMATTER = 0
		)

	hidden_materials = list(
		MAT_PLASTEEL,
		MAT_DURASTEEL,
		MAT_VERDANTIUM,
		MAT_MORPHIUM,
		MAT_METALHYDROGEN,
		MAT_SUPERMATTER
		)

	use_power = USE_POWER_IDLE
	idle_power_usage = 30
	active_power_usage = 2500

/obj/machinery/r_n_d/circuit_imprinter/process(delta_time)
	..()
	if(machine_stat)
		update_appearance()
		return
	if(queue.len == 0)
		busy = 0
		update_appearance()
		return
	var/datum/prototype/design/D = queue[1]
	if(canBuild(D))
		busy = 1
		progress += speed
		if((progress * 20) >= D.work)
			build(D)
			progress = 0
			removeFromQueue(1)
		update_appearance()
	else
		if(busy)
			visible_message(SPAN_NOTICE("\icon [src] flashes: insufficient materials: [getLackingMaterials(D)]."))
			busy = 0
			update_appearance()

/obj/machinery/r_n_d/circuit_imprinter/RefreshParts()
	var/T = 0
	for(var/obj/item/reagent_containers/glass/G in component_parts)
		T += G.reagents.maximum_volume
	create_reagents(T)
	max_material_storage = 0
	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		max_material_storage += M.rating * 75000
	T = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		T += M.rating
	mat_efficiency = max(1 - (T - 1) / 4, 0.2)
	speed = T

/obj/machinery/r_n_d/circuit_imprinter/update_icon_state()
	. = ..()
	if(machine_stat & NOPOWER)
		icon_state = "[base_icon_state]-off"
	else if(busy)
		icon_state = "[base_icon_state]-ani"
	else
		icon_state = base_icon_state

/obj/machinery/r_n_d/circuit_imprinter/update_overlays()
	. = ..()
	cut_overlays()
	if(panel_open)
		add_overlay("[base_icon_state]-panel")

/obj/machinery/r_n_d/circuit_imprinter/proc/TotalMaterials()
	var/t = 0
	for(var/f in stored_materials)
		t += stored_materials[f]
	return t

/obj/machinery/r_n_d/circuit_imprinter/drop_products(method, atom/where)
	// todo: refactor
	var/list/component_parts = src.component_parts.Copy()
	. = ..()
	for(var/obj/I in component_parts)
		if(istype(I, /obj/item/reagent_containers/glass/beaker))
			reagents.trans_to_obj(I, reagents.total_volume)
	for(var/f in stored_materials)
		if(stored_materials[f] >= SHEET_MATERIAL_AMOUNT)
			var/path = getMaterialType(f)
			if(path)
				var/obj/item/stack/S = new path(loc)
				S.amount = round(stored_materials[f] / SHEET_MATERIAL_AMOUNT)

/obj/machinery/r_n_d/circuit_imprinter/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(busy)
		to_chat(user, SPAN_NOTICE("\The [src] is busy. Please wait for completion of previous operation."))
		return 1
	if(default_deconstruction_screwdriver(user, O))
		if(linked_console)
			linked_console.linked_imprinter = null
			linked_console = null
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return
	if(istype(O, /obj/item/gripper/no_use/loader))
		return 0		//Sheet loaders weren't finishing attack(), this prevents the message "You can't stuff that gripper into this" without preventing the rest of the attack sequence from finishing
	if(panel_open)
		to_chat(user, SPAN_NOTICE("You can't load \the [src] while it's opened."))
		return 1
	if(!linked_console)
		to_chat(user, "\The [src] must be linked to an R&D console first.")
		return 1
	if(O.is_open_container())
		return 0
	if(!istype(O, /obj/item/stack/material)) //Previously checked for specific material sheets, for some reason? Made the check on 133 redundant.
		to_chat(user, SPAN_NOTICE("You cannot insert this item into \the [src]."))
		return 1
	if(machine_stat)
		return 1

	if(TotalMaterials() + SHEET_MATERIAL_AMOUNT > max_material_storage)
		to_chat(user, SPAN_NOTICE("\The [src]'s material bin is full. Please remove material before adding more."))
		return 1

	var/obj/item/stack/material/S = O
	if(!(S.material.name in stored_materials))
		to_chat(user, SPAN_WARNING("The [src] doesn't accept [S.material]!"))
		return

	busy = 1
	var/sname = "[S.name]"
	var/amnt = S.perunit
	var/max_res_amount = max_material_storage
	for(var/mat in stored_materials)
		max_res_amount -= stored_materials[mat]

	if(stored_materials[S.material.name] + amnt <= max_res_amount)
		if(S && S.get_amount() >= 1)
			var/count = 0
			add_overlay("fab-load-metal")
			spawn(10)
				cut_overlay("fab-load-metal")
			while(stored_materials[S.material.name] + amnt <= max_res_amount && S.get_amount() >= 1)
				stored_materials[S.material.name] += amnt
				S.use(1)
				count++
			to_chat(user, "You insert [count] [sname] into the fabricator.")
	else
		to_chat(user, "The fabricator cannot hold more [sname].")
	busy = 0

	updateUsrDialog()
	return

/obj/machinery/r_n_d/circuit_imprinter/proc/addToQueue(var/datum/prototype/design/D)
	queue += D
	return

/obj/machinery/r_n_d/circuit_imprinter/proc/removeFromQueue(var/index)
	queue.Cut(index, index + 1)
	return

/obj/machinery/r_n_d/circuit_imprinter/proc/canBuild(var/datum/prototype/design/D)
	for(var/M in D.materials_base)
		if(stored_materials[M] < (D.materials_base[M] * mat_efficiency))
			return 0
	for(var/C in D.reagents)
		if(!reagents.has_reagent(C, D.reagents[C] * mat_efficiency))
			return 0
	return 1

/obj/machinery/r_n_d/circuit_imprinter/proc/getLackingMaterials(var/datum/prototype/design/D)
	var/ret = ""
	for(var/M in D.materials_base)
		if(stored_materials[M] < D.materials_base[M])
			if(ret != "")
				ret += ", "
			ret += "[D.materials_base[M] - stored_materials[M]] [M]"
	for(var/C in D.reagents)
		if(!reagents.has_reagent(C, D.reagents[C]))
			if(ret != "")
				ret += ", "
			ret += C
	return ret

/obj/machinery/r_n_d/circuit_imprinter/proc/build(var/datum/prototype/design/D)
	var/power = active_power_usage
	for(var/M in D.materials_base)
		power += round(D.materials_base[M] / 5)
	power = max(active_power_usage, power)
	use_power(power)
	for(var/M in D.materials_base)
		stored_materials[M] = max(0, stored_materials[M] - D.materials_base[M] * mat_efficiency)
	for(var/C in D.reagents)
		reagents.remove_reagent(C, D.reagents[C] * mat_efficiency)

	if(D.build_path)
		var/obj/new_item = D.legacy_print(drop_location(), src)
		if(mat_efficiency != 1) // No materials out of nowhere
			if(new_item.materials_base && new_item.materials_base.len > 0)
				for(var/i in new_item.materials_base)
					new_item.materials_base[i] = new_item.materials_base[i] * mat_efficiency
