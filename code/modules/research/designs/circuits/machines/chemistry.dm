/datum/prototype/design/circuit/machine/chemical_dispenser
	design_name = "Chemical Dispenser"
	build_path = /obj/item/circuitboard/machine/chemical_dispenser
	id = "MachineChemicalDispenser"
	req_tech = list(TECH_DATA = 3, TECH_BIO = 3, TECH_MATERIAL = 4)

/datum/prototype/design/circuit/machine/soda_dispenser
	design_name = "Drink Dispenser (Soda)"
	build_path = /obj/item/circuitboard/machine/chemical_dispenser/soda
	category = DESIGN_CATEGORY_RECREATION
	subcategory = DESIGN_SUBCATEGORY_STATION
	id = "MachineDrinkDispenserSoda"
	req_tech = list(TECH_DATA = 3, TECH_BIO = 3, TECH_MATERIAL = 4)

/datum/prototype/design/circuit/machine/booze_dispenser
	design_name = "Drink Dispenser (Bar)"
	build_path = /obj/item/circuitboard/machine/chemical_dispenser/booze
	category = DESIGN_CATEGORY_RECREATION
	subcategory = DESIGN_SUBCATEGORY_STATION
	id = "MachineDrinkDispenserBooze"
	req_tech = list(TECH_DATA = 3, TECH_BIO = 3, TECH_MATERIAL = 4)

/datum/prototype/design/circuit/machine/cafe_dispenser
	design_name = "Drink Dispenser (Cafe)"
	build_path = /obj/item/circuitboard/machine/chemical_dispenser/cafe
	category = DESIGN_CATEGORY_RECREATION
	subcategory = DESIGN_SUBCATEGORY_STATION
	id = "MachineDrinkDispenserCafe"
	req_tech = list(TECH_DATA = 3, TECH_BIO = 3, TECH_MATERIAL = 4)
