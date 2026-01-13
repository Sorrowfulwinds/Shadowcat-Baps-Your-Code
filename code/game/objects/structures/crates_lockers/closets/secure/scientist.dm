/obj/structure/closet/secure_closet/scientist
	name = "scientist's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/scientst
	req_access = list(ACCESS_SCIENCE_TOXINS)

	starts_with = alist(
		/obj/item/clothing/under/rank/scientist = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat = 1,
		/obj/item/clothing/shoes/white = 1,
		/obj/item/radio/headset/headset_sci = 1,
		/obj/item/tank/air = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/science = 1,
		/obj/item/gps/science = 1,
		/obj/item/clothing/shoes/boots/winter/science = 1)

/obj/structure/closet/secure_closet/scientist/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/sci
	else
		starts_with += /obj/item/storage/backpack/toxins
	return ..()

/obj/structure/closet/secure_closet/robotics
	name = "roboticist's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/scientst
	req_access = list(ACCESS_SCIENCE_ROBOTICS)

	starts_with = alist(
		/obj/item/clothing/glasses/welding = 2,
		/obj/item/clothing/glasses/omnihud/rnd = 2,
		/obj/item/storage/belt/utility/full = 2,
		/obj/item/clothing/mask/bandana/red = 1,
		/obj/item/clothing/mask/bandana/skull = 1,
		/obj/item/clothing/gloves/fingerless = 2,
		/obj/item/radio/headset/headset_sci = 2,
		/obj/item/clothing/under/rank/roboticist = 2,
		/obj/item/storage/toolbox/mechanical = 1,
		/obj/item/storage/toolbox/electrical = 1,
		/obj/item/gps/science = 1)

/obj/structure/closet/secure_closet/RD
	name = "research director's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/rd
	req_access = list(ACCESS_SCIENCE_RD)

	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/scientist = 1,
		/obj/item/clothing/head/bio_hood/scientist = 1,
		/obj/item/clothing/under/rank/research_director = 1,
		/obj/item/clothing/under/rank/research_director/rdalt = 1,
		/obj/item/clothing/under/rank/research_director/skirt_pleated = 1,
		/obj/item/clothing/under/rank/research_director/skirt_pleated/turtleneck = 1,
		/obj/item/clothing/under/rank/research_director/skirt_pleated/whimsical = 1,
		/obj/item/clothing/under/rank/research_director/dress_rd = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat = 1,
		/obj/item/cartridge/rd = 1,
		/obj/item/clothing/shoes/white = 1,
		/obj/item/clothing/shoes/laceup/brown = 1,
		/obj/item/clothing/gloves/sterile/latex = 1,
		/obj/item/radio/headset/heads/rd = 1,
		/obj/item/radio/headset/heads/rd/alt = 1,
		/obj/item/tank/air = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/flash = 1,
		/obj/item/storage/box/firingpins = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/science = 1,
		/obj/item/clothing/shoes/boots/winter/science = 1,
		/obj/item/gps/science/rd = 1,
		/obj/item/bluespace_harpoon = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat/rd = 1,
		/obj/item/clothing/under/rank/research_director/turtleneck = 1)
