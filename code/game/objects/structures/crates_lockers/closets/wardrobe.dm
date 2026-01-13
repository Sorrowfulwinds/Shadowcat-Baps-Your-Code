/obj/structure/closet/wardrobe
	name = "wardrobe"
	desc = "It's a storage unit for standard-issue attire."
	icon_state = "blue"
	icon_closed = "blue"

/obj/structure/closet/wardrobe/red
	name = "security wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/red

	starts_with = alist(
		/obj/item/clothing/under/rank/security = 3,
		/obj/item/clothing/under/rank/security/skirt_pleated = 2,
		/obj/item/clothing/under/rank/security2 = 3,
		/obj/item/clothing/under/rank/security/turtleneck = 3,
		/obj/item/clothing/under/rank/security/skirt = 2,
		/obj/item/clothing/shoes/boots/jackboots = 3,
		/obj/item/clothing/head/soft/sec = 3,
		/obj/item/clothing/head/beret/sec = 3,
		/obj/item/clothing/head/beret/sec/corporate/officer = 3,
		/obj/item/clothing/mask/bandana/red = 3,
		/obj/item/clothing/suit/storage/hooded/wintercoat/security = 3,
		/obj/item/clothing/accessory/armband = 3,
		/obj/item/clothing/accessory/holster/waist = 3)

/obj/structure/closet/wardrobe/red/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/security
	else
		starts_with += /obj/item/storage/backpack/satchel/sec
	if(prob(50))
		starts_with += /obj/item/storage/backpack/security
	else
		starts_with += /obj/item/storage/backpack/satchel/sec
	if(prob(50))
		starts_with += /obj/item/storage/backpack/security
	else
		starts_with += /obj/item/storage/backpack/satchel/sec

	return ..()

/obj/structure/closet/wardrobe/detective
	name = "detective wardrobe"
	closet_appearance = /singleton/closet_appearance/cabinet

	starts_with = alist(
		/obj/item/clothing/head/det = 2,
		/obj/item/clothing/head/det/grey = 2,
		/obj/item/clothing/shoes/brown = 2,
		/obj/item/clothing/shoes/laceup = 2,
		/obj/item/clothing/under/det = 2,
		/obj/item/clothing/under/det/waistcoat = 2,
		/obj/item/clothing/under/det/grey = 2,
		/obj/item/clothing/under/det/grey/skirt_pleated = 2,
		/obj/item/clothing/under/det/grey/waistcoat = 2,
		/obj/item/clothing/under/det/black = 2,
		/obj/item/clothing/under/det/skirt = 1,
		/obj/item/clothing/under/det/corporate = 2,
		/obj/item/clothing/suit/storage/det_trench = 2,
		/obj/item/clothing/suit/storage/det_trench/grey = 2,
		/obj/item/clothing/suit/storage/forensics/blue = 2,
		/obj/item/clothing/suit/storage/forensics/red = 2)

/obj/structure/closet/wardrobe/pink
	name = "pink wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/pink

	starts_with = alist(
		/obj/item/clothing/under/color/pink = 3,
		/obj/item/clothing/under/color/pink_skirt = 3,
		/obj/item/clothing/shoes/brown = 3)

/obj/structure/closet/wardrobe/black
	name = "black wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/black

	starts_with = alist(
		/obj/item/clothing/under/color/black = 3,
		/obj/item/clothing/under/color/black_skirt = 3,
		/obj/item/clothing/shoes/black = 3,
		/obj/item/clothing/head/that = 3,
		/obj/item/clothing/head/soft/black = 3,
		/obj/item/clothing/mask/bandana = 3,
		/obj/item/storage/backpack/messenger/black = 1)


/obj/structure/closet/wardrobe/chaplain_black
	name = "chapel wardrobe"
	desc = "It's a storage unit for approved religious attire."
	closet_appearance = /singleton/closet_appearance/wardrobe/black

	starts_with = alist(
		/obj/item/clothing/under/rank/chaplain = 1,
		/obj/item/clothing/under/rank/chaplain/skirt_pleated = 1,
		/obj/item/clothing/suit/storage/hooded/techpriest = 1,
		/obj/item/clothing/shoes/black = 1,
		/obj/item/clothing/suit/nun = 1,
		/obj/item/clothing/head/nun_hood = 1,
		/obj/item/clothing/suit/storage/hooded/chaplain_hoodie = 1,
		/obj/item/clothing/suit/storage/hooded/chaplain_hoodie/whiteout = 1,
		/obj/item/clothing/suit/holidaypriest = 1,
		/obj/item/clothing/under/wedding/bride_white = 1,
		/obj/item/storage/backpack/cultpack = 1,
		/obj/item/storage/fancy/candle_box = 2,
		/obj/item/storage/fancy/whitecandle_box = 1,
		/obj/item/storage/fancy/blackcandle_box = 1,
		/obj/item/clothing/accessory/permit/chaplain = 1,
		/obj/item/clothing/accessory/holster/holy = 1,
		/obj/item/storage/fancy/chalk = 1,
		/obj/item/godfig = 2,
		/obj/item/deck/tarot = 1)


