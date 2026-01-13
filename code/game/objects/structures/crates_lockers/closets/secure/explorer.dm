//SC Exploration Secure Closets Port
/obj/structure/closet/secure_closet/explorer
	name = "explorer locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/expedition
	req_access = list(ACCESS_GENERAL_EXPLORER)

	starts_with = alist(
		/obj/item/clothing/under/explorer = 1,
		/obj/item/clothing/suit/storage/hooded/explorer = 1,
		/obj/item/clothing/mask/gas/explorer = 1,
		/obj/item/clothing/shoes/boots/winter/explorer = 1,
		/obj/item/clothing/gloves/black = 1,
		/obj/item/gun/projectile/energy/frontier/locked/holdout = 1,
		/obj/item/radio/headset/explorer = 1,
		/obj/item/clothing/accessory/armor/helmetcamera/exploration/body = 1,
		/obj/item/flashlight = 1,
		/obj/item/gps/explorer = 1,
		/obj/item/storage/box/flare = 1,
		/obj/item/geiger_counter = 1,
		/obj/item/cell/basic/tier_2/small = 1,
		/obj/item/cell/basic/tier_2/weapon = 1,
		/obj/item/radio = 1,
		/obj/item/stack/marker_beacon/thirty = 1,
		/obj/item/storage/box/survival_knife = 1,
		/obj/item/material/knife/machete = 1,
		/obj/item/clothing/accessory/holster/machete = 1,
		/obj/item/reagent_containers/food/snacks/liquid = 1,
		/obj/item/reagent_containers/food/snacks/liquid/protein = 1,
		/obj/item/cataloguer = 1,
		/obj/item/binoculars = 1)

/obj/structure/closet/secure_closet/explorer/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack
	else
		starts_with += /obj/item/storage/backpack/satchel/norm
	return ..()

//SC Misc_vr locker.
/obj/structure/closet/secure_closet/sar
	name = "field medic locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/expedition/medic
	starts_with = alist(
		/obj/item/storage/backpack/dufflebag/emt = 1,
		/obj/item/storage/box/autoinjectors = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/clothing/accessory/armor/helmetcamera/exploration/body = 1,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 1,
		/obj/item/reagent_containers/glass/bottle/antitoxin = 1,
		/obj/item/storage/belt/medical/emt = 1,
		/obj/item/storage/box/survival_knife = 1,
		/obj/item/gun/projectile/energy/frontier/locked/holdout = 1,
		/obj/item/clothing/mask/gas/explorer = 1,
		/obj/item/clothing/suit/storage/hooded/explorer/medic = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar = 1,
		/obj/item/clothing/shoes/boots/winter/explorer = 1,
		/obj/item/radio/headset/sar = 1,
		/obj/item/cartridge/medical = 1,
		/obj/item/material/knife/machete = 1,
		/obj/item/clothing/accessory/holster/machete = 1,
		/obj/item/flashlight = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/healthanalyzer = 1,
		/obj/item/radio/off = 1,
		/obj/random/medical = 1,
		/obj/item/reagent_containers/food/snacks/liquid = 2,
		/obj/item/reagent_containers/food/snacks/liquid/protein = 2,
		/obj/item/tool/crowbar = 1,
		/obj/item/extinguisher/mini = 1,
		/obj/item/storage/box/freezer = 1,
		/obj/item/clothing/accessory/storage/white_vest = 1,
		/obj/item/barrier_tape_roll/medical = 1,
		/obj/item/gps/medical = 1,
		/obj/item/geiger_counter = 1,
		/obj/item/bodybag/cryobag = 1,
		/obj/item/cataloguer/compact = 1,
		/obj/item/binoculars = 1,
		/obj/item/gun/projectile/ballistic/shotgun/flare/paramed = 1,
		/obj/item/storage/box/flashshells/large = 1)

