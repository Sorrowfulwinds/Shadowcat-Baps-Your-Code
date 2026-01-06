/**
 * Employment simulator roles. You work for a corporation and they pay you money.
 */
/datum/prototype/role/job
	/// Abstract type.
	abstract_type = /datum/prototype/role/job

	//? Intrinsics
	//! Dont forget id on children.
	//id = JobNtStationEngineer

	//? Economy
	/// starting money multiplier
	var/const/economy_payscale = ECONOMY_PAYSCALE_JOB_DEFAULT

	//? Unsorted
	/// Selection screen color
	var/const/selection_color = COLOR_WHITE
	/// List of departments this job belongs to, if any. The first one on the list will be the 'primary' department.
	var/const/list/departments = list()
	/// Used for sorting jobs so boss jobs go above regular ones, and their boss's boss is above that. Larger number = higher in sorting.
	var/const/sorting_order = 0

	/// Is this a management position?  If yes, list of departments managed.  Otherwise null.
	var/const/departments_managed = null
	/// Which department accounts should people with this position be given the pin for? Hint: should match departments_managed.
	var/const/department_accounts = null

	/// How young a character can be for this job
	var/const/minimum_character_age = 0
	/// Character age discrimination for roundstart job assignment lottery
	var/const/ideal_character_age = 30

	/// Should it show up on things like the ID computer?
	var/const/can_assign = TRUE
	// Allow joining as this job midround from off-duty position via going on-duty
	var/const/allow_jobhop = TRUE

/datum/prototype/role/job/get_access()
	. = ..()
	if(team == JOB_FACTION_STATION && CONFIG_GET(flag/almost_everyone_has_maintenance_access))
		. |= ACCESS_ENGINEERING_MAINT

/datum/prototype/role/job/VerifyPlayer(mob/player, datum/prototype/alt_title/alt_title, ignore_slots)
	. = ..()
	if(!.)
		return .
	var/datum/preferences/prefs = player.client.prefs

	if(prefs.age < minimum_character_age)
		return "Your character is too young; they must be at least [minimum_character_age] years old."
	if(!prefs.lore_faction_job_check(src))
		return "Your character is of the wrong faction."
	if(!prefs.character_species_job_check(src))
		return "This species is not allowed in this job."

	return .

/datum/prototype/role/job/proc/get_economic_payscale()
	var/datum/department/D = SSjob.get_primary_department_of_job(src)
	return economy_payscale * (istype(D)? D.economy_payscale : 1)

/**
 * TODO: Staying in SSrole until the banking system is coded.
 * Makes a bank acount for mob H.
 * @params
 * - H - mob/living/carbon/human
 * - faction - Placeholder value.
 */
/datum/prototype/role/job/proc/setup_bank_account(var/mob/living/carbon/human/H, faction = JOB_FACTION_STATION)
	if(H?.mind?.initial_account) //No double-dipping
		return

	// Give them an account in the station database
	var/money_amount = round(get_economic_payscale() * ECONOMY_PAYSCALE_BASE * ECONOMY_PAYSCALE_MULT * \
	H.mind.original_pref_economic_modifier + gaussian(ECONOMY_PAYSCALE_RANDOM_MEAN, ECONOMY_PAYSCALE_RANDOM_DEV))
	var/datum/money_account/M = create_account(H.real_name, money_amount, null, offmap_spawn)
	if(H.mind)
		var/remembered_info = ""
		remembered_info += "<b>Your account number is:</b> #[M.account_number]<br>"
		remembered_info += "<b>Your account pin is:</b> [M.remote_access_pin]<br>"
		remembered_info += "<b>Your account funds are:</b> $[M.money]<br>"

		if(M.transaction_log.len)
			var/datum/transaction/T = M.transaction_log[1]
			remembered_info += "<b>Your account was created:</b> [T.time], [T.date] at [T.source_terminal]<br>"
		H.mind.store_memory(remembered_info)

		H.mind.initial_account = M

	to_chat(H, "<span class='notice'><b>Your account number is: [M.account_number], your account pin is: [M.remote_access_pin]</b></span>")