/obj/structure/closet/wardrobe/green
	name = "green wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/green

	starts_with = alist(
		/obj/item/clothing/under/color/green = 3,
		/obj/item/clothing/under/color/lgreen_skirt = 3,
		/obj/item/clothing/under/color/green_skirt = 3,
		/obj/item/clothing/shoes/green = 3,
		/obj/item/clothing/head/soft/green = 3,
		/obj/item/clothing/mask/bandana/green = 3)

/obj/structure/closet/wardrobe/xenos
	name = "xenos wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/green

	starts_with = alist(
		/obj/item/clothing/suit/unathi/mantle = 1,
		/obj/item/clothing/suit/unathi/robe = 1,
		/obj/item/clothing/shoes/sandal = 2,
		/obj/item/clothing/shoes/footwraps = 2,
		/obj/item/clothing/shoes/boots/winter = 2,
		/obj/item/clothing/suit/storage/hooded/wintercoat = 2)


/obj/structure/closet/wardrobe/orange
	name = "prison wardrobe"
	desc = "It's a storage unit for regulation prisoner attire."
	closet_appearance = /singleton/closet_appearance/wardrobe/orange

	starts_with = alist(
		/obj/item/clothing/under/color/prison = 3,
		/obj/item/clothing/under/color/prison/skirt = 3,
		/obj/item/clothing/shoes/orange = 3)


/obj/structure/closet/wardrobe/yellow
	name = "yellow wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/yellow

	starts_with = alist(
		/obj/item/clothing/under/color/orange_skirt =3,
		/obj/item/clothing/under/color/yellow = 3,
		/obj/item/clothing/under/color/yellow_skirt = 3,
		/obj/item/clothing/shoes/yellow = 3,
		/obj/item/clothing/head/soft/yellow = 3,
		/obj/item/clothing/mask/bandana/gold = 3)


/obj/structure/closet/wardrobe/atmospherics_yellow
	name = "atmospherics wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/yellow

	starts_with = alist(
		/obj/item/clothing/under/rank/atmospheric_technician = 3,
		/obj/item/clothing/under/rank/atmospheric_technician/skirt = 3,
		/obj/item/clothing/under/rank/atmospheric_technician/skirt_pleated = 3,
		/obj/item/clothing/shoes/black = 3,
		/obj/item/clothing/head/hardhat/red = 3,
		/obj/item/clothing/head/beret/engineering = 3,
		/obj/item/clothing/mask/bandana/gold = 3,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos = 3,
		/obj/item/clothing/shoes/boots/winter/atmos = 3)

/obj/structure/closet/wardrobe/engineering_yellow
	name = "engineering wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/yellow

	starts_with = alist(
		/obj/item/clothing/under/rank/engineer = 3,
		/obj/item/clothing/under/rank/engineer/skirt = 3,
		/obj/item/clothing/under/rank/engineer/skirt_pleated = 3,
		/obj/item/clothing/under/rank/engineer/turtleneck = 3,
		/obj/item/clothing/shoes/orange = 3,
		/obj/item/clothing/head/hardhat = 3,
		/obj/item/clothing/head/beret/engineering = 3,
		/obj/item/clothing/mask/bandana/gold = 3,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering = 3,
		/obj/item/clothing/shoes/boots/winter/engineering = 3,
		/obj/item/clothing/shoes/boots/workboots = 3)


/obj/structure/closet/wardrobe/white
	name = "white wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/color/white = 3,
		/obj/item/clothing/under/color/white_skirt = 3,
		/obj/item/clothing/shoes/white = 3,
		/obj/item/clothing/head/soft/mime = 3)


/obj/structure/closet/wardrobe/pjs
	name = "pajama wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/pj/red = 2,
		/obj/item/clothing/under/pj/blue = 2,
		/obj/item/clothing/shoes/white = 2,
		/obj/item/clothing/shoes/slippers = 2)


