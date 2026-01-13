
/obj/structure/closet/walllocker/autolok_wall
	name = "autolok suit storage"
	desc = "It's wall-mounted storage unit for an AutoLok suit."
	store_mobs = FALSE
	closet_appearance = /singleton/closet_appearance/wall/emergency

	starts_with = alist(
		/obj/item/clothing/suit/space/void/autolok = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/suit_cooling_unit/emergency = 1
	)

/obj/structure/closet/walllocker/emergsuit_wall
	name = "emergency suit storage"
	desc = "It's wall-mounted storage unit for an emergency suit."
	store_mobs = FALSE
	closet_appearance = /singleton/closet_appearance/wall/emergency

	starts_with = alist(
		/obj/item/clothing/head/helmet/space/emergency = 1,
		/obj/item/clothing/suit/space/emergency = 1,
		/obj/item/tank/emergency/oxygen/engi = 1,
		/obj/item/suit_cooling_unit/emergency = 1
	)
