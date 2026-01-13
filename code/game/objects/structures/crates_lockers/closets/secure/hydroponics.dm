/obj/structure/closet/secure_closet/hydroponics
	name = "botanist's locker"
	req_access = list(ACCESS_GENERAL_BOTANY)
	closet_appearance = /singleton/closet_appearance/secure_closet/hydroponics

	starts_with = alist(
		/obj/item/storage/bag/plants = 1,
		/obj/item/clothing/under/rank/hydroponics = 1,
		/obj/item/clothing/under/rank/hydroponics/skirt_pleated = 1,
		/obj/item/plant_analyzer = 1,
		/obj/item/radio/headset/headset_service = 1,
		/obj/item/clothing/head/greenbandana = 1,
		/obj/item/material/minihoe = 1,
		/obj/item/material/knife/machete/hatchet = 1,
		/obj/item/reagent_containers/glass/beaker = 2,
		/obj/item/tool/wirecutters/clippers/trimmers = 1,
		/obj/item/reagent_containers/spray/plantbgone = 1,
		/obj/item/clothing/suit/storage/hooded/wintercoat/hydro = 1,
		/obj/item/clothing/shoes/boots/winter/hydro = 1,
		/obj/item/clothing/gloves/botanic_leather = 1)

/obj/structure/closet/secure_closet/hydroponics/Initialize(mapload)
	if(prob(50))
		starts_with += /obj/item/clothing/suit/storage/apron
	else
		starts_with += /obj/item/clothing/suit/storage/apron/overalls
	return ..()