/obj/structure/closet/wardrobe/science_white
	name = "science wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/rank/scientist = 3,
		/obj/item/clothing/under/rank/scientist/skirt = 2,
		/obj/item/clothing/under/rank/scientist/skirt_pleated = 2,
		/obj/item/clothing/under/rank/scientist/turtleneck = 3,
		/obj/item/clothing/suit/storage/toggle/labcoat = 3,
		/obj/item/clothing/shoes/white = 3,
		/obj/item/clothing/shoes/slippers = 3,
		/obj/item/clothing/suit/storage/hooded/wintercoat/science = 1,
		/obj/item/clothing/shoes/boots/winter/science = 1,
		/obj/item/storage/backpack/toxins = 1,
		/obj/item/storage/backpack/satchel/tox = 1)

/obj/structure/closet/wardrobe/science_white/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/sci
	else
		starts_with += /obj/item/storage/backpack/satchel/tox
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/sci
	else
		starts_with += /obj/item/storage/backpack/satchel/tox

	return ..()


/obj/structure/closet/wardrobe/robotics_black
	name = "robotics wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/black

	starts_with = alist(
		/obj/item/clothing/under/rank/roboticist = 2,
		/obj/item/clothing/under/rank/roboticist/skirt_pleated = 2,
		/obj/item/clothing/suit/storage/toggle/labcoat/robotics = 2,
		/obj/item/clothing/suit/storage/hooded/wintercoat/science/robotics = 2,
		/obj/item/clothing/shoes/black = 2,
		/obj/item/clothing/gloves/black = 2,
		/obj/item/storage/backpack/toxins = 1,
		/obj/item/storage/backpack/satchel/tox = 1)

/obj/structure/closet/wardrobe/robotics_black/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/sci
	else
		starts_with += /obj/item/storage/backpack/satchel/tox

	return ..()


/obj/structure/closet/wardrobe/chemistry_white
	name = "chemistry wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/rank/chemist = 2,
		/obj/item/clothing/under/rank/chemist/skirt = 2,
		/obj/item/clothing/under/rank/chemist/skirt_pleated = 2,
		/obj/item/clothing/shoes/white = 2,
		/obj/item/clothing/suit/storage/toggle/labcoat/chemist = 2,
		/obj/item/clothing/suit/storage/hooded/wintercoat/janitor = 2,
		/obj/item/storage/backpack/chemistry = 2,
		/obj/item/storage/backpack/satchel/chem = 2,
		/obj/item/storage/bag/chemistry = 2,)


/obj/structure/closet/wardrobe/genetics_white
	name = "genetics wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/rank/geneticist = 2,
		/obj/item/clothing/under/rank/geneticist/skirt = 2,
		/obj/item/clothing/under/rank/geneticist/skirt_pleated = 2,
		/obj/item/clothing/shoes/white = 2,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/genetics = 2,
		/obj/item/clothing/suit/storage/toggle/labcoat/genetics = 2,
		/obj/item/storage/backpack/genetics = 2,
		/obj/item/storage/backpack/satchel/gen = 2)


/obj/structure/closet/wardrobe/virology_white
	name = "virology wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/rank/virologist = 2,
		/obj/item/clothing/under/rank/virologist/skirt = 2,
		/obj/item/clothing/under/rank/virologist/skirt_pleated = 2,
		/obj/item/clothing/shoes/white = 2,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/viro = 2,
		/obj/item/clothing/suit/storage/toggle/labcoat/virologist = 2,
		/obj/item/clothing/mask/surgical = 2,
		/obj/item/storage/backpack/virology = 2,
		/obj/item/storage/backpack/satchel/vir = 2)


/obj/structure/closet/wardrobe/medic_white
	name = "medical wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/rank/medical = 2,
		/obj/item/clothing/under/rank/medical/skirt = 2,
		/obj/item/clothing/under/rank/medical/skirt_pleated = 2,
		/obj/item/clothing/under/rank/medical/turtleneck = 2,
		/obj/item/clothing/under/rank/medical/scrubs = 1,
		/obj/item/clothing/under/rank/medical/scrubs/green = 1,
		/obj/item/clothing/under/rank/medical/scrubs/purple = 1,
		/obj/item/clothing/under/rank/medical/scrubs/black = 1,
		/obj/item/clothing/under/rank/medical/scrubs/navyblue = 1,
		/obj/item/clothing/head/surgery/navyblue = 1,
		/obj/item/clothing/head/surgery/purple = 1,
		/obj/item/clothing/head/surgery/blue = 1,
		/obj/item/clothing/head/surgery/green = 1,
		/obj/item/clothing/head/surgery/black = 1,
		/obj/item/clothing/shoes/white = 2,
		/obj/item/clothing/suit/storage/toggle/labcoat = 2,
		/obj/item/clothing/mask/surgical = 2,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical = 2,
		/obj/item/clothing/shoes/boots/winter/medical = 2)