//Pilot Locker
/obj/structure/closet/secure_closet/pilot
	name = "pilot locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/pilot
	req_access = list(ACCESS_GENERAL_PILOT)
	starts_with = alist(
		/obj/item/storage/backpack/parachute = 1,
		/obj/item/storage/box/survival_knife = 1,
		/obj/item/gun/projectile/energy/frontier/locked/holdout = 1,
		/obj/item/clothing/head/pilot = 1,
		/obj/item/clothing/accessory/armor/helmetcamera/exploration = 1,
		/obj/item/clothing/accessory/armor/helmetcamera/exploration/body = 1,
		/obj/item/clothing/under/rank/pilot1 = 1,
		/obj/item/clothing/suit/storage/toggle/bomber/pilot = 1,
		/obj/item/clothing/shoes/boots/winter/explorer = 1,
		/obj/item/clothing/mask/gas/half = 1,
		/obj/item/clothing/shoes/black = 1,
		/obj/item/clothing/gloves/fingerless = 1,
		/obj/item/radio/headset/pilot/alt = 1,
		/obj/item/flashlight = 1,
		/obj/item/reagent_containers/food/snacks/liquid = 1,
		/obj/item/reagent_containers/food/snacks/liquid/protein = 1,
		/obj/item/reagent_containers/food/drinks/cans/waterbottle = 1,
		/obj/item/storage/box/flare = 1,
		/obj/item/gun/projectile/ballistic/shotgun/flare/explo = 1,
		/obj/item/storage/box/flashshells = 1,
		/obj/item/cell/basic/tier_2/small = 1,
		/obj/item/cell/basic/tier_2/weapon = 1,
		/obj/item/radio = 1,
		/obj/item/gps/explorer = 1,
		/obj/item/cataloguer/compact = 1,
		/obj/item/binoculars = 1)

/obj/structure/closet/secure_closet/pilot/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack
	else
		starts_with += /obj/item/storage/backpack/satchel/norm
	return ..()

//Pathfinder
/obj/structure/closet/secure_closet/pathfinder
	name = "pathfinder locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/expedition/pathfinder
	req_access = list(ACCESS_GENERAL_GATEWAY)

	starts_with = alist(
		/obj/item/clothing/under/explorer = 1,
		/obj/item/clothing/suit/storage/hooded/explorer = 1,
		/obj/item/clothing/mask/gas/explorer = 1,
		/obj/item/clothing/shoes/boots/winter/explorer = 1,
		/obj/item/clothing/gloves/black = 1,
		/obj/item/radio/headset/pathfinder = 1,
		/obj/item/radio/headset/pathfinder/alt = 1,
		/obj/item/clothing/accessory/armor/helmetcamera/exploration = 1,
		/obj/item/clothing/accessory/armor/helmetcamera/exploration/body = 1,
		/obj/item/flashlight = 1,
		/obj/item/gps/explorer = 1,
		/obj/item/storage/belt/explorer = 1,
		/obj/item/storage/box/flare = 1,
		/obj/item/storage/box/explorerkeys = 1,
		/obj/item/geiger_counter = 1,
		/obj/item/cell/basic/tier_2/small = 1,
		/obj/item/cell/basic/tier_2/weapon = 1,
		/obj/item/radio = 1,
		/obj/item/stack/marker_beacon/thirty = 1,
		/obj/item/storage/box/survival_knife = 1,
		/obj/item/material/knife/machete/deluxe = 1,
		/obj/item/gun/projectile/energy/frontier/locked/carbine = 1,
		/obj/item/gun/projectile/ballistic/ntles/pathfinder = 1,
		/obj/item/ammo_magazine/a5_7mm/nt_les = 2,
		/obj/item/clothing/accessory/holster/machete = 1,
		/obj/item/clothing/accessory/holster/leg = 1,
		/obj/item/reagent_containers/food/snacks/liquid = 1,
		/obj/item/reagent_containers/food/snacks/liquid/protein = 1,
		/obj/item/point_redemption_voucher/preloaded/survey/c300 = 1,
		/obj/item/cataloguer/compact/pathfinder = 1,
		/obj/item/binoculars = 1)

/obj/structure/closet/secure_closet/pathfinder/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack
	else
		starts_with += /obj/item/storage/backpack/satchel/norm
	return ..()
