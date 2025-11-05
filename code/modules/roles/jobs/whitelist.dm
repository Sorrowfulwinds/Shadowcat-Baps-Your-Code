/**
 * Legacy whitelist code for jobs. We don't use this currently but I'm not certain about ripping it all out right now.
 */

#define WHITELISTFILE "data/whitelist.txt"

var/list/whitelist = null

/legacy_hook/startup/proc/loadWhitelist()
	if(config_legacy.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	whitelist = world.file2list(WHITELISTFILE)
	if(!whitelist.len)
		whitelist = null

/proc/check_whitelist(mob/M /*, var/rank*/)
	if(!whitelist)
		return 0
	return ("[M.ckey]" in whitelist)

#undef WHITELISTFILE
