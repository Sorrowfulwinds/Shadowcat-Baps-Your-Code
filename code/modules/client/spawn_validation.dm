/**
 * Legacy spawn checks from virgo import. Confirms Traits costs, custom species name, and if client left the round as their current selected char.
 * Moved to client from new_mob as it only checks preferences data.
 * All of these should be properly migrated into preference datums at some point. See /preferences/proc/spawn_checks().
 *
 * @returns
 * FALSE - Check failed and a reason message has been sent to the client.
 * TRUE - Checks passed.
 */
/client/proc/legacy_spawn_checks_vr()
	. = TRUE

	//Are they on the VERBOTEN LIST?
	if (prevent_respawns.Find(prefs.real_name))
		to_chat(src,SPAN_WARNING("You've already quit the round as this character. You can't go back now that you've free'd your job slot. Play another character, or wait for the next round."))
		. = FALSE

	//Do they have their scale properly setup?
	if(!prefs.size_multiplier)
		. = FALSE
		to_chat(src, SPAN_WARNING("You have not set your scale yet.  Do this on the Species Customization tab in character setup."))

	//Custom species checks
	if (prefs && prefs.real_species_name() == SPECIES_CUSTOM)

		//Didn't name it
		if(!prefs.custom_species)
			. = FALSE
			to_chat(src, SPAN_WARNING("You have to name your custom species.  Do this on the Species Customization tab in character setup."))

		//Check traits/costs
		var/list/megalist = prefs.pos_traits + prefs.neu_traits + prefs.neg_traits
		var/points_left = prefs.starting_trait_points
		var/traits_left = prefs.max_traits
		for(var/T in megalist)
			var/cost = traits_costs[T]

			if(cost)
				traits_left--

			//A trait was removed from the game
			if(isnull(cost))
				. = FALSE
				to_chat(src, SPAN_WARNING("Your custom species is not playable. One or more traits appear to have been removed from the game or renamed. Enter character setup to correct this."))
				break
			else
				points_left -= traits_costs[T]

		//Went into negatives
		if(points_left < 0 || traits_left < 0)
			. = FALSE
			to_chat(src, SPAN_WARNING("Your custom species is not playable.  Reconfigure your traits on the Species Customization tab."))
	return
