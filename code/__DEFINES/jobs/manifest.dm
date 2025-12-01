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
