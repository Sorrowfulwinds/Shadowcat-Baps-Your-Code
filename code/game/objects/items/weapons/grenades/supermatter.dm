/obj/item/grenade/supermatter
	name = "supermatter grenade"
	icon_state = "banana"
	item_state = "emergency_engi"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	arm_sound = 'sound/effects/3.wav'
	var/implode_at

/obj/item/grenade/supermatter/Destroy()
	if(implode_at)
		STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/grenade/supermatter/detonate()
	..()
	START_PROCESSING(SSobj, src)
	implode_at = world.time + 10 SECONDS
	update_icon()
	playsound(src, 'sound/weapons/wave.ogg', 100)

/obj/item/grenade/supermatter/update_icon()
	cut_overlays()
	. = ..()
	if(implode_at)
		add_overlay(image(icon = 'icons/rust.dmi', icon_state = "emfield_s1"))

/obj/item/grenade/supermatter/process(delta_time)
	if(!isturf(loc))
		forceMove(get_turf(src))
	playsound(src, 'sound/effects/supermatter.ogg', 100)
	supermatter_pull(src, world.view, STAGE_THREE)
	if(world.time > implode_at)
		explosion(loc, 1, 3, 5, 4)
		qdel(src)
