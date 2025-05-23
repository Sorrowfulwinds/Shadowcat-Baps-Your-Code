/*
 * Contains weapons primarily using the 'grappling hook' projectiles.
 */

/obj/item/gun/projectile/energy/hooklauncher
	name = "gravity whip"
	desc = "A large, strange gauntlet."
	icon_state = "gravwhip"
	item_state = "gravwhip"
	fire_sound_text = "laser blast"

	firemodes = /datum/firemode/energy{
		cycle_cooldown = 1.5 SECONDS;
	}
	charge_cost = 300

	cell_type = /obj/item/cell/device/weapon
	projectile_type = /obj/projectile/energy/hook

// An easily concealable not-ripoff version. It would be silenced, if it didn't make it blatant you're the one using it.

/obj/item/gun/projectile/energy/hooklauncher/ring
	name = "ominous ring"
	desc = "A small ring with strange symbols engraved upon it."
	icon = 'icons/obj/clothing/rings.dmi'
	icon_state = "seal-signet"
	item_state = "concealed"

	w_class = WEIGHT_CLASS_TINY

	cell_type = /obj/item/cell/device/weapon/recharge/alien
	legacy_battery_lock = TRUE
	charge_cost = 400
	charge_meter = FALSE

	projectile_type = /obj/projectile/energy/hook/ring

	firemodes = list(
		list(mode_name="manipulate", fire_delay=15, projectile_type=/obj/projectile/energy/hook/ring, charge_cost = 400),
		list(mode_name="battle", fire_delay=8, projectile_type=/obj/projectile/beam/xray, charge_cost = 260),
		)
