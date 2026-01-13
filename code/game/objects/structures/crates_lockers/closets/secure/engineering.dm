/obj/structure/closet/secure_closet/engineering_chief
	name = "chief engineer's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering/ce
	req_access = list(ACCESS_ENGINEERING_CE)

	starts_with = alist(
		/obj/item/clothing/shoes/magboots/advanced = 1,
		/obj/item/clothing/accessory/storage/brown_vest = 1,
		/obj/item/blueprints = 1,
		/obj/item/clothing/under/rank/chief_engineer = 1,
		/obj/item/clothing/under/rank/chief_engineer/skirt = 1,
		/obj/item/clothing/under/rank/chief_engineer/skirt_pleated = 1,
		/obj/item/clothing/head/hardhat/white = 1,
		/obj/item/clothing/head/welding = 1,
		/obj/item/clothing/gloves/yellow = 1,
		/obj/item/clothing/shoes/brown = 1,
		/obj/item/cartridge/ce = 1,
		/obj/item/radio/headset/heads/ce = 1,
		/obj/item/radio/headset/heads/ce/alt = 1,
		/obj/item/storage/toolbox/mechanical = 1,
		/obj/item/clothing/suit/storage/hazardvest = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/multitool = 1,
		/obj/item/storage/belt/utility/chief/full = 1,
		/obj/item/flash = 1,
		/obj/item/t_scanner/upgraded = 1,
		/obj/item/barrier_tape_roll/engineering = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/ce = 1,
		/obj/item/clothing/shoes/boots/winter/engineering = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/gps/engineering/ce = 1,
		/obj/item/reagent_containers/spray/windowsealant = 1,
		/obj/item/pipe_dispenser = 1,
		/obj/item/shield_diffuser = 1,
		/obj/item/switchtool/holo/CE = 1,
		/obj/item/clothing/accessory/poncho/roles/cloak/ce = 1,
		)

/obj/structure/closet/secure_closet/engineering_chief/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial
	else
		starts_with += /obj/item/storage/backpack/satchel/eng
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/eng
	return ..()

/obj/structure/closet/secure_closet/engineering_electrical
	name = "electrical supplies"
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering/electrical
	req_access = list(ACCESS_ENGINEERING_ENGINE)

	starts_with = alist(
		/obj/item/clothing/gloves/yellow = 2,
		/obj/item/storage/toolbox/electrical = 3,
		/obj/item/module/power_control = 3,
		/obj/item/multitool = 3,
		/obj/item/inducer = 1,
		/obj/item/lightreplacer = 1)


/obj/structure/closet/secure_closet/engineering_welding
	name = "welding supplies"
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering/welding
	req_access = list(ACCESS_ENGINEERING_CONSTRUCTION)

	starts_with = alist(
		/obj/item/clothing/head/welding = 3,
		/obj/item/weldingtool/largetank = 3,
		/obj/item/weldpack = 3,
		/obj/item/clothing/glasses/welding = 3)

/obj/structure/closet/secure_closet/engineering_personal
	name = "engineer's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering
	req_access = list(ACCESS_ENGINEERING_ENGINE)

	starts_with = alist(
		/obj/item/clothing/accessory/storage/brown_vest = 1,
		/obj/item/storage/toolbox/mechanical = 1,
		/obj/item/radio/headset/headset_eng = 1,
		/obj/item/radio/headset/headset_eng/alt = 1,
		/obj/item/clothing/suit/storage/hazardvest = 1,
		/obj/item/clothing/under/bodysuit/bodysuithazard = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/clothing/glasses/meson = 1,
		/obj/item/cartridge/engineering = 1,
		/obj/item/barrier_tape_roll/engineering = 1,
		/obj/item/clothing/head/hardhat = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering = 1,
		/obj/item/clothing/shoes/boots/winter/engineering = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/gps/engineering = 1,
		/obj/item/reagent_containers/spray/windowsealant = 1,
		/obj/item/shield_diffuser = 1,
		)

/obj/structure/closet/secure_closet/engineering_personal/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial
	else
		starts_with += /obj/item/storage/backpack/satchel/eng
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/eng
	return ..()


/obj/structure/closet/secure_closet/atmos_personal
	name = "technician's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering/atmos
	req_access = list(ACCESS_ENGINEERING_ATMOS)

	starts_with = alist(
		/obj/item/clothing/accessory/storage/brown_vest = 1,
		/obj/item/clothing/suit/fire/firefighter = 1,
		/obj/item/clothing/head/hardhat/red = 1,
		/obj/item/flashlight = 1,
		/obj/item/extinguisher = 1,
		/obj/item/radio/headset/headset_eng = 1,
		/obj/item/radio/headset/headset_eng/alt = 1,
		/obj/item/clothing/suit/storage/hazardvest = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/cartridge/atmos = 1,
		/obj/item/barrier_tape_roll/atmos = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos = 1,
		/obj/item/clothing/shoes/boots/winter/atmos = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/gps/engineering/atmos = 1,
		/obj/item/pipe_dispenser = 1,
		/obj/item/shield_diffuser = 1,
		)

/obj/structure/closet/secure_closet/atmos_personal/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial
	else
		starts_with += /obj/item/storage/backpack/satchel/eng
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/eng
	return ..()

/obj/structure/closet/secure_closet/senior_engineer
	name = "Senior engineer's locker"
	desc = "It looks like it has been stuffed to the brim with Space OSHA violation notices."
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering/senior
	req_access = list(ACCESS_ENGINEERING_ENGINE)

	starts_with = alist(
		/obj/item/clothing/accessory/storage/brown_vest = 1,
		/obj/item/storage/toolbox/mechanical = 1,
		/obj/item/radio/headset/headset_eng = 1,
		/obj/item/radio/headset/headset_eng/alt = 1,
		/obj/item/clothing/suit/storage/hazardvest = 1,
		/obj/item/clothing/under/bodysuit/bodysuithazard = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/clothing/glasses/meson = 1,
		/obj/item/cartridge/engineering = 1,
		/obj/item/barrier_tape_roll/engineering = 1,
		/obj/item/clothing/head/hardhat = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering = 1,
		/obj/item/clothing/shoes/boots/winter/engineering = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/gps/engineering = 1,
		/obj/item/reagent_containers/spray/windowsealant = 1,
		/obj/item/shield_diffuser = 1,
		/obj/item/clothing/suit/fire/firefighter = 1,
		/obj/item/clothing/head/hardhat/red = 1,
		/obj/item/flashlight = 1,
		/obj/item/extinguisher = 1,
		/obj/item/cartridge/atmos = 1,
		/obj/item/barrier_tape_roll/atmos = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos = 1,
		/obj/item/clothing/shoes/boots/winter/atmos = 1,
		/obj/item/gps/engineering/atmos = 1,
		/obj/item/pipe_dispenser = 1,
		)
