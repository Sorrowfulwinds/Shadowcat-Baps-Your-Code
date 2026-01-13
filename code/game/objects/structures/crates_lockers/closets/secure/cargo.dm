/obj/structure/closet/secure_closet/cargotech
	name = "cargo technician's locker"
	req_access = list(ACCESS_SUPPLY_BAY)
	closet_appearance = /singleton/closet_appearance/secure_closet/cargo

	starts_with = alist(
		/obj/item/clothing/under/rank/cargotech = 1,
		/obj/item/clothing/under/rank/cargotech/skirt = 1,
		/obj/item/clothing/under/rank/cargotech/skirt_pleated = 1,
		/obj/item/clothing/under/rank/cargotech/jeans = 1,
		/obj/item/clothing/under/rank/cargotech/jeans/female = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/cargo = 1,
		/obj/item/clothing/shoes/boots/winter/supply = 1,
		/obj/item/clothing/shoes/black = 1,
		/obj/item/radio/headset/headset_cargo = 1,
		/obj/item/radio/headset/headset_cargo/alt = 1,
		/obj/item/clothing/gloves/black = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/cargo = 1,
		/obj/item/clothing/gloves/fingerless = 1,
		/obj/item/stamp/cargo = 1,
		/obj/item/clothing/head/soft = 1)

/obj/structure/closet/secure_closet/cargotech/Initialize(mapload)
	if(prob(75))
		starts_with += /obj/item/storage/backpack
	else
		starts_with += /obj/item/storage/backpack/satchel/norm
	if(prob(25))
		starts_with += /obj/item/storage/backpack/dufflebag
	return ..()

/obj/structure/closet/secure_closet/quartermaster
	name = "quartermaster's locker"
	req_access = list(ACCESS_SUPPLY_QM)
	closet_appearance = /singleton/closet_appearance/secure_closet/cargo/qm

	starts_with = alist(
		/obj/item/clothing/under/rank/cargo = 1,
		/obj/item/clothing/under/rank/cargo/skirt = 1,
		/obj/item/clothing/under/rank/cargo/skirt_pleated = 1,
		/obj/item/clothing/under/rank/cargo/jeans = 1,
		/obj/item/clothing/under/rank/cargo/jeans/female = 1,
		/obj/item/clothing/shoes/brown = 1,
		/obj/item/radio/headset/headset_cargo = 1,
		/obj/item/radio/headset/headset_cargo/alt = 1,
		/obj/item/radio/headset/headset_mine = 1,
		/obj/item/clothing/gloves/black = 1,
		/obj/item/clothing/gloves/fingerless = 1,
		/obj/item/clothing/suit/fire/firefighter = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/qm = 1,
		/obj/item/tank/emergency/oxygen = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/clothing/glasses/meson = 1,
		/obj/item/clothing/head/soft = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/cargo = 1,
		/obj/item/clothing/shoes/boots/winter/supply = 1)

/obj/structure/closet/secure_closet/quartermaster/Initialize(mapload)
	if(prob(75))
		starts_with += /obj/item/storage/backpack
	else
		starts_with += /obj/item/storage/backpack/satchel/norm
	if(prob(25))
		starts_with += /obj/item/storage/backpack/dufflebag
	return ..()

/obj/structure/closet/secure_closet/miner
	name = "miner's equipment"
	closet_appearance = /singleton/closet_appearance/secure_closet/mining
	req_access = list(ACCESS_SUPPLY_MINE)

	starts_with = alist(
		/obj/item/radio/headset/headset_mine = 1,
		/obj/item/clothing/under/rank/miner = 1,
		/obj/item/clothing/gloves/black = 1,
		/obj/item/clothing/shoes/black = 1,
		/obj/item/atmos_analyzer = 1,
		/obj/item/storage/bag/ore = 1,
		/obj/item/flashlight/lantern = 1,
		/obj/item/shovel = 1,
		/obj/item/pickaxe = 1,
		/obj/item/mining_scanner = 1,
		/obj/item/gps/mining = 1,
		/obj/item/survivalcapsule = 1,
		/obj/item/clothing/glasses/meson = 1,
		/obj/item/clothing/suit/storage/hooded/miner = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/miner = 1,
		/obj/item/clothing/shoes/boots/winter/mining = 1,
		/obj/item/reagent_containers/portable_fuelcan/miniature = 1,
		/obj/item/stack/marker_beacon/thirty = 1,
		/obj/item/gun/projectile/energy/kinetic_accelerator = 1)

/obj/structure/closet/secure_closet/miner/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial
	else
		starts_with += /obj/item/storage/backpack/satchel/eng
	return ..()