/obj/structure/closet/wardrobe/medic_gown
	name = "cloning wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/white

	starts_with = alist(
		/obj/item/clothing/under/medigown = 4)


/obj/structure/closet/wardrobe/grey
	name = "grey wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/grey

	starts_with = alist(
		/obj/item/clothing/under/color/grey = 3,
		/obj/item/clothing/under/color/grey_skirt = 3,
		/obj/item/clothing/shoes/black = 3,
		/obj/item/clothing/head/soft/grey = 3)


/obj/structure/closet/wardrobe/mixed
	name = "mixed wardrobe"
	closet_appearance = /singleton/closet_appearance/wardrobe/mixed

	starts_with = alist(
		/obj/item/clothing/under/color/blue = 1,
		/obj/item/clothing/under/color/yellow = 1,
		/obj/item/clothing/under/color/green = 1,
		/obj/item/clothing/under/color/pink = 1,
		/obj/item/clothing/under/skirt/outfit/plaid_blue = 1,
		/obj/item/clothing/under/skirt/outfit/plaid_red = 1,
		/obj/item/clothing/under/skirt/outfit/plaid_purple = 1,
		/obj/item/clothing/under/skirt/outfit/plaid_green = 1,
		/obj/item/clothing/under/color/lbrown_skirt = 1,
		/obj/item/clothing/under/color/brown_skirt = 1,
		/obj/item/clothing/under/color/red_skirt = 1,
		/obj/item/clothing/under/color/teal_skirt = 1,
		/obj/item/clothing/under/color/lblue_skirt = 1,
		/obj/item/clothing/under/color/blue_skirt = 1,
		/obj/item/clothing/under/color/lpurple_skirt = 1,
		/obj/item/clothing/under/color/maroon_skirt = 1,
		/obj/item/clothing/shoes/blue = 1,
		/obj/item/clothing/shoes/yellow = 1,
		/obj/item/clothing/shoes/green = 1,
		/obj/item/clothing/shoes/purple = 1,
		/obj/item/clothing/shoes/red = 1,
		/obj/item/clothing/shoes/laceup/brown = 1,
		/obj/item/clothing/under/pants/classicjeans = 1,
		/obj/item/clothing/under/pants/mustangjeans = 1,
		/obj/item/clothing/under/pants/blackjeans = 1,
		/obj/item/clothing/under/pants/youngfolksjeans = 1,
		/obj/item/clothing/under/pants/white = 1,
		/obj/item/clothing/under/pants/red = 1,
		/obj/item/clothing/under/pants/black = 1,
		/obj/item/clothing/under/pants/tan = 1,
		/obj/item/clothing/under/pants/track = 1,
		/obj/item/clothing/suit/storage/toggle/track = 1,
		/obj/item/clothing/under/pants = 1,
		/obj/item/clothing/under/pants/khaki = 1,
		/obj/item/clothing/mask/bandana/blue = 1,
		/obj/item/clothing/mask/bandana/blue = 1,
		/obj/item/clothing/accessory/hawaii = 1,
		/obj/item/clothing/accessory/hawaii/random = 1)


/obj/structure/closet/wardrobe/tactical
	name = "tactical equipment"
	closet_appearance = /singleton/closet_appearance/tactical

	starts_with = alist(
		/obj/item/clothing/under/tactical = 1,
		/obj/item/clothing/suit/armor/tactical = 1,
		/obj/item/clothing/head/helmet/tactical = 1,
		/obj/item/clothing/mask/balaclava/tactical = 1,
		/obj/item/clothing/mask/balaclava = 1,
		/obj/item/clothing/glasses/sunglasses/sechud/tactical = 1,
		/obj/item/clothing/shoes/boots/jackboots = 1,
		/obj/item/clothing/gloves/black = 1,
		/obj/item/clothing/under/pants/camo = 1)

