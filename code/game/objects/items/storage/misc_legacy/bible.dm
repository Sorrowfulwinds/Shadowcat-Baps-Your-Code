/obj/item/storage/bible
	name = "bible"
	desc = "Apply to head repeatedly."
	icon_state ="bible"
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_NORMAL
	var/deity_name = "Christ"

/obj/item/storage/bible/booze
	name = "bible"
	desc = "To be applied to the head repeatedly."
	icon_state ="bible"
	starts_with = list(
		/obj/item/reagent_containers/food/drinks/bottle/small/beer,
		/obj/item/reagent_containers/food/drinks/bottle/small/beer,
		/obj/item/spacecash/c100,
		/obj/item/spacecash/c100,
		/obj/item/spacecash/c100
	)

/obj/item/storage/bible/afterattack(atom/target, mob/user, clickchain_flags, list/params)
	if(!(clickchain_flags & CLICKCHAIN_HAS_PROXIMITY)) return
	if(user.mind && (user.mind.assigned_role == "Chaplain"))
		if(target.reagents && target.reagents.has_reagent("water")) //blesses all the water in the holder
			to_chat(user, "<span class='notice'>You bless [target].</span>")
			var/water2holy = target.reagents.get_reagent_amount("water")
			target.reagents.del_reagent("water")
			target.reagents.add_reagent("holywater",water2holy)
