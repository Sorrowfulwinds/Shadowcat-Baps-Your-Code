/datum/prototype/role/job/cargo_tech
	//? Basic Info
	id = "JobNtCargoTech"
	title = "Cargo Technician"

	menu_blurb = "A Cargo Technician fills and delivers cargo orders. They are encouraged to return delivered crates to the Cargo Shuttle, because Central Command gives a partial refund."

	spawn_blurb = "You report to the Quartermaster and the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/cargo_technician

	minimal_access = list(
		ACCESS_ENGINEERING_MAINT,
		ACCESS_SUPPLY_BAY,
		ACCESS_SUPPLY_MULEBOT,
		ACCESS_SUPPLY_MAIN,
	)
	additional_access = list(
		ACCESS_SUPPLY_MINE,
		ACCESS_SUPPLY_MINE_OUTPOST,
	)

	selection_color =  "#7a4f33"
	departments = list(
		/datum/department/cargo::id,
	)
	sorting_order = 3
	alt_titles = list(
		/datum/prototype/alt_title/logi_spec::id,
	)

/datum/prototype/alt_title/logi_spec
	id = "AltCargoLogiSpec"
	parent_role = /datum/prototype/role/job/cargo_tech::id
	title = "Logistics Specialist"

/datum/outfit/job/station/cargo_technician
	name = OUTFIT_JOB_NAME("Cargo technician")
	uniform = /obj/item/clothing/under/rank/cargotech
	l_ear = /obj/item/radio/headset/headset_cargo
	id_type = /obj/item/card/id/cargo/cargo_tech
	pda_type = /obj/item/pda/cargo