/obj/structure/closet/wardrobe/tactical/Initialize(mapload)
	if(prob(25))
		starts_with += /obj/item/storage/belt/security/tactical/bandolier
	else
		starts_with += /obj/item/storage/belt/security/tactical
	if(prob(10))
		starts_with += /obj/item/clothing/mask/bandana/skull

	return ..()

/obj/structure/closet/wardrobe/ert
	name = "emergency response team equipment"
	closet_appearance = /singleton/closet_appearance/tactical

	starts_with = alist(
		/obj/item/clothing/under/rank/centcom = 1,
		/obj/item/clothing/under/ert = 1,
		/obj/item/clothing/under/syndicate/combat = 1,
		/obj/item/radio/headset/ert/alt = 1,
		/obj/item/clothing/glasses/sunglasses = 1,
		/obj/item/clothing/shoes/boots/swat = 1,
		/obj/item/clothing/gloves/swat = 1,
		/obj/item/clothing/mask/balaclava/tactical = 1,
		/obj/item/clothing/mask/balaclava = 1,
		/obj/item/clothing/mask/bandana/skull = 2)


/obj/structure/closet/wardrobe/suit
	name = "suit locker"
	closet_appearance = /singleton/closet_appearance/wardrobe/mixed

	starts_with = alist(
		/obj/item/clothing/under/assistantformal = 1,
		/obj/item/clothing/under/suit_jacket/charcoal = 1,
		/obj/item/clothing/under/suit_jacket/charcoal/skirt = 1,
		/obj/item/clothing/under/suit_jacket/navy = 1,
		/obj/item/clothing/under/suit_jacket/navy/skirt = 1,
		/obj/item/clothing/under/suit_jacket/burgundy = 1,
		/obj/item/clothing/under/suit_jacket/burgundy/skirt = 1,
		/obj/item/clothing/under/suit_jacket/checkered = 1,
		/obj/item/clothing/under/suit_jacket/checkered/skirt = 1,
		/obj/item/clothing/under/suit_jacket/tan = 1,
		/obj/item/clothing/under/suit_jacket/tan/skirt = 1,
		/obj/item/clothing/under/sl_suit = 1,
		/obj/item/clothing/under/suit_jacket = 1,
		/obj/item/clothing/under/suit_jacket/female = 1,
		/obj/item/clothing/under/suit_jacket/female/skirt = 1,
		/obj/item/clothing/under/suit_jacket/really_black = 1,
		/obj/item/clothing/under/suit_jacket/really_black/skirt = 1,
		/obj/item/clothing/under/suit_jacket/red = 1,
		/obj/item/clothing/under/suit_jacket/red/skirt = 1,
		/obj/item/clothing/under/scratch = 1,
		/obj/item/clothing/under/scratch/skirt = 1,
		/obj/item/storage/backpack/satchel = 2)

/obj/structure/closet/wardrobe/captain
	name = "Facility Director's wardrobe"
	closet_appearance = /singleton/closet_appearance/cabinet

	starts_with = alist(
		/obj/item/clothing/glasses/sunglasses = 1,
		/obj/item/clothing/glasses/sunglasses/prescription = 1,
		/obj/item/clothing/head/caphat = 1,
		/obj/item/clothing/head/caphat/cap = 1,
		/obj/item/clothing/head/caphat/formal = 1,
		/obj/item/clothing/head/beret/centcom/captain = 1,
		/obj/item/clothing/suit/captunic = 1,
		/obj/item/clothing/suit/captunic/capjacket = 1,
		/obj/item/clothing/suit/storage/parade_coat = 1,
		/obj/item/clothing/suit/storage/parade_coat/fem = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/captain = 1,
		/obj/item/clothing/under/rank/captain = 1,
		/obj/item/clothing/under/rank/captain/skirt_pleated = 1,
		/obj/item/clothing/under/dress/dress_cap = 1,
		/obj/item/clothing/under/captainformal = 1,
		/obj/item/clothing/under/gimmick/rank/captain/suit = 1,
		/obj/item/clothing/under/gimmick/rank/captain/suit/skirt = 1,
		/obj/item/clothing/under/bodysuit/bodysuitcommand = 1,
		/obj/item/clothing/gloves/captain = 1,
		/obj/item/clothing/shoes/brown = 1,
		/obj/item/clothing/shoes/boots/winter/command = 1,
		/obj/item/storage/backpack/satchel/cap = 1,
		/obj/item/storage/backpack/captain = 1)
