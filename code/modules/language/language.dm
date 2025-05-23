#define SCRAMBLE_CACHE_LEN 20

/*
	Datum based languages. Easily editable and modular.
*/
/**
 * language datums
 *
 * singletons stored on SScharacters, only referenced by id most of the time.
 */
/datum/prototype/language
	/// Abstract type.
	abstract_type = /datum/prototype/language

	// TODO: ref languages by id in code, so we can rename as needed
	/// Fluff name of language if any.
	var/name = "an unknown language"
	/// Short description for 'Check Languages'.
	var/desc = "A language."
	// todo: sort languages into categories
	/// category in UI
	var/category = "General"
	/// translation classes
	var/translation_class = NONE
	/// 'says', 'hisses', 'farts'.
	var/speech_verb = "says"
	/// Used when sentence ends in a ?
	var/ask_verb = "asks"
	/// Used when sentence ends in a !
	var/exclaim_verb = "exclaims"
	/// Optional. When not specified speech_verb + quietly/softly is used instead.
	var/whisper_verb
	/// list of emotes that might be displayed if this language has LANGUAGE_NONVERBAL or LANGUAGE_SIGNLANG language_flags
	var/signlang_verb = list("signs", "gestures")
	/// CSS style to use for strings in this language.
	var/colour = "body"
	/// Character used to speak in language eg. :o for Unathi.
	var/key
	/// Various language language_flags.
	var/language_flags = NONE
	/// If set, non-native speakers will have trouble speaking.
	var/native
	/// Used when scrambling text for a non-speaker.
	var/list/syllables
	/// Likelihood of getting a space in the random scramble string
	var/list/space_chance = 55
	/// List of languages that can /somehwat/ understand it, format is: name = chance of understanding a word
	var/list/partial_understanding
	var/list/scramble_cache = list()

	// todo: icon state support, shorthand is kind of jarring to see in chat
	/// The shorthand name of this language, used for the indicators in chat. Should be only a handful of all-caps letters.
	var/shorthand = "???"

	//if it uses direct symbol replacement cipher(instead of syllable scrambling)
	var/uses_replace = FALSE
	//list of letters to exclude from the symbol replacement above (IE, you don't want the ciphered language to have the letter "a")
	var/list/exclude_letters = list()
	//list of symbols to replace with, formatted as "a" = "<symbol>"
	var/list/replace_letters = list()

/datum/prototype/language/New()
	if(isnull(id))
		id = ckey(name)

