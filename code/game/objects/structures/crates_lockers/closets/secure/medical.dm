/obj/structure/closet/secure_closet/medical1
	name = "medicine closet"
	desc = "Filled with medical junk."
	closet_appearance = /singleton/closet_appearance/secure_closet/medical
	req_access = list(ACCESS_MEDICAL_MAIN)

	starts_with = alist(
		/obj/item/storage/box/autoinjectors = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/reagent_containers/dropper = 2,
		/obj/item/reagent_containers/glass/beaker = 2,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 2,
		/obj/item/reagent_containers/glass/bottle/antitoxin = 2)


/obj/structure/closet/secure_closet/medical2
	name = "anesthetics closet"
	desc = "Used to knock people out."
	closet_appearance = /singleton/closet_appearance/secure_closet/medical/alt
	req_access = list(ACCESS_MEDICAL_SURGERY)

	starts_with = alist(
		/obj/item/tank/anesthetic = 3,
		/obj/item/clothing/mask/breath/medical = 3)


/obj/structure/closet/secure_closet/medical3
	name = "medical doctor's locker"
	req_access = list(ACCESS_MEDICAL_EQUIPMENT)
	closet_appearance = /singleton/closet_appearance/secure_closet/medical

	starts_with = alist(
		/obj/item/clothing/under/rank/medical = 1,
		/obj/item/clothing/under/rank/nurse = 1,
		/obj/item/clothing/under/rank/orderly = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat = 1,
		/obj/item/clothing/suit/storage/toggle/fr_jacket = 1,
		/obj/item/clothing/shoes/white = 1,
		/obj/item/cartridge/medical = 1,
		/obj/item/radio/headset/headset_med = 1,
		/obj/item/radio/headset/headset_med/alt = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical = 1,
		/obj/item/clothing/shoes/boots/winter/medical = 1,
		/obj/item/clothing/under/rank/nursesuit = 1,
		/obj/item/clothing/head/nursehat = 1,
		/obj/item/gps/medical = 1,
		/obj/item/storage/box/freezer = 3)

