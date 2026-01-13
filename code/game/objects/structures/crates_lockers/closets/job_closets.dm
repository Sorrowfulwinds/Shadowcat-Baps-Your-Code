/* Closets for specific jobs
 * Contains:
 *		Bartender
 *		Janitor
 *		Lawyer
 */

/*
 * Bartender
 */
/obj/structure/closet/gmcloset
	name = "formal closet"
	desc = "It's a storage unit for formal clothing."
	closet_appearance = /singleton/closet_appearance/wardrobe/black

	starts_with = alist(
		/obj/item/clothing/head/that = 2,
		/obj/item/radio/headset/headset_service = 2,
		/obj/item/clothing/head/pin/flower = 1,
		/obj/item/clothing/head/pin/flower/pink = 1,
		/obj/item/clothing/head/pin/flower/yellow = 1,
		/obj/item/clothing/head/pin/flower/blue = 1,
		/obj/item/clothing/head/pin/pink = 1,
		/obj/item/clothing/head/pin/magnetic = 1,
		/obj/item/clothing/under/sl_suit = 2,
		/obj/item/clothing/under/rank/bartender = 2,
		/obj/item/clothing/under/rank/bartender/skirt = 1,
		/obj/item/clothing/under/rank/bartender/skirt_pleated = 1,
		/obj/item/clothing/under/dress/dress_saloon = 1,
		/obj/item/clothing/accessory/wcoat = 2,
		/obj/item/clothing/shoes/black = 2,
		/obj/item/clothing/shoes/laceup = 1)

/*
 * Chef
 */
/obj/structure/closet/chefcloset
	name = "chef's closet"
	desc = "It's a storage unit for foodservice garments."
	closet_appearance = /singleton/closet_appearance/wardrobe/black

	starts_with = alist(
		/obj/item/clothing/under/sundress = 1,
		/obj/item/clothing/under/waiter = 2,
		/obj/item/radio/headset/headset_service = 2,
		/obj/item/storage/box/mousetraps = 2,
		/obj/item/clothing/under/rank/chef = 1,
		/obj/item/clothing/under/rank/chef/skirt_pleated = 1,
		/obj/item/clothing/head/chefhat = 1,
		/obj/item/storage/bag/food = 2)

/*
 * Janitor
 */
/obj/structure/closet/jcloset
	name = "custodial closet"
	desc = "It's a storage unit for janitorial clothes and gear."
	closet_appearance = /singleton/closet_appearance/wardrobe/janitor

	starts_with = alist(
		/obj/item/clothing/under/rank/janitor = 1,
		/obj/item/clothing/under/rank/janitor/skirt_pleated = 1,
		/obj/item/clothing/under/dress/maid/janitor = 1,
		/obj/item/radio/headset/headset_service = 1,
		/obj/item/cartridge/janitor = 1,
		/obj/item/clothing/gloves/black = 1,
		/obj/item/clothing/head/soft/purple = 1,
		/obj/item/clothing/head/beret/science = 1,
		/obj/item/flashlight = 1,
		/obj/item/caution = 4,
		/obj/item/lightreplacer = 1,
		/obj/item/storage/bag/trash = 1,
		/obj/item/storage/belt/janitor = 1,
		/obj/item/clothing/shoes/galoshes = 1,
		/obj/item/reagent_containers/food/urinalcake = 2,
		)

/*
 * Lawyer
 */
/obj/structure/closet/lawcloset
	name = "legal closet"
	desc = "It's a storage unit for courtroom apparel and items."
	closet_appearance = /singleton/closet_appearance/wardrobe/legal

	starts_with = alist(
		/obj/item/clothing/under/lawyer/female = 2,
		/obj/item/clothing/under/lawyer/black = 2,
		/obj/item/clothing/under/lawyer/black/skirt = 2,
		/obj/item/clothing/under/lawyer/red = 2,
		/obj/item/clothing/under/lawyer/red/skirt = 2,
		/obj/item/clothing/suit/storage/toggle/internalaffairs = 2,
		/obj/item/clothing/under/lawyer/bluesuit = 2,
		/obj/item/clothing/under/lawyer/bluesuit/skirt = 2,
		/obj/item/clothing/suit/storage/toggle/lawyer/bluejacket = 2,
		/obj/item/clothing/under/lawyer/purpsuit = 2,
		/obj/item/clothing/under/lawyer/purpsuit/skirt = 2,
		/obj/item/clothing/suit/storage/toggle/lawyer/purpjacket = 2,
		/obj/item/clothing/shoes/brown = 2,
		/obj/item/clothing/shoes/black = 2,
		/obj/item/clothing/shoes/laceup = 2,
		/obj/item/clothing/glasses/sunglasses/big = 2,
		/obj/item/clothing/under/lawyer/blue = 2,
		/obj/item/clothing/under/lawyer/blue/skirt = 2,
		/obj/item/cassette_tape/random = 2)
