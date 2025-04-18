var/global/list/all_objectives = list()

/datum/objective
	/// Who owns the objective.
	var/datum/mind/owner = null
	/// What that person is supposed to do.
	var/explanation_text = "Nothing"
	/// If they are focused on a particular person.
	var/datum/mind/target = null
	/// If they are focused on a particular number. Steal objectives have their own counter.
	var/target_amount = 0
	/// Currently only used for custom objectives.
	var/completed = 0

/datum/objective/New(text)
	all_objectives |= src
	if(text)
		explanation_text = text
	..()

/datum/objective/Destroy()
	all_objectives -= src
	..()

/datum/objective/proc/check_completion()
	return completed

/datum/objective/proc/find_target()
	var/list/possible_targets = list()
	for(var/datum/mind/possible_target in SSticker.minds)
		if(possible_target != owner && ishuman(possible_target.current) && (possible_target.current.stat != 2))
			possible_targets += possible_target
	if(possible_targets.len > 0)
		target = pick(possible_targets)


/// Option sets either to check assigned role or special role. Default to assigned.
/datum/objective/proc/find_target_by_role(role, role_type = 0)
	for(var/datum/mind/possible_target in SSticker.minds)
		if((possible_target != owner) && ishuman(possible_target.current) && ((role_type ? possible_target.special_role : possible_target.assigned_role) == role) )
			target = possible_target
			break


