//admin verb groups - They can overlap if you so wish. Only one of each verb will exist in the verbs list regardless
var/list/admin_verbs_default = list(
	/datum/admins/proc/show_player_panel,	//shows an interface for individual players, with various links (links require additional flags,
//	/client/proc/player_panel,
	/client/proc/deadmin_self,			//destroys our own admin datum so we can play as a regular player,
	/client/proc/hide_verbs,			//hides all our adminverbs,
	/client/proc/hide_most_verbs,		//hides all our hideable adminverbs,
	/client/proc/debug_variables,		//allows us to -see- the variables of any instance in the game. +VAREDIT needed to modify,
	/client/proc/mark_datum_mapview,
	/client/proc/cmd_check_new_players,	//allows us to see every new player
//	/client/proc/check_antagonists,		//shows all antags,
//	/client/proc/cmd_mod_say,
//	/client/proc/deadchat				//toggles deadchat on/off,
//	/client/proc/toggle_ahelp_sound,
	)

var/list/admin_verbs_admin = list(
	/client/proc/player_panel, //shows an interface for all players, with links to various panels,
	/datum/admins/proc/set_tcrystals,
	/datum/admins/proc/add_tcrystals,
	/client/proc/invisimin,				//allows our mob to go invisible/visible,
	/client/proc/getserverlogs,		/*for accessing server logs*/
	/client/proc/getcurrentlogs,		/*for accessing server logs*/
	/datum/admins/proc/show_traitor_panel,	//interface which shows a mob's mind.,
	/datum/admins/proc/show_game_mode,  //Configuration window for the current game mode.,
	/datum/admins/proc/force_mode_latespawn, //Force the mode to try a latespawn proc,
	/datum/admins/proc/force_antag_latespawn, //Force a specific template to try a latespawn proc,
	/datum/admins/proc/toggleenter,		//toggles whether people can join the current game,
	/datum/admins/proc/toggleguests,	//toggles whether guests can join the current game,
	/datum/admins/proc/announce,		//priority announce something to all clients.,
	/datum/admins/proc/intercom,		//send a fake intercom message, like an arrivals announcement,
	/datum/admins/proc/intercom_convo,	//send a fake intercom conversation, like an ATC exchange,
	/client/proc/admin_ghost,			//allows us to ghost/reenter body at will,
	/client/proc/toggle_view_range,		//changes how far we can see,
	/client/proc/cmd_admin_pm_context,	//right-click adminPM interface,
	/client/proc/cmd_admin_pm_panel,	//admin-pm list,
	/client/proc/cmd_admin_subtle_message,	//send an message to somebody as a 'voice in their head',
	/client/proc/cmd_admin_icsubtle_message, //send a message to someone as a voice from centcom
	/client/proc/cmd_admin_delete,		//delete an instance/object/mob/etc,
	/client/proc/cmd_admin_check_player_logs,	//checks a player's attack logs,
	/client/proc/cmd_admin_check_dialogue_logs,	//checks a player's dialogue logs,
	/datum/admins/proc/access_news_network,	//allows access of newscasters,
	/client/proc/jumptocoord,			//we ghost and jump to a coordinate,
	/client/proc/Getmob,				//teleports a mob to our location,
	/client/proc/Getkey,				//teleports a mob with a certain ckey to our location,
	/client/proc/SetCKey,				//set the ckey of a mob
//	/client/proc/sendmob,				//sends a mob somewhere, -Removed due to it needing two sorting procs to work, which were executed every time an admin right-clicked. ~Errorage,
	/client/proc/Jump,
	/client/proc/jumptokey,				//allows us to jump to the location of a mob with a certain ckey,
	/client/proc/jumptomob,				//allows us to jump to a specific mob,
	/client/proc/jumptoturf,			//allows us to jump to a specific turf,
	/client/proc/admin_call_shuttle,	//allows us to call the emergency shuttle,
	/client/proc/admin_cancel_shuttle,	//allows us to cancel the emergency shuttle, sending it back to CentCom,
	/client/proc/cmd_admin_direct_narrate,	//send text directly to a player with no padding. Useful for narratives and fluff-text,
	/client/proc/cmd_admin_local_narrate,
	/client/proc/cmd_admin_world_narrate,
	/client/proc/cmd_admin_z_narrate,	//sends text to all players on a z-level.When Global is too much
	/client/proc/cmd_admin_create_centcom_report,
	/client/proc/check_words,			//displays cult-words,
	/client/proc/check_ai_laws,			//shows AI and borg laws,
	/client/proc/rename_silicon,		//properly renames silicons,
	/client/proc/manage_silicon_laws,	// Allows viewing and editing silicon laws. ,
	/client/proc/check_antagonists,
	/client/proc/admin_memo,			//admin memo system. show/delete/write. +SERVER needed to delete admin memos of others,
	/client/proc/dsay,					//talk in deadchat using our ckey/fakekey,
//	/client/proc/toggle_hear_deadcast,	//toggles whether we hear deadchat,
	/client/proc/investigate_show,		//various admintools for investigation. Such as a singulo grief-log,
	/client/proc/secrets,
	/datum/admins/proc/toggleooc,		//toggles ooc on/off for everyone,
	/datum/admins/proc/togglelooc,		//toggles looc on/off for everyone,
	/datum/admins/proc/toggleoocdead,	//toggles ooc on/off for everyone who is dead,
	/datum/admins/proc/togglehubvisibility, //toggles visibility on the BYOND Hub.,
	/datum/admins/proc/toggledsay,		//toggles dsay on/off for everyone,
	/client/proc/game_panel,			//game panel, allows to change game-mode etc,
	/client/proc/cmd_admin_say,			//admin-only ooc chat,
	/client/proc/cmd_mod_say,
	/client/proc/cmd_event_say,
	/datum/admins/proc/PlayerNotes,
	/datum/admins/proc/show_player_info,
	/client/proc/free_slot,			//frees slot for chosen job,
	/client/proc/cmd_admin_change_custom_event,
	/client/proc/cmd_admin_rejuvenate,
	/client/proc/toggleghostwriters,
	/client/proc/toggledrones,
//	/datum/admins/proc/show_skills,
	/client/proc/check_customitem_activity,
	/client/proc/man_up,
	/client/proc/global_man_up,
	/client/proc/response_team, // Response Teams admin verb
	/client/proc/toggle_antagHUD_use,
	/client/proc/toggle_antagHUD_restrictions,
	/client/proc/allow_character_respawn, // Allows a ghost to respawn ,
	/client/proc/event_manager_panel,
	/client/proc/empty_ai_core_toggle_latejoin,
	/client/proc/empty_ai_core_toggle_latejoin,
	/client/proc/aooc,
	/client/proc/change_human_appearance_admin,	// Allows an admin to change the basic appearance of human-based mobs ,
	/client/proc/change_human_appearance_self,	// Allows the human-based mob itself change its basic appearance ,
	/client/proc/change_security_level,
	/client/proc/makePAI,
	/datum/admins/proc/paralyze_mob,
	/client/proc/fixatmos,
	/datum/admins/proc/quick_nif,
	/datum/admins/proc/sendFax,
	/client/proc/despawn_player,
	/client/proc/addbunkerbypass,
	/client/proc/revokebunkerbypass,
	/client/proc/toggle_AI_interact,
	/client/proc/list_event_volunteers,
	/client/proc/set_headshot_for_user,
	)