/obj/structure/closet/secure_closet/medical3/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/medic
	else
		starts_with += /obj/item/storage/backpack/satchel/med
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/med
	switch(pick("blue", "green", "purple", "black", "navyblue"))
		if ("blue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs
			starts_with += /obj/item/clothing/head/surgery/blue
		if ("green")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/green
			starts_with += /obj/item/clothing/head/surgery/green
		if ("purple")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/purple
			starts_with += /obj/item/clothing/head/surgery/purple
		if ("black")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/black
			starts_with += /obj/item/clothing/head/surgery/black
		if ("navyblue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/navyblue
			starts_with += /obj/item/clothing/head/surgery/navyblue
	switch(pick("blue", "green", "purple", "black", "navyblue"))
		if ("blue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs
			starts_with += /obj/item/clothing/head/surgery/blue
		if ("green")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/green
			starts_with += /obj/item/clothing/head/surgery/green
		if ("purple")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/purple
			starts_with += /obj/item/clothing/head/surgery/purple
		if ("black")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/black
			starts_with += /obj/item/clothing/head/surgery/black
		if ("navyblue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/navyblue
			starts_with += /obj/item/clothing/head/surgery/navyblue
	return ..()


/obj/structure/closet/secure_closet/paramedic
	name = "paramedic locker"
	desc = "Supplies for a first responder."
	closet_appearance = /singleton/closet_appearance/secure_closet/medical/paramedic
	req_access = list(ACCESS_MEDICAL_EQUIPMENT)

	starts_with = alist(
		/obj/item/storage/backpack/dufflebag/emt = 1,
		/obj/item/clothing/under/bodysuit/bodysuitemt = 1,
		/obj/item/storage/box/autoinjectors = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 1,
		/obj/item/reagent_containers/glass/bottle/antitoxin = 1,
		/obj/item/storage/belt/medical/emt = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/clothing/suit/storage/toggle/fr_jacket = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat/emt = 1,
		/obj/item/radio/headset/headset_med/alt = 1,
		/obj/item/clothing/accessory/armor/helmetcamera/body = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/para = 1,
		/obj/item/cartridge/medical = 1,
		/obj/item/storage/briefcase/inflatable = 1,
		/obj/item/flashlight = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/healthanalyzer = 1,
		/obj/item/radio/off = 1,
		/obj/random/medical = 1,
		/obj/item/tool/crowbar = 1,
		/obj/item/gps/medical = 1,
		/obj/item/extinguisher/mini = 1,
		/obj/item/storage/box/freezer = 1,
		/obj/item/clothing/accessory/storage/white_vest = 1,
		/obj/item/barrier_tape_roll/medical = 1,
		/obj/item/storage/lockbox/limb_plate/emt = 1)

/obj/structure/closet/secure_closet/paramedic/Initialize(mapload)
	starts_with += /obj/item/gps/medical
	return ..()

/obj/structure/closet/secure_closet/CMO
	name = "chief medical officer's locker"
	req_access = list(ACCESS_MEDICAL_CMO)
	closet_appearance = /singleton/closet_appearance/secure_closet/cmo

	starts_with = alist(
		/obj/item/clothing/under/rank/chief_medical_officer = 1,
		/obj/item/clothing/under/rank/chief_medical_officer/skirt = 1,
		/obj/item/clothing/under/rank/chief_medical_officer/skirt_pleated = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat/cmo = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat/cmoalt = 1,
		/obj/item/cartridge/cmo = 1,
		/obj/item/clothing/gloves/sterile/latex = 1,
		/obj/item/clothing/shoes/brown = 1,
		/obj/item/radio/headset/heads/cmo = 1,
		/obj/item/radio/headset/heads/cmo/alt = 1,
		/obj/item/flash = 1,
		/obj/item/storage/hypokit/advanced/cmo/full/loaded = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/cmo = 1,
		/obj/item/clothing/shoes/boots/winter/medical = 1,
		/obj/item/storage/box/freezer = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/barrier_tape_roll/medical = 1,
		/obj/item/clothing/suit/bio_suit/cmo = 1,
		/obj/item/clothing/head/bio_hood/cmo = 1,
		/obj/item/gps/medical/cmo = 1,
		/obj/item/clothing/shoes/white = 1,
		/obj/item/clothing/under/rank/chief_medical_officer/turtleneck = 1)

/obj/structure/closet/secure_closet/CMO/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/storage/backpack/medic
	else
		starts_with += /obj/item/storage/backpack/satchel/med
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/med
	switch(pick("blue", "green", "purple", "black", "navyblue"))
		if ("blue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs
			starts_with += /obj/item/clothing/head/surgery/blue
		if ("green")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/green
			starts_with += /obj/item/clothing/head/surgery/green
		if ("purple")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/purple
			starts_with += /obj/item/clothing/head/surgery/purple
		if ("black")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/black
			starts_with += /obj/item/clothing/head/surgery/black
		if ("navyblue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/navyblue
			starts_with += /obj/item/clothing/head/surgery/navyblue
	return ..()


/obj/structure/closet/secure_closet/animal
	name = "animal control closet"
	req_access = list(ACCESS_MEDICAL_SURGERY)

	starts_with = alist(
		/obj/item/assembly/signaler = 1,
		/obj/item/radio/electropack = 3)


/obj/structure/closet/secure_closet/chemical
	name = "chemical closet"
	desc = "Store dangerous chemicals in here."
	closet_appearance = /singleton/closet_appearance/secure_closet/medical/chemicals
	req_access = list(ACCESS_MEDICAL_CHEMISTRY)

	starts_with = alist(
		/obj/item/storage/box/pillbottles = 2,
		/obj/item/storage/box/beakers = 1,
		/obj/item/storage/box/autoinjectors = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/reagent_containers/dropper = 2,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 2,
		/obj/item/reagent_containers/glass/bottle/antitoxin = 2,
		/obj/item/storage/fancy/vials = 1)


/obj/structure/closet/secure_closet/psych
	name = "psychiatric closet"
	desc = "Store psychology tools and medicines in here."
	closet_appearance = /singleton/closet_appearance/secure_closet/medical
	req_access = list(ACCESS_MEDICAL_PSYCH)

	starts_with = alist(
		/obj/item/clothing/under/rank/psych = 1,
		/obj/item/clothing/under/rank/psych/turtleneck = 1,
		/obj/item/clothing/suit/straight_jacket = 1,
		/obj/item/reagent_containers/glass/bottle/stoxin = 1,
		/obj/item/reagent_containers/syringe = 1,
		/obj/item/storage/pill_bottle/citalopram = 1,
		/obj/item/reagent_containers/pill/methylphenidate = 1,
		/obj/item/clipboard = 1,
		/obj/item/folder/white = 1,
		/obj/item/tape_recorder = 1,
		/obj/item/cassette_tape/random = 3,
		/obj/item/camera = 1,
		/obj/item/toy/plushie/therapy/blue = 1)


/obj/structure/closet/secure_closet/medical_wall
	name = "first aid closet"
	desc = "It's a secure wall-mounted storage unit for first aid supplies."
	closet_appearance = /singleton/closet_appearance/wall/medical
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER
	anchored = 1
	density = 0
	wall_mounted = 1
	req_access = list(ACCESS_MEDICAL_EQUIPMENT)

/obj/structure/closet/secure_closet/medical_wall/pills
	name = "pill cabinet"

	starts_with = alist(
		/obj/item/storage/pill_bottle/tramadol = 1,
		/obj/item/storage/pill_bottle/antitox = 1,
		/obj/item/storage/pill_bottle/carbon = 1,
		/obj/random/medical/pillbottle = 1)


/obj/structure/closet/secure_closet/medical_wall/anesthetics
	name = "anesthetics wall closet"
	desc = "Used to knock people out."
	req_access = list(ACCESS_MEDICAL_SURGERY)

	starts_with = alist(
		/obj/item/tank/anesthetic = 3,
		/obj/item/clothing/mask/breath/medical = 3)

/obj/structure/closet/secure_closet/medical_wall/synth_anesthetics
	name = "robotics anesthetics wall closet"
	desc = "Used to knock people out."
	req_access = list(ACCESS_SCIENCE_ROBOTICS)

	starts_with = alist(
		/obj/item/tank/anesthetic = 3,
		/obj/item/clothing/mask/breath/medical = 3)
