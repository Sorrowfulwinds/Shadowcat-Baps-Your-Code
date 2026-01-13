/obj/structure/closet/l3closet
	name = "level-3 biohazard suit closet"
	desc = "It's a storage unit for level-3 biohazard gear."
	closet_appearance = /singleton/closet_appearance/bio

/obj/structure/closet/l3closet/general
	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/general = 1,
		/obj/item/clothing/head/bio_hood/general = 1)


/obj/structure/closet/l3closet/virology
	closet_appearance = /singleton/closet_appearance/bio/virology

	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/virology = 1,
		/obj/item/clothing/head/bio_hood/virology = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/tank/oxygen = 1)


/obj/structure/closet/l3closet/security
	closet_appearance = /singleton/closet_appearance/bio/security

	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/security = 1,
		/obj/item/clothing/head/bio_hood/security = 1)

/obj/structure/closet/l3closet/janitor
	closet_appearance = /singleton/closet_appearance/bio/janitor

	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/janitor = 2,
		/obj/item/clothing/head/bio_hood/janitor = 2,
		/obj/item/clothing/mask/gas = 2,
		/obj/item/tank/emergency/oxygen/engi = 2)


/obj/structure/closet/l3closet/scientist
	closet_appearance = /singleton/closet_appearance/bio/science

	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/scientist = 1,
		/obj/item/clothing/head/bio_hood/scientist = 1)

/obj/structure/closet/l3closet/scientist/double
	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/scientist = 2,
		/obj/item/clothing/head/bio_hood/scientist = 2)


/obj/structure/closet/l3closet/medical
	closet_appearance = /singleton/closet_appearance/bio/medical

	starts_with = alist(
		/obj/item/clothing/suit/bio_suit/general = 3,
		/obj/item/clothing/head/bio_hood/general = 3,
		/obj/item/clothing/mask/gas = 3)