var/list/admin_verbs_ban = list(
	/client/proc/unban_panel,
	/client/proc/jobbans
	)

var/list/admin_verbs_sounds = list(
	/client/proc/play_local_sound,
	/client/proc/play_sound,
	/client/proc/play_web_sound,
	/client/proc/manual_play_web_sound,
	/client/proc/stop_sounds
	)

var/list/admin_verbs_fun = list(
	/client/proc/object_talk,
	/datum/admins/proc/cmd_admin_dress,
	/client/proc/cmd_admin_gib_self,
	/client/proc/drop_bomb,
	/client/proc/everyone_random,
	/client/proc/cinematic,
	/datum/admins/proc/toggle_aliens,
	/datum/admins/proc/toggle_space_ninja,
	/client/proc/cmd_admin_add_freeform_ai_law,
	/client/proc/cmd_admin_add_random_ai_law,
	/client/proc/make_sound,
	/client/proc/toggle_random_events,
	/client/proc/editappear,
	/client/proc/roll_dices,
	/datum/admins/proc/call_supply_drop,
	/datum/admins/proc/call_drop_pod,
	/client/proc/smite,
	/client/proc/admin_lightning_strike,
	/proc/atom_emote,
	)

var/list/admin_verbs_spawn = list(
	/datum/admins/proc/spawn_fruit,
	/datum/admins/proc/spawn_custom_item,
	/datum/admins/proc/check_custom_items,
	/datum/admins/proc/spawn_plant,
	/client/proc/spawn_atom, // Allows us to spawn instances,
	/client/proc/respawn_character,
	/client/proc/spawn_character_mob,
	/client/proc/virus2_editor,
	/client/proc/map_template_load,
	/client/proc/map_template_upload,
	// /client/proc/overmap_upload,
	/client/proc/map_template_load_on_new_z
	)

var/list/admin_verbs_server = list(
	/datum/admins/proc/capture_map,
	/client/proc/Set_Holiday,
	/client/proc/ToRban,
	/datum/admins/proc/startnow,
	/datum/admins/proc/restart,
	/datum/admins/proc/delay_start,
	/datum/admins/proc/delay_end,
	/datum/admins/proc/toggleaban,
	/client/proc/cmd_mod_say,
	/client/proc/everyone_random,
	/datum/admins/proc/toggleAI,
	/client/proc/cmd_admin_delete, // Delete an instance/object/mob/etc,
	/client/proc/cmd_del_all,
	/client/proc/cmd_del_all_force,
	/client/proc/cmd_del_all_hard,
	/client/proc/check_timer_sources,
	/client/proc/toggle_browser_inspect,
	/client/proc/cmd_admin_clear_mobs,
	/datum/admins/proc/adspawn,
	/datum/admins/proc/adjump,
	/datum/admins/proc/toggle_aliens,
	/datum/admins/proc/toggle_space_ninja,
	/client/proc/toggle_random_events,
	/client/proc/check_customitem_activity,
	/client/proc/nanomapgen_DumpImage,
	/client/proc/modify_server_news,
	/client/proc/recipe_dump,
	/client/proc/panicbunker,
	/client/proc/paranoia_logging,
	/client/proc/reestablish_db_connection,
	/client/proc/change_next_map,
	)