/datum/objective/assassinate/find_target()
	..()
	if(target && target.current)
		explanation_text = "Assassinate [target.current.real_name], the [target.assigned_role]."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/assassinate/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Assassinate [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/assassinate/check_completion()
	if(target && target.current)
		// Borgs/brains/AIs count as dead for traitor objectives. --NeoFite
		if(target.current.stat == DEAD || issilicon(target.current) || isbrain(target.current) || target.current.z > 6 || !target.current.ckey)
			return TRUE
		return FALSE
	return TRUE


/datum/objective/anti_revolution/execute/find_target()
	..()
	if(target && target.current)
		var/datum/gender/T = GLOB.gender_datums[target.current.get_visible_gender()]
		explanation_text = "[target.current.real_name], the [target.assigned_role] has extracted confidential information above their clearance. Execute [T.him]."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/anti_revolution/execute/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		var/datum/gender/T = GLOB.gender_datums[target.current.get_visible_gender()]
		explanation_text = "[target.current.real_name], the [!role_type ? target.assigned_role : target.special_role] has extracted confidential information above their clearance. Execute [T.him]."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/anti_revolution/execute/check_completion()
	if(target && target.current)
		if(target.current.stat == DEAD || !ishuman(target.current))
			return TRUE
		return FALSE
	return TRUE

/datum/objective/anti_revolution/brig
	var/already_completed = FALSE

/datum/objective/anti_revolution/brig/find_target()
	..()
	if(target && target.current)
		explanation_text = "Brig [target.current.real_name], the [target.assigned_role] for 20 minutes to set an example."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/anti_revolution/brig/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Brig [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role] for 20 minutes to set an example."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/anti_revolution/brig/check_completion()
	if(already_completed)
		return TRUE

	if(target && target.current)
		if(target.current.stat == DEAD)
			return FALSE
		if(target.is_brigged(10 * 60 * 10))
			already_completed = TRUE
			return TRUE
		return FALSE
	return FALSE


/datum/objective/anti_revolution/demote/find_target()
	..()
	if(target && target.current)
		var/datum/gender/T = GLOB.gender_datums[target.current.get_visible_gender()]
		explanation_text = "[target.current.real_name], the [target.assigned_role]  has been classified as harmful to [(LEGACY_MAP_DATUM).company_name]'s goals. Demote [T.him] to assistant."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/anti_revolution/demote/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		var/datum/gender/T = GLOB.gender_datums[target.current.get_visible_gender()]
		explanation_text = "[target.current.real_name], the [!role_type ? target.assigned_role : target.special_role] has been classified as harmful to [(LEGACY_MAP_DATUM).company_name]'s goals. Demote [T.him] to assistant."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/anti_revolution/demote/check_completion()
	if(target && target.current && istype(target,/mob/living/carbon/human))
		var/obj/item/card/id/I = target.current:wear_id
		if(istype(I, /obj/item/pda))
			var/obj/item/pda/P = I
			I = P.id

		if(!istype(I))
			return TRUE

		if(I.assignment == USELESS_JOB)
			return TRUE
		else
			return FALSE
	return TRUE


//I want braaaainssss
/datum/objective/debrain/find_target()
	..()
	if(target && target.current)
		explanation_text = "Steal the brain of [target.current.real_name]."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/debrain/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Steal the brain of [target.current.real_name] the [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/debrain/check_completion()
	if(!target) // If it's a free objective.
		return TRUE
	if( !owner.current || owner.current.stat==DEAD ) // If you're otherwise dead.
		return FALSE
	if( !target.current || !isbrain(target.current) )
		return FALSE
	var/atom/A = target.current
	while(A.loc) // Check to see if the brainmob is on our person.
		A = A.loc
		if(A == owner.current)
			return TRUE
	return FALSE


//The opposite of killing a dude.
/datum/objective/protect/find_target()
	..()
	if(target && target.current)
		explanation_text = "Protect [target.current.real_name], the [target.assigned_role]."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/protect/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Protect [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/protect/check_completion()
	if(!target) //If it's a free objective.
		return TRUE
	if(target.current)
		if(target.current.stat == DEAD || issilicon(target.current) || isbrain(target.current))
			return FALSE
		return TRUE
	return FALSE


/datum/objective/hijack
	explanation_text = "Hijack the emergency shuttle by escaping alone."

/datum/objective/hijack/check_completion()
	if(!owner.current || owner.current.stat)
		return FALSE
	if(!SSemergencyshuttle.returned())
		return FALSE
	if(issilicon(owner.current))
		return FALSE
	var/area/shuttle = locate(/area/shuttle/escape/centcom)
	var/list/protected_mobs = list(/mob/living/silicon/ai, /mob/living/silicon/pai)
	for(var/mob/living/player in GLOB.player_list)
		if(player.type in protected_mobs)
			continue
		if (player.mind && (player.mind != owner))
			if(player.stat != DEAD) // They're not dead!
				if(get_turf(player) in shuttle)
					return FALSE
	return TRUE


/datum/objective/block
	explanation_text = "Do not allow any organic lifeforms to escape on the shuttle alive."

/datum/objective/block/check_completion()
	if(!istype(owner.current, /mob/living/silicon))
		return FALSE
	if(!SSemergencyshuttle.returned())
		return FALSE
	if(!owner.current)
		return FALSE
	var/area/shuttle = locate(/area/shuttle/escape/centcom)
	var/protected_mobs[] = list(/mob/living/silicon/ai, /mob/living/silicon/pai, /mob/living/silicon/robot)
	for(var/mob/living/player in GLOB.player_list)
		if(player.type in protected_mobs)	continue
		if (player.mind)
			if (player.stat != 2)
				if (get_turf(player) in shuttle)
					return FALSE
	return TRUE

/datum/objective/silence
	explanation_text = "Do not allow anyone to escape the station.  Only allow the shuttle to be called when everyone is dead and your story is the only one left."

/datum/objective/silence/check_completion()
	if(!SSemergencyshuttle.returned())
		return FALSE

	for(var/mob/living/player in GLOB.player_list)
		if(player == owner.current)
			continue
		if(player.mind)
			if(player.stat != DEAD)
				var/turf/T = get_turf(player)
				if(!T)	continue
				switch(T.loc.type)
					if(/area/shuttle/escape/centcom, /area/shuttle/escape_pod1/centcom, /area/shuttle/escape_pod2/centcom, /area/shuttle/escape_pod3/centcom, /area/shuttle/escape_pod5/centcom)
						return FALSE
	return TRUE


/datum/objective/escape
	explanation_text = "Escape on the shuttle or an escape pod alive and free."


/datum/objective/escape/check_completion()
	if(issilicon(owner.current))
		return FALSE
	if(isbrain(owner.current))
		return FALSE
	if(!SSemergencyshuttle.returned())
		return FALSE
	if(!owner.current || owner.current.stat ==2)
		return FALSE
	var/turf/location = get_turf(owner.current.loc)
	if(!location)
		return FALSE

	if(istype(location, /turf/simulated/shuttle/floor4)) // Fails traitors if they are in the shuttle brig -- Polymorph
		if(istype(owner.current, /mob/living/carbon))
			var/mob/living/carbon/C = owner.current
			if (!C.handcuffed)
				return TRUE
		return FALSE

	var/area/check_area = location.loc
	if(istype(check_area, /area/shuttle/escape/centcom))
		return TRUE
	if(istype(check_area, /area/shuttle/escape_pod1/centcom))
		return TRUE
	if(istype(check_area, /area/shuttle/escape_pod2/centcom))
		return TRUE
	if(istype(check_area, /area/shuttle/escape_pod3/centcom))
		return TRUE
	if(istype(check_area, /area/shuttle/escape_pod5/centcom))
		return TRUE
	else
		return FALSE



/datum/objective/survive
	explanation_text = "Stay alive until the end."

/datum/objective/survive/check_completion()
	if(!owner.current || owner.current.stat == DEAD || isbrain(owner.current))
		return FALSE		//Brains no longer win survive objectives. --NEO
	if(issilicon(owner.current) && owner.current != owner.original)
		return FALSE
	return TRUE

/// Similar to the anti-rev objective, but for traitors
/datum/objective/brig
	var/already_completed = 0

/datum/objective/brig/find_target()
	..()
	if(target && target.current)
		explanation_text = "Have [target.current.real_name], the [target.assigned_role] brigged for 10 minutes."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/brig/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Have [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role] brigged for 10 minutes."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/brig/check_completion()
	if(already_completed)
		return TRUE

	if(target && target.current)
		if(target.current.stat == DEAD)
			return FALSE
		// Make the actual required time a bit shorter than the official time
		if(target.is_brigged(10 * 60 * 5))
			already_completed = 1
			return TRUE
		return FALSE
	return FALSE

/// Harm a crew member, making an example of them.
/datum/objective/harm
	var/already_completed = FALSE

/datum/objective/harm/find_target()
	..()
	if(target && target.current)
		explanation_text = "Make an example of [target.current.real_name], the [target.assigned_role]. Break one of their bones, detach one of their limbs or disfigure their face. Make sure they're alive when you do it."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/harm/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Make an example of [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role]. Break one of their bones, detach one of their limbs or disfigure their face. Make sure they're alive when you do it."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/harm/check_completion()
	if(already_completed)
		return TRUE

	if(target && target.current && istype(target.current, /mob/living/carbon/human))
		if(target.current.stat == DEAD)
			return FALSE

		var/mob/living/carbon/human/H = target.current
		for(var/obj/item/organ/external/E in H.organs)
			if(E.status & ORGAN_BROKEN)
				return TRUE
		for(var/limb_tag in H.species.has_limbs) //todo check prefs for robotic limbs and amputations.
			var/list/organ_data = H.species.has_limbs[limb_tag]
			var/limb_type = organ_data["path"]
			var/found
			for(var/obj/item/organ/external/E in H.organs)
				if(limb_type == E.type)
					found = 1
					break
			if(!found)
				return TRUE

		var/obj/item/organ/external/head/head = H.get_organ(BP_HEAD)
		if(head.disfigured)
			return TRUE
	return FALSE


/datum/objective/nuclear
	explanation_text = "Destroy the station with a nuclear device."



/datum/objective/steal
	var/obj/item/steal_target
	var/target_name

	var/global/possible_items[] = list(
		"the Facility Director's antique laser gun" = /obj/item/gun/projectile/energy/captain,
		"a hand teleporter" = /obj/item/hand_tele,
		"an RCD" = /obj/item/rcd,
		"a jetpack" = /obj/item/tank/jetpack,
		"a Facility Director's jumpsuit" = /obj/item/clothing/under/rank/captain,
		"a functional AI" = /obj/item/aicard,
		"a pair of magboots" = /obj/item/clothing/shoes/magboots,
		"the station blueprints" = /obj/item/blueprints,
		"a nasa voidsuit" = /obj/item/clothing/suit/space/void,
		"28 moles of phoron (full tank)" = /obj/item/tank,
		"a sample of slime extract" = /obj/item/slime_extract,
		"a piece of corgi meat" = /obj/item/reagent_containers/food/snacks/meat/corgi,
		"a research director's jumpsuit" = /obj/item/clothing/under/rank/research_director,
		"a chief engineer's jumpsuit" = /obj/item/clothing/under/rank/chief_engineer,
		"a chief medical officer's jumpsuit" = /obj/item/clothing/under/rank/chief_medical_officer,
		"a head of security's jumpsuit" = /obj/item/clothing/under/rank/head_of_security,
		"a head of personnel's jumpsuit" = /obj/item/clothing/under/rank/head_of_personnel,
		"the hypospray" = /obj/item/reagent_containers/hypospray/vial,
		"the Facility Director's pinpointer" = /obj/item/pinpointer,
		"an ablative armor vest" = /obj/item/clothing/suit/armor/laserproof,
	)

	var/global/possible_items_special[] = list(
		/*"nuclear authentication disk" = /obj/item/disk/nuclear,*///Broken with the change to nuke disk making it respawn on z level change.
		"nuclear gun" = /obj/item/gun/projectile/energy/gun/nuclear,
		"diamond drill" = /obj/item/pickaxe/diamonddrill,
		"bag of holding" = /obj/item/storage/backpack/holding,
		"hyper-capacity cell" = /obj/item/cell/hyper,
		"10 diamonds" = /obj/item/stack/material/diamond,
		"50 gold bars" = /obj/item/stack/material/gold,
		"25 refined uranium bars" = /obj/item/stack/material/uranium,
	)


/datum/objective/steal/proc/set_target(item_name)
	target_name = item_name
	steal_target = possible_items[target_name]
	if (!steal_target )
		steal_target = possible_items_special[target_name]
	explanation_text = "Steal [target_name]."
	return steal_target


/datum/objective/steal/find_target()
	return set_target(pick(possible_items))


/datum/objective/steal/proc/select_target()
	var/list/possible_items_all = possible_items+possible_items_special+"custom"
	var/new_target = input("Select target:", "Objective target", steal_target) as null|anything in possible_items_all
	if (!new_target) return
	if (new_target == "custom")
		var/obj/item/custom_target = input("Select type:","Type") as null|anything in typesof(/obj/item)
		if (!custom_target) return
		var/tmp_obj = new custom_target
		var/custom_name = tmp_obj:name
		qdel(tmp_obj)
		custom_name = sanitize(input("Enter target name:", "Objective target", custom_name) as text|null)
		if (!custom_name) return
		target_name = custom_name
		steal_target = custom_target
		explanation_text = "Steal [target_name]."
	else
		set_target(new_target)
	return steal_target

/datum/objective/steal/check_completion()
	if(!steal_target || !owner.current)
		return FALSE
	if(!isliving(owner.current))
		return FALSE
	var/list/all_items = owner.current.get_contents()
	switch (target_name)
		if("28 moles of phoron (full tank)","10 diamonds","50 gold bars","25 refined uranium bars")
			var/target_amount = text2num(target_name)//Non-numbers are ignored.
			var/found_amount = 0.0//Always starts as zero.

			for(var/obj/item/I in all_items) //Check for phoron tanks
				if(istype(I, steal_target))
					found_amount += (target_name=="28 moles of phoron (full tank)" ? (I:air_contents:gas[GAS_ID_PHORON]) : (I:amount))
			return found_amount>=target_amount

		if("50 coins (in bag)")
			var/obj/item/moneybag/B = locate() in all_items

			if(B)
				var/target = text2num(target_name)
				var/found_amount = 0.0
				for(var/obj/item/coin/C in B)
					found_amount++
				return found_amount>=target

		if("a functional AI")

			for(var/obj/item/aicard/C in all_items) //Check for ai card
				for(var/mob/living/silicon/ai/M in C)
					if(istype(M, /mob/living/silicon/ai) && M.stat != 2) //See if any AI's are alive inside that card.
						return TRUE

			for(var/mob/living/silicon/ai/ai in GLOB.mob_list)
				var/turf/T = get_turf(ai)
				if(istype(T))
					var/area/check_area = get_area(ai)
					if(istype(check_area, /area/shuttle/escape/centcom))
						return TRUE
					if(istype(check_area, /area/shuttle/escape_pod1/centcom))
						return TRUE
					if(istype(check_area, /area/shuttle/escape_pod2/centcom))
						return TRUE
					if(istype(check_area, /area/shuttle/escape_pod3/centcom))
						return TRUE
					if(istype(check_area, /area/shuttle/escape_pod5/centcom))
						return TRUE
		else

			for(var/obj/I in all_items) //Check for items
				if(istype(I, steal_target))
					return TRUE
	return FALSE



/datum/objective/download/proc/gen_amount_goal()
	target_amount = rand(10,20)
	explanation_text = "Download [target_amount] research levels."
	return target_amount


/datum/objective/download/check_completion()
	if(!ishuman(owner.current))
		return FALSE
	if(!owner.current || owner.current.stat == 2)
		return FALSE

	var/current_amount
	var/obj/item/hardsuit/S
	if(istype(owner.current,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = owner.current
		S = H.back

	if(!istype(S) || !S.installed_modules || !S.installed_modules.len)
		return FALSE

	var/obj/item/hardsuit_module/datajack/stolen_data = locate() in S.installed_modules
	if(!istype(stolen_data))
		return FALSE

	for(var/datum/tech/current_data in stolen_data.stored_research)
		if(current_data.level > 1)
			current_amount += (current_data.level-1)

	return (current_amount<target_amount) ? 0 : 1



/datum/objective/capture/proc/gen_amount_goal()
	target_amount = rand(5,10)
	explanation_text = "Accumulate [target_amount] capture points."
	return target_amount


/datum/objective/capture/check_completion()//Basically runs through all the mobs in the area to determine how much they are worth.
	CRASH("This function wants to use a rarety value for the mobs, which was removed.")

/datum/objective/absorb/proc/gen_amount_goal(lowbound = 4, highbound = 6)
	target_amount = rand (lowbound,highbound)
	if (SSticker)
		var/n_p = 1 //autowin
		if (SSticker.current_state == GAME_STATE_SETTING_UP)
			for(var/mob/new_player/P in GLOB.player_list)
				if(P.client && P.ready && P.mind!=owner)
					n_p ++
		else if (SSticker.current_state == GAME_STATE_PLAYING)
			for(var/mob/living/carbon/human/P in GLOB.player_list)
				if(P.client && !(P.mind.changeling) && P.mind!=owner)
					n_p ++
		target_amount = min(target_amount, n_p)

	explanation_text = "Absorb [target_amount] compatible genomes."
	return target_amount

/datum/objective/absorb/check_completion()
	if(owner && owner.changeling && owner.changeling.absorbed_dna && (owner.changeling.absorbedcount >= target_amount))
		return TRUE
	else
		return FALSE


/// Heist objectives.
/datum/objective/heist/proc/choose_target()
	return


/datum/objective/heist/kidnap/choose_target()
	var/list/roles = list("Chief Engineer","Research Director","Roboticist","Chemist","Station Engineer")
	var/list/possible_targets = list()
	var/list/priority_targets = list()

	for(var/datum/mind/possible_target in SSticker.minds)
		if(possible_target != owner && ishuman(possible_target.current) && (possible_target.current.stat != 2) && (!possible_target.special_role))
			possible_targets += possible_target
			for(var/role in roles)
				if(possible_target.assigned_role == role)
					priority_targets += possible_target
					continue

	if(priority_targets.len > 0)
		target = pick(priority_targets)
	else if(possible_targets.len > 0)
		target = pick(possible_targets)

	if(target && target.current)
		explanation_text = "We can get a good price for [target.current.real_name], the [target.assigned_role]. Take them alive."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/heist/kidnap/check_completion()
	if(target && target.current)
		if (target.current.stat == 2)
			return FALSE // They're dead. Fail.
		//if (!target.current.restrained())
		//	return FALSE // They're loose. Close but no cigar.

		var/area/skipjack_station/start/A = locate()
		for(var/mob/living/carbon/human/M in A)
			if(target.current == M)
				return TRUE //They're restrained on the shuttle. Success.
	else
		return FALSE


/datum/objective/heist/loot/choose_target()
	var/loot = "an object"
	switch(rand(1,8))
		if(1)
			target = /obj/structure/particle_accelerator
			target_amount = 6
			loot = "a complete particle accelerator"
		if(2)
			target = /obj/machinery/the_singularitygen
			target_amount = 1
			loot = "a gravitational generator"
		if(3)
			target = /obj/machinery/power/emitter
			target_amount = 4
			loot = "four emitters"
		if(4)
			target = /obj/machinery/nuclearbomb
			target_amount = 1
			loot = "a nuclear bomb"
		if(5)
			target = /obj/item/gun
			target_amount = 6
			loot = "six guns"
		if(6)
			target = /obj/item/gun/projectile/energy
			target_amount = 4
			loot = "four energy guns"
		if(7)
			target = /obj/item/gun/projectile/energy/laser
			target_amount = 2
			loot = "two laser guns"
		if(8)
			target = /obj/item/gun/projectile/energy/ionrifle
			target_amount = 1
			loot = "an ion gun"

	explanation_text = "It's a buyer's market out here. Steal [loot] for resale."

/datum/objective/heist/loot/check_completion()

	var/total_amount = 0

	for(var/obj/O in locate(/area/skipjack_station/start))
		if(istype(O,target)) total_amount++
		for(var/obj/I in O.contents)
			if(istype(I,target)) total_amount++
		if(total_amount >= target_amount) return TRUE

	for(var/datum/mind/raider in raiders.current_antagonists)
		if(raider.current)
			for(var/obj/O in raider.current.get_contents())
				if(istype(O,target)) total_amount++
				if(total_amount >= target_amount) return TRUE

	return FALSE


/datum/objective/heist/salvage/choose_target()
	switch(rand(1,8))
		if(1)
			target = MAT_STEEL
			target_amount = 300
		if(2)
			target = "glass"
			target_amount = 200
		if(3)
			target = "plasteel"
			target_amount = 100
		if(4)
			target = "phoron"
			target_amount = 100
		if(5)
			target = "silver"
			target_amount = 50
		if(6)
			target = "gold"
			target_amount = 20
		if(7)
			target = "uranium"
			target_amount = 20
		if(8)
			target = "diamond"
			target_amount = 20

	explanation_text = "Ransack the station and escape with [target_amount] [target]."

/datum/objective/heist/salvage/check_completion()

	var/total_amount = 0

	for(var/obj/item/O in locate(/area/skipjack_station/start))

		var/obj/item/stack/material/S
		if(istype(O,/obj/item/stack/material))
			if(O.name == target)
				S = O
				total_amount += S.get_amount()
		for(var/obj/I in O.contents)
			if(istype(I,/obj/item/stack/material))
				if(I.name == target)
					S = I
					total_amount += S.get_amount()

	for(var/datum/mind/raider in raiders.current_antagonists)
		if(raider.current)
			for(var/obj/item/O in raider.current.get_contents())
				if(istype(O,/obj/item/stack/material))
					if(O.name == target)
						var/obj/item/stack/material/S = O
						total_amount += S.get_amount()

	if(total_amount >= target_amount)
		return TRUE
	return FALSE


/datum/objective/heist/preserve_crew
	explanation_text = "Do not leave anyone behind, alive or dead."

/datum/objective/heist/preserve_crew/check_completion()
	if(raiders && raiders.is_raider_crew_safe())
		return TRUE
	return FALSE

//Borer objective(s).
/datum/objective/borer_survive
	explanation_text = "Survive in a host until the end of the round."

/datum/objective/borer_survive/check_completion()
	if(owner)
		var/mob/living/simple_mob/animal/borer/B = owner
		if(istype(B) && B.stat < 2 && B.host && B.host.stat < 2) return TRUE
	return FALSE

/datum/objective/borer_reproduce
	explanation_text = "Reproduce at least once."

/datum/objective/borer_reproduce/check_completion()
	if(owner && owner.current)
		var/mob/living/simple_mob/animal/borer/B = owner.current
		if(istype(B) && B.has_reproduced) return TRUE
	return FALSE

/datum/objective/ninja_highlander
	explanation_text = "You aspire to be a Grand Master of the Spider Clan. Kill all of your fellow acolytes."

/datum/objective/ninja_highlander/check_completion()
	if(owner)
		for(var/datum/mind/ninja in get_antags("ninja"))
			if(ninja != owner)
				if(ninja.current.stat < 2) return FALSE
		return TRUE
	return FALSE

/datum/objective/cult/survive
	explanation_text = "Our knowledge must live on."
	target_amount = 5

/datum/objective/cult/survive/New()
	..()
	explanation_text = "Our knowledge must live on. Make sure at least [target_amount] acolytes escape on the shuttle to spread their work on an another station."

/datum/objective/cult/survive/check_completion()
	var/acolytes_survived = 0
	if(!cult)
		return FALSE
	for(var/datum/mind/cult_mind in cult.current_antagonists)
		if (cult_mind.current && cult_mind.current.stat!=2)
			var/area/A = get_area(cult_mind.current )
			if ( is_type_in_list(A, centcom_areas))
				acolytes_survived++
	if(acolytes_survived >= target_amount)
		return FALSE
	else
		return TRUE

/datum/objective/cult/eldergod
	explanation_text = "Summon Nar-Sie via the use of the appropriate rune (Hell join self). It will only work if nine cultists stand on and around it. The convert rune is join blood self."

/datum/objective/cult/eldergod/check_completion()
	return (locate(/obj/singularity/narsie/large) in GLOB.machines)

/datum/objective/cult/sacrifice
	explanation_text = "Conduct a ritual sacrifice for the glory of Nar-Sie."

/datum/objective/cult/sacrifice/find_target()
	var/list/possible_targets = list()
	if(!possible_targets.len)
		for(var/mob/living/carbon/human/player in GLOB.player_list)
			if(player.mind && !(player.mind in cult))
				possible_targets += player.mind
	if(possible_targets.len > 0)
		target = pick(possible_targets)
	if(target) explanation_text = "Sacrifice [target.name], the [target.assigned_role]. You will need the sacrifice rune (Hell blood join) and three acolytes to do so."

/datum/objective/cult/sacrifice/check_completion()
	return (target && cult && !cult.sacrificed.Find(target))

/datum/objective/rev/find_target()
	..()
	if(target && target.current)
		explanation_text = "Assassinate, capture or convert [target.current.real_name], the [target.assigned_role]."
	else
		explanation_text = "Free Objective"
	return target


/datum/objective/rev/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Assassinate, capture or convert [target.current.real_name], the [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Free Objective"
	return target

/datum/objective/rev/check_completion()
	var/rval = 1
	if(target && target.current)
		var/mob/living/carbon/human/H = target.current
		if(!istype(H))
			return TRUE
		if(H.stat == DEAD || H.restrained())
			return TRUE
		// Check if they're converted
		if(target in revs.current_antagonists)
			return TRUE
		var/turf/T = get_turf(H)
		if(T && isNotStationLevel(T.z)) // If they leave the station they count as dead for this.
			rval = 2
		return FALSE
	return rval
