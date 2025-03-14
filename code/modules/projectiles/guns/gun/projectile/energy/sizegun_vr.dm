//
// Size Gun
//

/obj/item/gun/projectile/energy/sizegun
	name = "size gun" //I have no idea why this was called shrink ray when this increased and decreased size.
	desc = "A highly advanced ray gun with a knob on the side to adjust the size you desire. Warning: Do not insert into mouth."
	icon = 'icons/obj/gun/energy.dmi'
	icon_state = "sizegun-shrink100" // Someone can probably do better. -Ace
	item_state = null	//so the human update icon uses the icon_state instead
	fire_sound = 'sound/weapons/wave.ogg'
	charge_cost = 240
	projectile_type = /obj/projectile/beam/sizelaser
	origin_tech = list(TECH_BLUESPACE = 4)
	modifystate = "sizegun-grow"
	no_pin_required = 1
	legacy_battery_lock = 1
	var/size_set_to = 1
	firemodes = list(
		list(mode_name		= "select size",
			projectile_type	= /obj/projectile/beam/sizelaser,
			modifystate		= "sizegun-grow",
			fire_sound		= 'sound/weapons/pulse3.ogg'
		))
	item_action_name = "Select Size"

/obj/item/gun/projectile/energy/sizegun/Initialize(mapload)
	. = ..()
	add_obj_verb(src, /obj/item/gun/projectile/energy/sizegun/proc/select_size)

/obj/item/gun/projectile/energy/sizegun/ui_action_click(datum/action/action, datum/event_args/actor/actor)
	. = ..()
	select_size()

/obj/item/gun/projectile/energy/sizegun/consume_next_projectile(datum/gun_firing_cycle/cycle)
	. = ..()
	var/obj/projectile/beam/sizelaser/G = .
	if(istype(G))
		G.set_size = size_set_to

/obj/item/gun/projectile/energy/sizegun/proc/select_size()
	set name = "Select Size"
	set category = VERB_CATEGORY_OBJECT
	set src in view(1)

	var/size_select = input("Put the desired size (25-200%)", "Set Size", size_set_to*100) as num
	if(size_select>200 || size_select<25)
		to_chat(usr, "<span class='notice'>Invalid size.</span>")
		return
	size_set_to = (size_select/100)
	to_chat(usr, "<span class='notice'>You set the size to [size_select]%</span>")

/obj/item/gun/projectile/energy/sizegun/examine(mob/user, dist)
	. = ..()
	var/size_examine = (size_set_to*100)
	. += "<span class='info'>It is currently set at [size_examine]%</span>"

//
// Beams for size gun
//

/obj/projectile/beam/sizelaser
	name = "size beam"
	icon_state = "xray"
	nodamage = 1
	damage_force = 0
	damage_flag = ARMOR_LASER
	var/set_size = 1 //Let's default to 100%

	legacy_muzzle_type = /obj/effect/projectile/muzzle/xray
	legacy_tracer_type = /obj/effect/projectile/tracer/xray
	legacy_impact_type = /obj/effect/projectile/impact/xray

/obj/projectile/beam/sizelaser/on_impact(atom/target, impact_flags, def_zone, efficiency)
	. = ..()
	if(. & PROJECTILE_IMPACT_FLAGS_UNCONDITIONAL_ABORT)
		return

	var/mob/living/M = target
	if(!M.permit_sizegun)
		M.visible_message("<span class='warning'>[src] has no effect on [M].</span>")
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = M
		H.resize(set_size, TRUE)
		H.show_message("<font color=#4F49AF> The beam fires into your body, changing your size!</font>")
		H.updateicon()
	else if (istype(target, /mob/living/))
		var/mob/living/H = M
		H.resize(set_size, TRUE)
		H.updateicon()

/obj/projectile/beam/sizelaser/shrink
	set_size = 0.5 //50% of current size

/obj/projectile/beam/sizelaser/grow
	set_size = 2.0 //200% of current size

/obj/item/gun/projectile/energy/stripper//Because it can be fun
	name = "stripper gun"
	desc = "A gun designed to remove unnessary layers from people. For external use only!"
	icon = 'icons/obj/gun/energy.dmi'
	icon_state = "sizegun-shrink100" // Someone can probably do better. -Ace
	item_state = null	//so the human update icon uses the icon_state instead
	fire_sound = 'sound/weapons/wave.ogg'
	charge_cost = 240
	projectile_type = /obj/projectile/bullet/stripper
	origin_tech = list(TECH_BLUESPACE = 4)
	modifystate = "sizegun-shrink"
	no_pin_required = 1
	legacy_battery_lock = 1
	firemodes = list()
