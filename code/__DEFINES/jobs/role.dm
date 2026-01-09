/**
 * Flags for displaying role info on the manifest
 * - IC is for ingame manifests for that roles faction.
 * - OOC is for out of game manifests like the main menu, discord, and ghosts.
 *
 * - Hidden will not show up on the manifest at all in any way.
 * - Show Anonymous will show up as part of "x Others".
 *
 * - Show Name will show only that character name is playing.
 * - Show Role will show only that someone is playing that role.
 */
#define MANIFEST_SHOW_ROLE_OOC			(1<<0)
#define MANIFEST_SHOW_ROLE_IC			(1<<1)
#define MANIFEST_SHOW_NAME_OOC			(1<<2)
#define MANIFEST_SHOW_NAME_IC			(1<<3)

#define MANIFEST_SHOW_ANONYMOUS_OOC		(1<<4)
#define MANIFEST_SHOW_ANONYMOUS_IC		(1<<5)
#define MANIFEST_HIDDEN					(1<<6)
#define MANIFEST_SHOW_OOC 		(MANIFEST_SHOW_ROLE_OOC | MANIFEST_SHOW_NAME_OOC)
#define MANIFEST_SHOW_IC		(MANIFEST_SHOW_ROLE_IC  | MANIFEST_SHOW_NAME_IC)
#define MANIFEST_SHOW_ALL		(MANIFEST_SHOW_OOC | MANIFEST_SHOW_IC)

/**
 * Flags for when a role can be joined
 * None of these is a valid option.
 */
#define JOB_ROUNDSTART		(1<<0)
#define JOB_LATEJOIN		(1<<1)

/**
 * Flags for when a role should be assigned roundstart
 * PRE_ASSIGNMENT - Major capturing roles that need to go before others. Nukies, Wizards, Etc.
 * DURING_ASSIGNMENT - Normal role picking, station jobs, civilians, etc.
 * POST_ASSIGNMENT - Modifying roles that need to go after others. Traitors, Lings, Cultists
 * NO_ASSIGNMENT - SSroles does not try to assign this role at roundstart.
 */
#define SSR_PRE_ASSIGNMENT 		(1<<0)
#define SSR_DURING_ASSIGNMENT 	(1<<1)
#define SSR_POST_ASSIGNMENT 	(1<<2)
#define SSR_NO_ASSIGNMENT		(1<<3)

/**
 * To be overhauled post SSrole's and replaced with SSteams.
 * This is tied into the Spawners subsystem and replacing it is another big PR.
 * You may add more
 *
 * Used for setting the faction of a role/spawner for checking valid spawn points.
 */
/// primary station's job faction
#define JOB_FACTION_STATION			"Station"
/// tradeport job faction
#define JOB_FACTION_TRADEPORT		"Tradeport"

/**
 * Used by alt-title's to set if their uniform var is culmulative or replacing.
 */
#define SSR_UNIFORM_REPLACE (1<<0)
#define SSR_UNIFORM_ADDON	(1<<1)
