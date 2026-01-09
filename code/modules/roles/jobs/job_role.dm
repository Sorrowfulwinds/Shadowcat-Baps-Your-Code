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
	if(departments[1])
		return economy_payscale * all_departments[departments[1]]
	return economy_payscale

/**
 * TODO: Staying in SSrole until the banking system is coded. Silicons pls
 * Makes a bank acount for mob H.
 * @params
 * - H - mob/living/carbon/human
 * - faction - (Optional) Placeholder value.
 */
/datum/prototype/role/job/proc/setup_bank_account(var/mob/living/carbon/human/H, faction = JOB_FACTION_STATION)
	if(H?.mind?.initial_account)
		return

	var/money_amount = round(
		get_economic_payscale() *
		ECONOMY_PAYSCALE_BASE *
		ECONOMY_PAYSCALE_MULT *
		H.mind.original_pref_economic_modifier +
		gaussian(ECONOMY_PAYSCALE_RANDOM_MEAN, ECONOMY_PAYSCALE_RANDOM_DEV)
		)

	var/datum/money_account/M = create_account(H.real_name, money_amount, null)

	var/remembered_info = "<b>Your account number is:</b> #[M.account_number]<br> \
							<b>Your account pin is:</b> [M.remote_access_pin]<br> \
							<b>Your account funds are:</b> $[M.money]<br>"

	if(M.transaction_log.len)
		var/datum/transaction/T = M.transaction_log[1]
		remembered_info += "<b>Your account was created:</b> [T.time], [T.date] at [T.source_terminal]<br>"
	H.mind.store_memory(remembered_info)

	H.mind.initial_account = M

	to_chat(H, "<span class='notice'><b>Your account number is: [M.account_number], your account pin is: [M.remote_access_pin], you have $[M.money].</b></span>")

/**
 * Tell H all the department accounts they manage and their info.
 * @params
 * - H - A carbon/human with a mind
 * - faction - (optional) placeholder value
 */
/datum/prototype/role/job/proc/setup_managed_accounts(var/mob/living/carbon/human/H, faction = JOB_FACTION_STATION)
	if(department_accounts)
		var/remembered_info = ""
		for(var/D in department_accounts)
			var/datum/money_account/d_a = GLOB.department_accounts[D]
			remembered_info += "<b>[d_a.owner_name] number:</b> #[d_a.account_number]<br>"
			remembered_info += "<b>[d_a.owner_name] pin:</b> [d_a.remote_access_pin]<br>"
			remembered_info += "<b>[d_a.owner_name] funds:</b> $[d_a.money]<br>"

		if(remembered_info)
			H.mind.store_memory(remembered_info)

/**
 * TODO: This should be a generic proc in the email system. Silicons pls
 * Set up an NT email for H.
 * @params
 * - H - A carbon/human to set up an email for.
 */
/datum/prototype/role/job/proc/email_setup(var/mob/living/carbon/human/H)
	var/domain = "freemail.nt"
	if((LEGACY_MAP_DATUM) && LAZYLEN((LEGACY_MAP_DATUM).usable_email_tlds))
		domain = (LEGACY_MAP_DATUM).usable_email_tlds[1]

	var/sanitized_name = sanitize(replacetext(replacetext(lowertext(H.real_name), " ", "."), "'", ""))
	var/complete_login = "[sanitized_name]@[domain]"

	//Try making a unique login up to 10 times.
	var/fail_out = 0
	while(ntnet_global.does_email_exist(complete_login) && (fail_out < 10))
		complete_login = "[sanitized_name][random_id(/datum/computer_file/data/email_account/, 100, 999)]@[domain]"

	// If login generation failed they dont get an email.
	if(ntnet_global.does_email_exist(complete_login))
		to_chat(H, "You were not assigned an email address.")
		H.mind.store_memory("You were not assigned an email address.")
	else
		var/datum/computer_file/data/email_account/EA = new/datum/computer_file/data/email_account()
		EA.password = GenerateKey()
		EA.login = 	complete_login
		to_chat(H, "Your email account address is <b>[EA.login]</b> and the password is <b>[EA.password]</b>. This information has also been placed into your notes.")
		H.mind.store_memory("Your email account address is [EA.login] and the password is [EA.password].")
	// END EMAIL GENERATION