var/list/admin_verbs_debug = list(
	/client/proc/cmd_admin_list_open_jobs,
	/client/proc/Debug2,
	/client/proc/kill_air,
	/client/proc/ZASSettings,
	/client/proc/reload_configuration,
	/client/proc/cmd_debug_make_powernets,
	/client/proc/kill_airgroup,
	/client/proc/debug_controller,
	/client/proc/debug_antagonist_template,
	/client/proc/cmd_debug_mob_lists,
	/client/proc/cmd_admin_delete,
	/client/proc/cmd_del_all,
	/client/proc/cmd_del_all_force,
	/client/proc/cmd_del_all_hard,
	/client/proc/check_timer_sources,
	/client/proc/toggle_browser_inspect,
	/client/proc/cmd_debug_tog_aliens,
	/client/proc/cmd_display_del_log,
	/client/proc/cmd_display_init_log,
	/client/proc/cmd_display_overlay_log,
	/client/proc/air_report,
	/client/proc/reload_admins,
	/client/proc/reload_eventMs,
	/client/proc/restart_controller,
	/datum/admins/proc/restart,
	/client/proc/print_random_map,
	/client/proc/create_random_map,
	/client/proc/apply_random_map,
	/client/proc/overlay_random_map,
	/client/proc/delete_random_map,
	/client/proc/show_plant_genes,
	/client/proc/enable_debug_verbs,
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/SDQL2_query,
	/client/proc/Jump,
	/client/proc/debug_rogueminer,
	/client/proc/start_line_profiling,
	/client/proc/stop_line_profiling,
	/client/proc/show_line_profiling,
	/client/proc/jumptomob,
	/client/proc/jumptocoord,
	/client/proc/dsay,
	/client/proc/admin_ghost,			//allows us to ghost/reenter body at will,
	/datum/admins/proc/view_runtimes,
	/client/proc/show_gm_status,
	/datum/admins/proc/change_weather,
	/datum/admins/proc/change_time,
	/client/proc/admin_give_modifier,
	/client/proc/fucky_wucky,
	/datum/admins/proc/fishing_calculator,
	)

var/list/admin_verbs_paranoid_debug = list(
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/debug_controller
	)

var/list/admin_verbs_possess = list(
	/proc/possess,
	/proc/release
	)
var/list/admin_verbs_permissions = list(
	/client/proc/edit_admin_permissions
	)
var/list/admin_verbs_rejuv = list(
	/client/proc/respawn_character
	)

//verbs which can be hidden - needs work
var/list/admin_verbs_hideable = list(
	/client/proc/deadmin_self,
//	/client/proc/deadchat,
	/datum/admins/proc/show_traitor_panel,
	/datum/admins/proc/toggleenter,
	/datum/admins/proc/toggleguests,
	/datum/admins/proc/announce,
	/client/proc/admin_ghost,
	/client/proc/toggle_view_range,
	/client/proc/cmd_admin_subtle_message,
	/client/proc/cmd_admin_icsubtle_message,
	/client/proc/cmd_admin_check_player_logs,
	/client/proc/cmd_admin_check_dialogue_logs,
	/datum/admins/proc/access_news_network,
	/client/proc/admin_call_shuttle,
	/client/proc/admin_cancel_shuttle,
	/client/proc/cmd_admin_direct_narrate,
	/client/proc/cmd_admin_local_narrate,
	/client/proc/cmd_admin_world_narrate,
	/client/proc/cmd_admin_z_narrate,
	/client/proc/check_words,
	/client/proc/play_local_sound,
	/client/proc/play_sound,
	/client/proc/play_web_sound,
	/client/proc/manual_play_web_sound,
	/client/proc/stop_sounds,
	/client/proc/object_talk,
	/datum/admins/proc/cmd_admin_dress,
	/client/proc/cmd_admin_gib_self,
	/client/proc/drop_bomb,
	/client/proc/cinematic,
	/datum/admins/proc/toggle_aliens,
	/datum/admins/proc/toggle_space_ninja,
	/client/proc/cmd_admin_add_freeform_ai_law,
	/client/proc/cmd_admin_add_random_ai_law,
	/client/proc/cmd_admin_create_centcom_report,
	/client/proc/make_sound,
	/client/proc/toggle_random_events,
	/client/proc/cmd_admin_add_random_ai_law,
	/client/proc/Set_Holiday,
	/client/proc/ToRban,
	/datum/admins/proc/startnow,
	/datum/admins/proc/restart,
	/datum/admins/proc/delay_start,
	/datum/admins/proc/delay_end,
	/datum/admins/proc/toggleaban,
	/client/proc/everyone_random,
	/client/proc/reload_configuration,
	/datum/admins/proc/toggleAI,
	/datum/admins/proc/adspawn,
	/datum/admins/proc/adjump,
	/client/proc/restart_controller,
	/client/proc/cmd_admin_list_open_jobs,
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/Debug2,
	/client/proc/reload_admins,
	/client/proc/kill_air,
	/client/proc/cmd_debug_make_powernets,
	/client/proc/kill_airgroup,
	/client/proc/debug_controller,
	/client/proc/startSinglo,
	/client/proc/cmd_debug_mob_lists,
	/client/proc/cmd_del_all,
	/client/proc/cmd_del_all_force,
	/client/proc/cmd_del_all_hard,
	/client/proc/check_timer_sources,
	/client/proc/toggle_browser_inspect,
	/client/proc/cmd_admin_clear_mobs,
	/client/proc/cmd_debug_tog_aliens,
	/client/proc/cmd_display_del_log,
	/client/proc/air_report,
	/client/proc/enable_debug_verbs,
	/client/proc/roll_dices,
	/proc/possess,
	/proc/release,
	/datum/admins/proc/set_tcrystals,
	/proc/atom_emote,
	)
var/list/admin_verbs_mod = list(
	/client/proc/cmd_admin_pm_context,	//right-click adminPM interface,
	/client/proc/cmd_admin_pm_panel,	//admin-pm list,
	/client/proc/debug_variables,		//allows us to -see- the variables of any instance in the game.,
	/datum/admins/proc/PlayerNotes,
	/client/proc/admin_ghost,			//allows us to ghost/reenter body at will,
	/client/proc/cmd_mod_say,
	/client/proc/cmd_event_say,
	/datum/admins/proc/show_player_info,
	/client/proc/player_panel,
	/client/proc/dsay,
//	/datum/admins/proc/show_skills,
	/datum/admins/proc/show_player_panel,
	/client/proc/check_antagonists,
	/client/proc/aooc,
	/client/proc/jobbans,
	/client/proc/cmd_admin_subtle_message, 	//send an message to somebody as a 'voice in their head',
	/client/proc/cmd_admin_icsubtle_message,
	/datum/admins/proc/paralyze_mob,
	/client/proc/cmd_admin_direct_narrate,
	/client/proc/allow_character_respawn,   // Allows a ghost to respawn ,
	/datum/admins/proc/sendFax,
	/client/proc/addbunkerbypass,
	/client/proc/revokebunkerbypass
)

