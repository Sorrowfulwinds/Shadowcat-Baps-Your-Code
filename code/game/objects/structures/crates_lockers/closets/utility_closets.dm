/* Utility Closets
 * Contains:
 *		Emergency Closet
 *		Fire Closet
 *		Tool Closet
 *		Radiation Closet
 *		Bombsuit Closet
 *		Hydrant
 *		First Aid
 */

/*
 * Emergency Closet
 */
/obj/structure/closet/emcloset
	name = "emergency closet"
	desc = "It's a storage unit for emergency breathmasks and O2 tanks."
	closet_appearance = /singleton/closet_appearance/oxygen

/obj/structure/closet/emcloset/Initialize(mapload)
	switch (pickweight(list("small" = 55, "aid" = 25, "tank" = 10, "both" = 10)))
		if ("small")
			starts_with = alist(
				/obj/item/tank/emergency/oxygen = 2,
				/obj/item/clothing/mask/breath = 2,
				/obj/item/clothing/suit/space/emergency = 1,
				/obj/item/clothing/head/helmet/space/emergency = 1)
		if ("aid")
			starts_with = alist(
				/obj/item/tank/emergency/oxygen = 1,
				/obj/item/storage/toolbox/emergency = 1,
				/obj/item/clothing/mask/breath = 1,
				/obj/item/storage/firstaid/o2 = 1,
				/obj/item/clothing/suit/space/emergency = 1,
				/obj/item/clothing/head/helmet/space/emergency = 1)
		if ("tank")
			starts_with = alist(
				/obj/item/tank/emergency/oxygen/engi = 2,
				/obj/item/clothing/mask/breath = 2)
		if ("both")
			starts_with = alist(
				/obj/item/storage/toolbox/emergency = 1,
				/obj/item/tank/emergency/oxygen/engi = 1,
				/obj/item/clothing/mask/breath = 1,
				/obj/item/storage/firstaid/o2 = 1,
				/obj/item/clothing/suit/space/emergency = 2,
				/obj/item/clothing/head/helmet/space/emergency = 2)

	return ..()

/obj/structure/closet/emcloset/legacy
	starts_with = alist(
		/obj/item/tank/oxygen = 1,
		/obj/item/clothing/mask/gas = 1)

/*
 * Fire Closet
 */
/obj/structure/closet/firecloset
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	closet_appearance = /singleton/closet_appearance/oxygen/fire

	starts_with = alist(
		/obj/item/clothing/suit/fire/firefighter = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/tank/oxygen/red = 1,
		/obj/item/extinguisher = 1,
		/obj/item/clothing/head/hardhat/red = 1,
		/obj/item/storage/toolbox/emergency = 1,
		/obj/item/stack/medical/ointment = 1)

/obj/structure/closet/firecloset/full
	starts_with = alist(
		/obj/item/clothing/suit/fire/firefighter = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/flashlight = 1,
		/obj/item/tank/oxygen/red = 1,
		/obj/item/extinguisher = 1,
		/obj/item/clothing/head/hardhat/red = 1)

/obj/structure/closet/firecloset/full/double
	starts_with = alist(
		/obj/item/clothing/suit/fire/firefighter = 2,
		/obj/item/clothing/mask/gas = 2,
		/obj/item/flashlight = 2,
		/obj/item/tank/oxygen/red = 2,
		/obj/item/extinguisher = 2,
		/obj/item/clothing/head/hardhat/red = 2)

/*
 * Tool Closet
 */
/obj/structure/closet/toolcloset
	name = "tool closet"
	desc = "It's a storage unit for tools."
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering/tools

/obj/structure/closet/toolcloset/Initialize(mapload)
	starts_with = alist()
	if(prob(40))
		starts_with[/obj/item/clothing/suit/storage/hazardvest] = 1
	if(prob(70))
		starts_with[/obj/item/flashlight] = 1
	if(prob(70))
		starts_with[/obj/item/tool/screwdriver] = 1
	if(prob(70))
		starts_with[/obj/item/tool/wrench] = 1
	if(prob(70))
		starts_with[/obj/item/weldingtool] = 1
	if(prob(70))
		starts_with[/obj/item/tool/crowbar] = 1
	if(prob(70))
		starts_with[/obj/item/tool/wirecutters] = 1
	if(prob(70))
		starts_with[/obj/item/t_scanner] = 1
	if(prob(20))
		starts_with[/obj/item/storage/belt/utility] = 1
	if(prob(30))
		starts_with[/obj/item/stack/cable_coil/random] = 1
	if(prob(30))
		starts_with[/obj/item/stack/cable_coil/random] = 2
	if(prob(30))
		starts_with[/obj/item/stack/cable_coil/random] = 3
	if(prob(20))
		starts_with[/obj/item/multitool] = 1
	if(prob(5))
		starts_with[/obj/item/clothing/gloves/yellow] = 1
	if(prob(40))
		starts_with[/obj/item/clothing/head/hardhat] = 1
	if(prob(30))
		starts_with[/obj/item/reagent_containers/spray/windowsealant] = 1
	return ..()

/*
 * Radiation Closet
 */
/obj/structure/closet/radiation
	name = "radiation suit closet"
	desc = "It's a storage unit for rad-protective suits."
	closet_appearance = /singleton/closet_appearance/secure_closet/engineering/tools/radiation
	rad_flags = RAD_BLOCK_CONTENTS

	starts_with = alist(
		/obj/item/clothing/suit/radiation = 2,
		/obj/item/clothing/head/radiation = 2,
		/obj/item/geiger_counter = 2)

/*
 * Bombsuit closet
 */
/obj/structure/closet/bombcloset
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	closet_appearance = /singleton/closet_appearance/bomb

	starts_with = alist(
		/obj/item/clothing/suit/bomb_suit = 1,
		/obj/item/clothing/under/color/black = 1,
		/obj/item/clothing/shoes/black = 1,
		/obj/item/clothing/head/bomb_hood = 1)

/obj/structure/closet/bombcloset/double
	starts_with = alist(
		/obj/item/clothing/suit/bomb_suit = 2,
		/obj/item/clothing/under/color/black = 2,
		/obj/item/clothing/shoes/black = 2,
		/obj/item/clothing/head/bomb_hood = 2)

/obj/structure/closet/bombclosetsecurity
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	closet_appearance = /singleton/closet_appearance/bomb/security

	starts_with = alist(
		/obj/item/clothing/suit/bomb_suit/security = 1,
		/obj/item/clothing/under/rank/security = 1,
		/obj/item/clothing/shoes/brown = 1,
		/obj/item/clothing/head/bomb_hood/security = 1)

/*
 * Hydrant
 */
/obj/structure/closet/hydrant //wall mounted fire closet
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	closet_appearance = /singleton/closet_appearance/wall/emergency/fire
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER
	anchored = 1
	density = 0
	wall_mounted = 1

	starts_with = alist(
		/obj/item/clothing/suit/fire/firefighter = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/flashlight = 1,
		/obj/item/tank/oxygen/red = 1,
		/obj/item/extinguisher = 1,
		/obj/item/clothing/head/hardhat/red = 1,
		/obj/item/storage/toolbox/emergency = 1,
		/obj/item/stack/medical/ointment = 1)

/*
 * First Aid
 */
/obj/structure/closet/medical_wall //wall mounted medical closet
	name = "first-aid closet"
	desc = "It's wall-mounted storage unit for first aid supplies."
	closet_appearance = /singleton/closet_appearance/wall/medical
	anchored = 1
	density = 0
	wall_mounted = 1

