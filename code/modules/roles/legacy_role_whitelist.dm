/**
 * This should be replaced with something better than an ancient txt file stored somewhere. I think we have a DB solution for this or maybe some existing whitelist system.
 * Porting this in to hold onto it for now.
 * This needs to support granular whitelisting of roles vs ckey.
 */
#define WHITELISTFILE "data/whitelist.txt"

var/list/whitelist = list()

/legacy_hook/startup/proc/loadWhitelist()
	if(config_legacy.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	whitelist = world.file2list(WHITELISTFILE)
	if(!whitelist.len)	whitelist = null

/proc/check_whitelist(mob/M /*, var/rank*/)
	if(!whitelist)
		return 0
	return ("[M.ckey]" in whitelist)

#undef WHITELISTFILE