var/list/admin_verbs_event_manager = list(
	/client/proc/cmd_event_say,
	/client/proc/cmd_admin_pm_context,
	/client/proc/cmd_admin_pm_panel,
	/datum/admins/proc/PlayerNotes,
	/client/proc/admin_ghost,
	/datum/admins/proc/show_player_info,
	/client/proc/dsay,
	/client/proc/cmd_admin_subtle_message,
	/client/proc/cmd_admin_icsubtle_message,
	/client/proc/debug_variables,
	/client/proc/check_antagonists,
	/client/proc/aooc,
	/client/proc/cmd_admin_clear_mobs,
	/datum/admins/proc/paralyze_mob,
	/client/proc/cmd_admin_direct_narrate,
	/client/proc/allow_character_respawn,
	/datum/admins/proc/sendFax,
	/client/proc/respawn_character,
	/proc/possess,
	/proc/release,
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/debug_controller,
	/client/proc/show_gm_status,
	/datum/admins/proc/change_weather,
	/datum/admins/proc/change_time,
	/client/proc/admin_give_modifier,
	/client/proc/Jump,
	/client/proc/jumptomob,
	/client/proc/jumptocoord,
	/client/proc/cmd_admin_delete,
	/datum/admins/proc/delay_start,
	/datum/admins/proc/delay_end,
	/client/proc/Set_Holiday,
	/client/proc/make_sound,
	/client/proc/toggle_random_events,
	/datum/admins/proc/cmd_admin_dress,
	/client/proc/cmd_admin_gib_self,
	/client/proc/drop_bomb,
	/client/proc/cmd_admin_add_freeform_ai_law,
	/client/proc/cmd_admin_add_random_ai_law,
	/client/proc/make_sound,
	/client/proc/toggle_random_events,
	/client/proc/editappear,
	/client/proc/roll_dices,
	/datum/admins/proc/call_supply_drop,
	/datum/admins/proc/call_drop_pod
)

/client/proc/add_admin_verbs()
	if(holder)
		add_verb(src, admin_verbs_default)
		if(holder.rights & R_BUILDMODE)		add_verb(src, /client/proc/togglebuildmodeself)
		if(holder.rights & R_ADMIN)			add_verb(src, admin_verbs_admin)
		if(holder.rights & R_BAN)			add_verb(src, admin_verbs_ban)
		if(holder.rights & R_FUN)			add_verb(src, admin_verbs_fun)
		if(holder.rights & R_SERVER)		add_verb(src, admin_verbs_server)
		if(holder.rights & R_DEBUG)
			add_verb(src, admin_verbs_debug)
			if(config_legacy.debugparanoid && !(holder.rights & R_ADMIN))
				remove_verb(src, admin_verbs_paranoid_debug)			//Right now it's just callproc but we can easily add others later on.
		if(holder.rights & R_POSSESS)		add_verb(src, admin_verbs_possess)
		if(holder.rights & R_PERMISSIONS)	add_verb(src, admin_verbs_permissions)
		if(holder.rights & R_STEALTH)		add_verb(src, /client/proc/stealth)
		if(holder.rights & R_REJUVINATE)	add_verb(src, admin_verbs_rejuv)
		if(holder.rights & R_SOUNDS)		add_verb(src, admin_verbs_sounds)
		if(holder.rights & R_SPAWN)			add_verb(src, admin_verbs_spawn)
		if(holder.rights & R_MOD)			add_verb(src, admin_verbs_mod)
		if(holder.rights & R_EVENT)			add_verb(src, admin_verbs_event_manager)

/client/proc/remove_admin_verbs()
	remove_verb(src, list(
		admin_verbs_default,
		/client/proc/togglebuildmodeself,
		admin_verbs_admin,
		admin_verbs_ban,
		admin_verbs_fun,
		admin_verbs_server,
		admin_verbs_debug,
		admin_verbs_possess,
		admin_verbs_permissions,
		/client/proc/stealth,
		admin_verbs_rejuv,
		admin_verbs_sounds,
		admin_verbs_spawn,
		debug_verbs
	))

