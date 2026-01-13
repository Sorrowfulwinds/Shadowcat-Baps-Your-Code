/obj/structure/noticeboard/anomaly
	notices = 5
	icon_state = "nboard05"

/obj/structure/noticeboard/anomaly/Initialize(mapload)
	. = ..()
	var/obj/item/paper/P = new(src)
	P.name = "Memo RE: proper analysis procedure"
	P.info = "<br>We keep test dummies in pens here for a reason, so standard procedure should be to activate newfound alien artifacts and place the two in close proximity. Promising items I might even approve monkey testing on."
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")

	P = new(src)
	P.name = "Memo RE: materials gathering"
	P.info = "Corasang,<br>the hands-on approach to gathering our samples may very well be slow at times, but it's safer than allowing the blundering miners to roll willy-nilly over our dig sites in their mechs, destroying everything in the process. And don't forget the escavation tools on your way out there!<br>- R.W"
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")

	P = new(src)
	P.name = "Memo RE: ethical quandaries"
	P.info = "Darion-<br><br>I don't care what his rank is, our business is that of science and knowledge - questions of moral application do not come into this. Sure, so there are those who would employ the energy-wave particles my modified device has managed to abscond for their own personal gain, but I can hardly see the practical benefits of some of these artifacts our benefactors left behind. Ward--"
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")

	P = new(src)
	P.name = "READ ME! Before you people destroy any more samples"
	P.info = "how many times do i have to tell you people, these xeno-arch samples are del-i-cate, and should be handled so! careful application of a focussed, concentrated heat or some corrosive liquids should clear away the extraneous carbon matter, while application of an energy beam will most decidedly destroy it entirely - like someone did to the chemical dispenser! W, <b>the one who signs your paychecks</b>"
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")

	P = new(src)
	P.name = "Reminder regarding the anomalous material suits"
	P.info = "Do you people think the anomaly suits are cheap to come by? I'm about a hair trigger away from instituting a log book for the damn things. Only wear them if you're going out for a dig, and for god's sake don't go tramping around in them unless you're field testing something, R"
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")

/obj/structure/bookcase/manuals/xenoarchaeology
	name = "Xenoarchaeology Manuals bookcase"

/obj/structure/bookcase/manuals/xenoarchaeology/Initialize(mapload)
	. = ..()
	new /obj/item/book/manual/excavation(src)
	new /obj/item/book/manual/mass_spectrometry(src)
	new /obj/item/book/manual/materials_chemistry_analysis(src)
	new /obj/item/book/manual/anomaly_testing(src)
	new /obj/item/book/manual/anomaly_spectroscopy(src)
	new /obj/item/book/manual/stasis(src)
	update_icon()

/obj/structure/closet/secure_closet/xenoarchaeologist
	name = "Xenoarchaeologist Locker"
	req_access = list(ACCESS_SCIENCE_TOXINS)

	starts_with = alist(
		/obj/item/clothing/under/rank/scientist = 1,
		/obj/item/clothing/suit/storage/toggle/labcoat = 1,
		/obj/item/clothing/shoes/white = 1,
		/obj/item/melee/umbrella = 1,
		/obj/item/clothing/glasses/science = 1,
		/obj/item/radio/headset/headset_sci = 1,
		/obj/item/storage/belt/archaeology = 1,
		/obj/item/storage/excavation = 1)

/obj/structure/closet/excavation
	name = "Excavation tools"
	icon_state = "toolcloset"
	icon_closed = "toolcloset"
	icon_opened = "toolclosetopen"

	starts_with = alist(
		/obj/item/storage/belt/archaeology = 1,
		/obj/item/storage/excavation = 1,
		/obj/item/flashlight/lantern = 1,
		/obj/item/ano_scanner = 1,
		/obj/item/depth_scanner = 1,
		/obj/item/core_sampler = 1,
		/obj/item/gps = 1,
		/obj/item/clothing/glasses/meson = 1,
		/obj/item/pickaxe = 1,
		/obj/item/measuring_tape = 1,
		/obj/item/pickaxe/hand = 1,
		/obj/item/storage/bag/fossils = 1,
		/obj/item/camera_film = 3,
		/obj/item/camera = 1,
		/obj/item/storage/box/evidence = 2,
		/obj/item/storage/secure/briefcase = 1,
		/obj/item/paper_bin = 1,
		/obj/item/hand_labeler = 1)

/obj/machinery/air_alarm/isolation
	req_one_access = list(ACCESS_SCIENCE_MAIN, ACCESS_ENGINEERING_ATMOS, ACCESS_ENGINEERING_ENGINE)

/obj/machinery/air_alarm/monitor/isolation
	req_one_access = list(ACCESS_SCIENCE_MAIN, ACCESS_ENGINEERING_ATMOS, ACCESS_ENGINEERING_ENGINE)