/datum/prototype/language/proc/get_random_name(gender, name_count=2, syllable_count=4, syllable_divisor=2)
	if(!syllables || !syllables.len)
		if(gender==FEMALE)
			return capitalize(pick(GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
		else
			return capitalize(pick(GLOB.first_names_male)) + " " + capitalize(pick(GLOB.last_names))

	var/full_name = ""
	var/new_name = ""

	for(var/i = 0;i<name_count;i++)
		new_name = ""
		for(var/x = rand(FLOOR(syllable_count/syllable_divisor, 1),syllable_count);x>0;x--)
			new_name += pick(syllables)
		full_name += " [capitalize(lowertext(new_name))]"

	return "[trim(full_name)]"

/datum/prototype/language/proc/replacesymbols(input)
	var/list/transformed = splittext_char(input,"")
	if(LAZYLEN(exclude_letters))
		for(var/l in transformed)
			for(var/excluded in exclude_letters)
				if(l == excluded)
					LAZYREMOVE(transformed,l)
	for(var/i in 1 to LAZYLEN(transformed))
		transformed[i] = replace_letters[transformed[i]] || transformed[i]
	return jointext(transformed, "")

/datum/prototype/language/proc/scramble(input, list/known_languages)
	if(uses_replace)
		var/text = replacesymbols(input)
		return text
	var/understand_chance = 0
	for(var/datum/prototype/language/L in known_languages)
		if(partial_understanding && partial_understanding[L.name])
			understand_chance += partial_understanding[L.name]
		if(L.partial_understanding && L.partial_understanding[name])
			understand_chance += L.partial_understanding[name] * 0.5
	var/scrambled_text = ""
	var/list/words = splittext_char(input, " ")
	for(var/w in words)
		if(prob(understand_chance))
			scrambled_text += " [w] "
		else
			var/nword = scramble_word(w)
			var/ending = copytext_char(scrambled_text, length_char(scrambled_text)-1)
			if(findtext_char(ending,"."))
				nword = capitalize(nword)
			else if(findtext_char(ending,"!"))
				nword = capitalize(nword)
			else if(findtext_char(ending,"?"))
				nword = capitalize(nword)
			scrambled_text += nword
	scrambled_text = replacetext_char(scrambled_text,"  "," ")
	scrambled_text = capitalize(scrambled_text)
	scrambled_text = trim(scrambled_text)
	var/ending = copytext_char(scrambled_text, length_char(scrambled_text))
	if(ending == ".")
		scrambled_text = copytext_char(scrambled_text,1,length_char(scrambled_text)-1)

	var/input_ending = copytext_char(input, length_char(input))
	if(input_ending in list("!","?","."))
		scrambled_text += input_ending

	return scrambled_text

/datum/prototype/language/proc/scramble_word(input)
	if(!syllables || !syllables.len)
		return stars(input)

	// If the input is cached already, move it to the end of the cache and return it
	if(scramble_cache[input])
		var/n = scramble_cache[input]
		scramble_cache -= input
		scramble_cache[input] = n
		return n

	var/input_size = length_char(input)
	var/scrambled_text = ""
	var/capitalize = 0

	while(length_char(scrambled_text) < input_size)
		var/next = pick(syllables)
		if(capitalize)
			next = capitalize(next)
			capitalize = 0
		scrambled_text += next
		var/chance = rand(100)
		if(chance <= 5)
			scrambled_text += ". "
			capitalize = 1
		else if(chance > 5 && chance <= space_chance)
			scrambled_text += " "

	// Add it to cache, cutting old entries if the list is too long
	scramble_cache[input] = scrambled_text
	if(scramble_cache.len > SCRAMBLE_CACHE_LEN)
		scramble_cache.Cut(1, scramble_cache.len-SCRAMBLE_CACHE_LEN-1)

	return scrambled_text

/datum/prototype/language/proc/format_message(message, verb)
	return "[verb], <span class='message'><span class='[colour]'>\"[capitalize(message)]\"</span></span>"

/datum/prototype/language/proc/format_message_plain(message, verb)
	return "[verb], \"[capitalize(message)]\""

/datum/prototype/language/proc/format_message_radio(message, verb)
	return "[verb], <span class='[colour]'>\"[capitalize(message)]\"</span>"

/datum/prototype/language/proc/get_talkinto_msg_range(message)
	// if you yell, you'll be heard from two tiles over instead of one
	return (copytext_char(message, length_char(message)) == "!") ? 2 : 1

/datum/prototype/language/proc/broadcast(var/mob/living/speaker,var/message,var/speaker_mask)
	log_say("(HIVE) [message]", speaker)

	if(!speaker_mask) speaker_mask = speaker.name
	message = format_message(message, get_spoken_verb(message))

	for(var/mob/player in GLOB.player_list)
		player.hear_broadcast(src, speaker, speaker_mask, message)

/mob/proc/hear_broadcast(var/datum/prototype/language/language, var/mob/speaker, var/speaker_name, var/message)
	if((language in languages) && language.check_special_condition(src))
		var/msg = "<i><span class='game say'>[language.name], <span class='name'>[speaker_name]</span> [message]</span></i>"
		to_chat(src, msg)

/mob/new_player/hear_broadcast(var/datum/prototype/language/language, var/mob/speaker, var/speaker_name, var/message)
	return

/mob/observer/dead/hear_broadcast(var/datum/prototype/language/language, var/mob/speaker, var/speaker_name, var/message)
	if(speaker.name == speaker_name || antagHUD)
		to_chat(src, "<i><span class='game say'>[language.name], <span class='name'>[speaker_name]</span> ([ghost_follow_link(speaker, src)]) [message]</span></i>")
	else
		to_chat(src, "<i><span class='game say'>[language.name], <span class='name'>[speaker_name]</span> [message]</span></i>")

/datum/prototype/language/proc/check_special_condition(var/mob/other)
	return 1

/datum/prototype/language/proc/get_spoken_verb(var/msg_end)
	switch(msg_end)
		if("!")
			return pick(exclaim_verb)
		if("?")
			return pick(ask_verb)
	return pick(speech_verb)

/datum/prototype/language/proc/can_speak_special(var/mob/speaker)
	. = TRUE
	if(name != "Noise")	// Audible Emotes
		if(ishuman(speaker))
			var/mob/living/carbon/human/H = speaker
			if(H.species.has_organ[O_VOICE] && !(language_flags & LANGUAGE_SIGNLANG) && !(language_flags & LANGUAGE_NONVERBAL)) // Does the species need a voicebox? Is the language even spoken?
				var/obj/item/organ/internal/voicebox/vocal = H.internal_organs_by_name[O_VOICE]
				if(!vocal || vocal.is_broken() || vocal.mute)
					return FALSE

			if(src.name in H.species.assisted_langs && !(src.name in H.species.intrinsic_languages))
				. = FALSE
				var/obj/item/organ/internal/voicebox/vox = locate() in H.internal_organs	// Only voiceboxes for now. Maybe someday it'll include other organs, but I'm not that clever
				if(vox)
					if(!vox.is_broken() && (src in vox.assists_languages))
						. = TRUE

// Language handling.
/mob/proc/add_language(var/language)

	var/datum/prototype/language/new_language = RSlanguages.fetch_or_defer(language) || RSlanguages.legacy_resolve_language_name(language)

	if(!istype(new_language) || (new_language in languages))
		return 0

	languages.Add(new_language)
	return 1

/mob/proc/remove_language(var/rem_language)
	var/datum/prototype/language/L = RSlanguages.fetch_or_defer(rem_language)
	. = (L in languages)
	languages.Remove(L)

/mob/living/remove_language(rem_language)
	var/datum/prototype/language/L = RSlanguages.fetch_or_defer(rem_language)
	if(default_language == L)
		default_language = null
	return ..()

// Can we speak this language, as opposed to just understanding it?
/mob/proc/can_speak(datum/prototype/language/speaking)
//Prevents someone from speaking a null language.
	if(!speaking)
		log_debug(SPAN_DEBUG("[src] attempted to speak a null language."))
		return 0

	if(speaking == RSlanguages.legacy_resolve_language_name("Noise"))
		return 1

	if (only_species_language && speaking != RSlanguages.legacy_resolve_language_name(species_language))
		return 0

	if(speaking.can_speak_special(src))
		if(universal_speak)
			return 1
		if(speaking && (speaking.language_flags & LANGUAGE_INNATE))
			return 1
		if(speaking in src.languages)
			return 1
	return 0

/mob/proc/get_language_prefix()
	return config_legacy.language_prefixes[1]

/mob/proc/is_language_prefix(prefix)
	return (prefix in config_legacy.language_prefixes)

//TBD
/mob/verb/check_languages()
	set name = "Check Known Languages"
	set category = VERB_CATEGORY_IC
	set src = usr

	var/dat = "<b><font size = 5>Known Languages</font></b><br/><br/>"

	for(var/datum/prototype/language/L in languages)
		if(!(L.language_flags & LANGUAGE_NONGLOBAL))
			dat += "<b>[L.name] ([get_language_prefix()][L.key])</b><br/>[L.desc]<br/><br/>"

	src << browse(HTML_SKELETON(dat), "window=checklanguage")
	return

/mob/living/check_languages()
	var/dat = "<b><font size = 5>Known Languages</font></b><br/><br/>"

	if(default_language)
		dat += "Current default language: [default_language] - <a href='byond://?src=\ref[src];default_lang=reset'>reset</a><br/><br/>"

	for(var/datum/prototype/language/L in languages)
		if(!(L.language_flags & LANGUAGE_NONGLOBAL))
			if(L == default_language)
				dat += "<b>[L.name] ([get_language_prefix()][L.key])</b> - default - <a href='byond://?src=\ref[src];default_lang=reset'>reset</a><br/>[L.desc]<br/><br/>"
			else if (can_speak(L))
				dat += "<b>[L.name] ([get_language_prefix()][L.key])</b> - <a href='byond://?src=\ref[src];default_lang=\ref[L]'>set default</a><br/>[L.desc]<br/><br/>"
			else
				dat += "<b>[L.name] ([get_language_prefix()][L.key])</b> - cannot speak!<br/>[L.desc]<br/><br/>"

	src << browse(HTML_SKELETON(dat), "window=checklanguage")

/mob/living/Topic(href, href_list)
	if(href_list["default_lang"])
		if(href_list["default_lang"] == "reset")
			if (species_language)
				set_default_language(RSlanguages.legacy_resolve_language_name(species_language))
			else
				set_default_language(null)
		else
			var/datum/prototype/language/L = locate(href_list["default_lang"])
			if(L && (L in languages))
				set_default_language(L)
		check_languages()
		return 1
	else
		return ..()

/proc/transfer_languages(var/mob/source, var/mob/target, var/except_flags)
	for(var/datum/prototype/language/L in source.languages)
		if(L.language_flags & except_flags)
			continue
		target.add_language(L.name)

#undef SCRAMBLE_CACHE_LEN
