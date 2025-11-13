/**
 * Flags for displaying role info on the manifest
 * - IC is for ingame manifests for that roles faction.
 * - OOC is for out of game manifests like the main menu, dicord, and ghosts.
 * - Show Name will show only that character name is playing.
 * - Show Role will show only that someone is playing that role.
 * - No options will show only as "x Other Role".
 * - Hidden will not show up on the manifest at all in any way.
 */

#define MANIFEST_SHOW_ROLE_OOC	(1<<0)
#define MANIFEST_SHOW_ROLE_IC	(1<<1)
#define MANIFEST_SHOW_NAME_OOC	(1<<2)
#define MANIFEST_SHOW_NAME_IC	(1<<3)
#define MANIFEST_HIDDEN			(1<<4)
#define MANIFEST_SHOW_OOC 		(MANIFEST_SHOW_ROLE_OOC | MANIFEST_SHOW_NAME_OOC)
#define MANIFEST_SHOW_IC		(MANIFEST_SHOW_ROLE_IC  | MANIFEST_SHOW_NAME_IC)
#define MANIFEST_SHOW_ALL		(MANIFEST_SHOW_OOC | MANIFEST_SHOW_IC)