/client/proc/hide_most_verbs()//Allows you to keep some functionality while hiding some verbs
	set name = "Adminverbs - Hide Most"
	set category = "Admin"

	remove_verb(src, list(/client/proc/hide_most_verbs, admin_verbs_hideable))
	add_verb(src, /client/proc/show_verbs)

	to_chat(src, "<span class='interface'>Most of your adminverbs have been hidden.</span>")
	feedback_add_details("admin_verb","HMV") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/hide_verbs()
	set name = "Adminverbs - Hide All"
	set category = "Admin"

	remove_admin_verbs()
	add_verb(src, /client/proc/show_verbs)

	to_chat(src, "<span class='interface'>Almost all of your adminverbs have been hidden.</span>")
	feedback_add_details("admin_verb","TAVVH") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/show_verbs()
	set name = "Adminverbs - Show"
	set category = "Admin"

	remove_verb(src, /client/proc/show_verbs)
	add_admin_verbs()

	to_chat(src, "<span class='interface'>All of your adminverbs are now visible.</span>")
	feedback_add_details("admin_verb","TAVVS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/client/proc/admin_ghost()
	set category = "Admin"
	set name = "Aghost"
	if(!holder)
		return
	if(istype(mob,/mob/observer/dead))
		//re-enter
		var/mob/observer/dead/ghost = mob
		if(ghost.can_reenter_corpse)
			ghost.reenter_corpse()
		else
			to_chat(ghost, "<font color='red'>Error:  Aghost:  Can't reenter corpse.</font>")
			return

		feedback_add_details("admin_verb","P") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	else if(istype(mob,/mob/new_player))
		to_chat(src, "<font color='red'>Error: Aghost: Can't admin-ghost whilst in the lobby. Join or Observe first.</font>")
	else
		//ghostize
		var/mob/body = mob
		var/mob/observer/dead/ghost = body.ghostize(1)
		ghost.admin_ghosted = 1
		if(body)
			body.teleop = ghost
			if(!body.key)
				body.key = "@[key]"	//Haaaaaaaack. But the people have spoken. If it breaks; blame adminbus
		feedback_add_details("admin_verb","O") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/invisimin()
	set name = "Invisimin"
	set category = "Admin"
	set desc = "Toggles ghost-like invisibility (Don't abuse this)"
	if(holder && mob)
		if(mob.invisibility == INVISIBILITY_OBSERVER)
			mob.invisibility = initial(mob.invisibility)
			to_chat(mob, "<font color='red'><b>Invisimin off. Invisibility reset.</b></font>")
			mob.alpha = max(mob.alpha + 100, 255)
		else
			mob.invisibility = INVISIBILITY_OBSERVER
			to_chat(mob, "<font color=#4F49AF><b>Invisimin on. You are now as invisible as a ghost.</b></font>")
			mob.alpha = max(mob.alpha - 100, 0)

/*
/client/proc/player_panel()
	set name = "Player Panel"
	set category = "Admin"
	if(holder)
		holder.player_panel_old()
	feedback_add_details("admin_verb","PP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return
*/
/client/proc/player_panel()
	set name = "Player Panel"
	set category = "Admin"
	if(holder)
		holder.player_panel()
	feedback_add_details("admin_verb","PPN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/check_antagonists()
	set name = "Check Antagonists"
	set category = "Admin"
	if(holder)
		holder.check_antagonists()
		log_admin("[key_name(usr)] checked antagonists.")	//for tsar~
	feedback_add_details("admin_verb","CHA") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/jobbans()
	set name = "Display Job bans"
	set category = "Admin"
	if(holder)
		if(config_legacy.ban_legacy_system)
			holder.Jobbans()
		else
			holder.DB_ban_panel()
	feedback_add_details("admin_verb","VJB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/unban_panel()
	set name = "Unban Panel"
	set category = "Admin"
	if(holder)
		if(config_legacy.ban_legacy_system)
			holder.unbanpanel()
		else
			holder.DB_ban_panel()
	feedback_add_details("admin_verb","UBP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/game_panel()
	set name = "Game Panel"
	set category = "Admin"
	if(holder)
		holder.Game()
	feedback_add_details("admin_verb","GP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/secrets()
	set name = "Secrets"
	set category = "Admin"
	if (holder)
		holder.Secrets()
	feedback_add_details("admin_verb","S") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/findStealthKey(txt)
	if(txt)
		for(var/P in GLOB.stealthminID)
			if(GLOB.stealthminID[P] == txt)
				return P
	txt = GLOB.stealthminID[ckey]
	return txt

/client/proc/createStealthKey()
	var/num = (rand(0,1000))
	var/i = 0
	while(i == 0)
		i = 1
		for(var/P in GLOB.stealthminID)
			if(num == GLOB.stealthminID[P])
				num++
				i = 0
	GLOB.stealthminID["[ckey]"] = "@[num2text(num)]"

/client/proc/stealth()
	set category = "Admin"
	set name = "Stealth Mode"
	if(holder)
		if(holder.fakekey)
			holder.fakekey = null
			if(istype(src.mob, /mob/new_player))
				mob.name = capitalize(ckey)
		else
			var/new_key = ckeyEx(input("Enter your desired display name.", "Fake Key", key) as text|null)
			if(!new_key)
				return
			if(length(new_key) >= 26)
				new_key = copytext(new_key, 1, 26)
			holder.fakekey = new_key
			createStealthKey()
			if(istype(mob, /mob/new_player))
				mob.name = new_key
		holder.update_stealth_ghost()
		log_admin("[key_name(usr)] has turned stealth mode [holder.fakekey ? "ON" : "OFF"]")
		message_admins("[key_name_admin(usr)] has turned stealth mode [holder.fakekey ? "ON" : "OFF"]", 1)
	feedback_add_details("admin_verb","SM") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/drop_bomb() // Some admin dickery that can probably be done better -- TLE
	set category = "Special Verbs"
	set name = "Drop Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	var/turf/epicenter = mob.loc
	var/list/choices = list("Small Bomb", "Medium Bomb", "Big Bomb", "Custom Bomb", "Cancel")
	var/choice = input("What size explosion would you like to produce?") in choices
	switch(choice)
		if(null)
			return 0
		if("Cancel")
			return 0
		if("Small Bomb")
			explosion(epicenter, 1, 2, 3, 3)
		if("Medium Bomb")
			explosion(epicenter, 2, 3, 4, 4)
		if("Big Bomb")
			explosion(epicenter, 3, 5, 7, 5)
		if("Custom Bomb")
			var/devastation_range = input("Devastation range (in tiles):") as num
			var/heavy_impact_range = input("Heavy impact range (in tiles):") as num
			var/light_impact_range = input("Light impact range (in tiles):") as num
			var/flash_range = input("Flash range (in tiles):") as num
			explosion(epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range)
	message_admins("<font color=#4F49AF>[ckey] creating an admin explosion at [epicenter.loc].</font>")
	feedback_add_details("admin_verb","DB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/give_disease2(mob/T as mob in GLOB.mob_list) // -- Giacom
	set category = "Fun"
	set name = "Give Disease"
	set desc = "Gives a Disease to a mob."

	var/datum/disease2/disease/D = new /datum/disease2/disease()

	var/severity = 1
	var/greater = input("Is this a lesser, greater, or badmin disease?", "Give Disease") in list("Lesser", "Greater", "Badmin")
	switch(greater)
		if ("Lesser") severity = 1
		if ("Greater") severity = 2
		if ("Badmin") severity = 99

	D.makerandom(severity)
	D.infectionchance = input("How virulent is this disease? (1-100)", "Give Disease", D.infectionchance) as num

	if(istype(T,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = T
		if (H.species)
			D.affected_species = list(H.species.get_bodytype_legacy())
			if(H.species.primitive_form)
				D.affected_species |= H.species.primitive_form
			if(H.species.greater_form)
				D.affected_species |= H.species.greater_form
	infect_virus2(T,D,1)

	feedback_add_details("admin_verb","GD2") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(T)] a [greater] disease2 with infection chance [D.infectionchance].")
	message_admins("<font color=#4F49AF>[key_name_admin(usr)] gave [key_name(T)] a [greater] disease2 with infection chance [D.infectionchance].</font>", 1)

/client/proc/admin_give_modifier(var/mob/living/L)
	set category = "Debug"
	set name = "Give Modifier"
	set desc = "Makes a mob weaker or stronger by adding a specific modifier to them."
	set popup_menu = FALSE

	if(!L)
		to_chat(usr, "<span class='warning'>Looks like you didn't select a mob.</span>")
		return

	var/list/possible_modifiers = typesof(/datum/modifier) - /datum/modifier

	var/new_modifier_type = input("What modifier should we add to [L]?", "Modifier Type") as null|anything in possible_modifiers
	if(!new_modifier_type)
		return
	var/duration = input("How long should the new modifier last, in seconds.  To make it last forever, write '0'.", "Modifier Duration") as num
	if(duration == 0)
		duration = null
	else
		duration = duration SECONDS

	L.add_modifier(new_modifier_type, duration)
	log_and_message_admins("has given [key_name(L)] the modifer [new_modifier_type], with a duration of [duration ? "[duration / 600] minutes" : "forever"].")

/client/proc/make_sound(var/obj/O in world) // -- TLE
	set category = "Special Verbs"
	set name = "Make Sound"
	set desc = "Display a message to everyone who can hear the target"
	if(O)
		var/message = sanitize(input("What do you want the message to be?", "Make Sound") as text|null)
		if(!message)
			return
		for (var/mob/V in hearers(O))
			V.show_message(message, 2)
		log_admin("[key_name(usr)] made [O] at [O.x], [O.y], [O.z]. make a sound")
		message_admins("<font color=#4F49AF>[key_name_admin(usr)] made [O] at [O.x], [O.y], [O.z]. make a sound.</font>", 1)
		feedback_add_details("admin_verb","MS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/client/proc/togglebuildmodeself()
	set name = "Toggle Build Mode Self"
	set category = "Special Verbs"
	if(src.mob)
		togglebuildmode(src.mob)
	feedback_add_details("admin_verb","TBMS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/object_talk(var/msg as text) // -- TLE
	set category = "Special Verbs"
	set name = "oSay"
	set desc = "Display a message to everyone who can hear the target"
	if(mob.control_object)
		if(!msg)
			return
		for (var/mob/V in hearers(mob.control_object))
			V.show_message("<b>[mob.control_object.name]</b> says: \"" + msg + "\"", 2)
	feedback_add_details("admin_verb","OT") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/kill_air() // -- TLE
	set category = "Debug"
	set name = "Kill Air"
	set desc = "Toggle Air Processing"
	if(!SSair.can_fire)
		SSair.can_fire = TRUE
		to_chat(usr, "<b>Enabled air processing.</b>")
	else
		SSair.can_fire = FALSE
		to_chat(usr, "<b>Disabled air processing.</b>")
	feedback_add_details("admin_verb","KA") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] used 'kill air'.")
	message_admins("<font color=#4F49AF>[key_name_admin(usr)] used 'kill air'.</font>", 1)

/client/proc/readmin_self()
	set name = "Re-Admin self"
	set category = "Admin"

	if(deadmin_holder)
		deadmin_holder.reassociate()
		log_admin("[src] re-admined themself.")
		message_admins("[src] re-admined themself.", 1)
		to_chat(src, "<span class='interface'>You now have the keys to control the planet, or atleast a small space station</span>")
		remove_verb(src, /client/proc/readmin_self)

/client/proc/deadmin_self()
	set name = "De-admin self"
	set category = "Admin"

	if(holder)
		log_admin("[src] deadmined themself.")
		message_admins("[src] deadmined themself.", 1)
		deadmin()
		to_chat(src, "<span class='interface'>You are now a normal player.</span>")
		if(deadmin_holder?.fakekey)
			to_chat(src, SPAN_RED(SPAN_BIG(SPAN_ANNOUNCE("Your ckey is still obfuscated as '[deadmin_holder.fakekey]' due to de-adminning while stealthed."))))
		add_verb(src, /client/proc/readmin_self)
	feedback_add_details("admin_verb","DAS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/check_ai_laws()
	set name = "Check AI Laws"
	set category = "Admin"
	if(holder)
		src.holder.output_ai_laws()

/client/proc/rename_silicon()
	set name = "Rename Silicon"
	set category = "Admin"

	if(!check_rights(R_ADMIN)) return

	var/mob/living/silicon/S = input("Select silicon.", "Rename Silicon.") as null|anything in silicon_mob_list
	if(!S) return

	var/new_name = sanitizeSafe(input(src, "Enter new name. Leave blank or as is to cancel.", "[S.real_name] - Enter new silicon name", S.real_name))
	if(new_name && new_name != S.real_name)
		log_and_message_admins("has renamed the silicon '[S.real_name]' to '[new_name]'")
		S.SetName(new_name)
	feedback_add_details("admin_verb","RAI") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/manage_silicon_laws()
	set name = "Manage Silicon Laws"
	set category = "Admin"

	if(!check_rights(R_ADMIN)) return

	var/mob/living/silicon/S = input("Select silicon.", "Manage Silicon Laws") as null|anything in silicon_mob_list
	if(!S) return

	var/datum/nano_module/law_manager/L = new(S)
	L.nano_ui_interact(usr, state = admin_state)
	log_and_message_admins("has opened [S]'s law manager.")
	feedback_add_details("admin_verb","MSL") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/change_human_appearance_admin()
	set name = "Change Mob Appearance - Admin"
	set desc = "Allows you to change the mob appearance"
	set category = "Admin"

	if(!check_rights(R_FUN)) return

	var/mob/living/carbon/human/H = input("Select mob.", "Change Mob Appearance - Admin") as null|anything in human_mob_list
	if(!H) return

	log_and_message_admins("is altering the appearance of [H].")
	H.change_appearance(APPEARANCE_ALL, usr, usr, check_species_whitelist = 0, state = admin_state)
	feedback_add_details("admin_verb","CHAA") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/change_human_appearance_self()
	set name = "Change Mob Appearance - Self"
	set desc = "Allows the mob to change its appearance"
	set category = "Admin"

	if(!check_rights(R_FUN)) return

	var/mob/living/carbon/human/H = input("Select mob.", "Change Mob Appearance - Self") as null|anything in human_mob_list
	if(!H) return

	if(!H.client)
		to_chat(usr, "Only mobs with clients can alter their own appearance.")
		return
	var/datum/gender/T = GLOB.gender_datums[H.get_visible_gender()]
	switch(alert("Do you wish for [H] to be allowed to select non-whitelisted races?","Alter Mob Appearance","Yes","No","Cancel"))
		if("Yes")
			log_and_message_admins("has allowed [H] to change [T.his] appearance, without whitelisting of races.")
			H.change_appearance(APPEARANCE_ALL, H.loc, check_species_whitelist = 0)
		if("No")
			log_and_message_admins("has allowed [H] to change [T.his] appearance, with whitelisting of races.")
			H.change_appearance(APPEARANCE_ALL, H.loc, check_species_whitelist = 1)
	feedback_add_details("admin_verb","CMAS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/change_security_level()
	set name = "Set security level"
	set desc = "Sets the station security level"
	set category = "Admin"

	if(!check_rights(R_ADMIN))	return
	var sec_level = input(usr, "It's currently code [get_security_level()].", "Select Security Level")  as null|anything in (list("green","blue", "yellow","violet","orange","red","delta")-get_security_level())
	if(alert("Switch from code [get_security_level()] to code [sec_level]?","Change security level?","Yes","No") == "Yes")
		set_security_level(sec_level)
		log_admin("[key_name(usr)] changed the security level to code [sec_level].")


//---- bs12 verbs ----

/client/proc/mod_panel()
	set name = "Moderator Panel"
	set category = "Admin"
/*	if(holder)
		holder.mod_panel()*/
//	feedback_add_details("admin_verb","MP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/editappear()
	set name = "Edit Appearance"
	set category = "Fun"

	if(!check_rights(R_FUN))	return

	var/mob/living/carbon/human/M = input("Select mob.", "Edit Appearance") as null|anything in human_mob_list

	if(!istype(M, /mob/living/carbon/human))
		to_chat(usr, "<font color='red'>You can only do this to humans!</font>")
		return
	switch(alert("Are you sure you wish to edit this mob's appearance? Skrell, Unathi, Tajaran can result in unintended consequences.",,"Yes","No"))
		if("No")
			return
	var/new_facial = input("Please select facial hair color.", "Character Generation") as color
	if(new_facial)
		M.r_facial = hex2num(copytext(new_facial, 2, 4))
		M.g_facial = hex2num(copytext(new_facial, 4, 6))
		M.b_facial = hex2num(copytext(new_facial, 6, 8))

	var/new_hair = input("Please select hair color.", "Character Generation") as color
	if(new_facial)
		M.r_hair = hex2num(copytext(new_hair, 2, 4))
		M.g_hair = hex2num(copytext(new_hair, 4, 6))
		M.b_hair = hex2num(copytext(new_hair, 6, 8))

	var/new_eyes = input("Please select eye color.", "Character Generation") as color
	if(new_eyes)
		M.r_eyes = hex2num(copytext(new_eyes, 2, 4))
		M.g_eyes = hex2num(copytext(new_eyes, 4, 6))
		M.b_eyes = hex2num(copytext(new_eyes, 6, 8))
		M.update_eyes()

	var/new_skin = input("Please select body color. This is for Tajaran, Unathi, and Skrell only!", "Character Generation") as color
	if(new_skin)
		M.r_skin = hex2num(copytext(new_skin, 2, 4))
		M.g_skin = hex2num(copytext(new_skin, 4, 6))
		M.b_skin = hex2num(copytext(new_skin, 6, 8))

	var/new_tone = input("Please select skin tone level: 1-220 (1=albino, 35=caucasian, 150=black, 220='very' black)", "Character Generation")  as text

	if (new_tone)
		M.s_tone = max(min(round(text2num(new_tone)), 220), 1)
		M.s_tone =  -M.s_tone + 35

	// hair
	var/new_hstyle = input(usr, "Select a hair style", "Grooming")  as null|anything in GLOB.legacy_hair_lookup
	if(new_hstyle)
		M.h_style = new_hstyle

	// facial hair
	var/new_fstyle = input(usr, "Select a facial hair style", "Grooming")  as null|anything in GLOB.legacy_facial_hair_lookup
	if(new_fstyle)
		M.f_style = new_fstyle

	var/new_gender = alert(usr, "Please select gender.", "Character Generation", "Male", "Female", "Neuter")
	if (new_gender)
		if(new_gender == "Male")
			M.gender = MALE
		else if (new_gender == "Female")
			M.gender = FEMALE
		else
			M.gender = NEUTER

	M.update_hair(FALSE)
	M.update_icons_body()
	M.check_dna(M)

/client/proc/playernotes()
	set name = "Show Player Info"
	set category = "Admin"
	if(holder)
		holder.PlayerNotes()
	return

/client/proc/free_slot()
	set name = "Free Job Slot"
	set category = "Admin"
	if(holder)
		var/list/jobs = list()
		for (var/datum/role/job/J in SSjob.occupations)
			if (J.current_positions >= J.total_positions && J.total_positions != -1)
				jobs += J.title
		if (!jobs.len)
			to_chat(usr, "There are no fully staffed jobs.")
			return
		var/job = input("Please select job slot to free", "Free job slot")  as null|anything in jobs
		if (job)
			SSjob.FreeRole(job)
			message_admins("A job slot for [job] has been opened by [key_name_admin(usr)]")
			return

/client/proc/toggleghostwriters()
	set name = "Toggle ghost writers"
	set category = "Server"
	if(!holder)	return
	if(config)
		if(config_legacy.cult_ghostwriter)
			config_legacy.cult_ghostwriter = 0
			to_chat(src, "<b>Disallowed ghost writers.</b>")
			message_admins("Admin [key_name_admin(usr)] has disabled ghost writers.", 1)
		else
			config_legacy.cult_ghostwriter = 1
			to_chat(src, "<b>Enabled ghost writers.</b>")
			message_admins("Admin [key_name_admin(usr)] has enabled ghost writers.", 1)

/client/proc/toggledrones()
	set name = "Toggle maintenance drones"
	set category = "Server"
	if(!holder)	return
	if(config)
		if(config_legacy.allow_drone_spawn)
			config_legacy.allow_drone_spawn = 0
			to_chat(src, "<b>Disallowed maint drones.</b>")
			message_admins("Admin [key_name_admin(usr)] has disabled maint drones.", 1)
		else
			config_legacy.allow_drone_spawn = 1
			to_chat(src, "<b>Enabled maint drones.</b>")
			message_admins("Admin [key_name_admin(usr)] has enabled maint drones.", 1)

/client/proc/man_up(mob/T as mob in GLOB.mob_list)
	set category = "Fun"
	set name = "Man Up"
	set desc = "Tells mob to man up and deal with it."
	set popup_menu = FALSE

	if(alert("Are you sure you want to tell them to man up?","Confirmation","Deal with it","No")=="No") return

	to_chat(T, "<span class='notice'><b><font size=3>Man up and deal with it.</font></b></span>")
	to_chat(T, "<span class='notice'>Move along.</span>")

	log_admin("[key_name(usr)] told [key_name(T)] to man up and deal with it.")
	message_admins("<font color=#4F49AF>[key_name_admin(usr)] told [key_name(T)] to man up and deal with it.</font>", 1)

/client/proc/global_man_up()
	set category = "Fun"
	set name = "Man Up Global"
	set desc = "Tells everyone to man up and deal with it."

	if(alert("Are you sure you want to tell the whole server up?","Confirmation","Deal with it","No")=="No") return

	for (var/mob/T as mob in GLOB.mob_list)
		to_chat(T, "<br><center><span class='notice'><b><font size=4>Man up.<br> Deal with it.</font></b><br>Move along.</span></center><br>")
		SEND_SOUND(T, sound('sound/voice/ManUp1.ogg'))

	log_admin("[key_name(usr)] told everyone to man up and deal with it.")
	message_admins("<font color=#4F49AF>[key_name_admin(usr)] told everyone to man up and deal with it.</font>", 1)

/client/proc/give_spell(mob/T as mob in GLOB.mob_list) // -- Urist
	set category = "Fun"
	set name = "Give Spell"
	set desc = "Gives a spell to a mob."
	var/spell/S = input("Choose the spell to give to that guy", "ABRAKADABRA") as null|anything in typesof(/spell)
	if(!S) return
	T.spell_list += new S
	feedback_add_details("admin_verb","GS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(T)] the spell [S].")
	message_admins("<font color=#4F49AF>[key_name_admin(usr)] gave [key_name(T)] the spell [S].</font>", 1)

/client/proc/toggle_AI_interact()
	set name = "Toggle Admin AI Interact"
	set category = "Admin"
	set desc = "Allows you to interact with most machines as an AI would as a ghost"

	AI_Interact = !AI_Interact
	if(mob && IsAdminGhost(mob))
		mob.silicon_privileges = AI_Interact ? ALL : NONE

	log_admin("[key_name(usr)] has [AI_Interact ? "activated" : "deactivated"] Admin AI Interact")
	message_admins("[key_name_admin(usr)] has [AI_Interact ? "activated" : "deactivated"] their AI interaction")

/client/proc/list_event_volunteers()
	set name = "List Event Volunteers"
	set category = "Admin"
	set desc = "See who has event role prefs enabled."

	var/list/dat = list()
	dat += "<center><b>Only in game players are shown, as these preferences are currently per-character-slot!</b></center><br>"
	var/list/client/eligible = GLOB.clients.Copy()
	for(var/i in eligible)
		var/client/C = i
		if(!C.initialized)
			eligible -= C
		if(!isliving(C.mob))
			eligible -= C
	for(var/role in GLOB.event_role_list)
		var/flag = GLOB.event_role_list[role]
		dat += "<div class='statusDisplay'><h1>[role]</h1><br>"
		for(var/i in eligible)
			var/client/C = i
			if(!(C.prefs?.be_event_role & flag))
				continue
			var/mob/M = C.mob
			dat += "[ADMIN_FULLMONTY(M)]<br>"
		dat += "</div><br>"

	var/datum/browser/popup = new(src, "event_volunteers", "Event Volunteers (In game)", 800, 1200)
	popup.set_content(dat.Join(""))
	popup.open()
