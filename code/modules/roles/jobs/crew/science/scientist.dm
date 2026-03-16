/datum/prototype/role/job/scientist
	id = "JobNtScientist"
	title = "Scientist"

	menu_blurb = "A Scientist is a generalist working in the Research department, with general knowledge of the scientific process, as well as the principles and requirements of Research and Development. They may also formulate experiments of their own devising, if they find an appropriate topic."

	spawn_blurb = "You work in the science department and report to the Research Director."

	minimum_player_age = 14
	outfit = /datum/outfit/job/station/scientist
	selection_color = "#633D63"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_SCIENCE_FABRICATION,
		ACCESS_SCIENCE_TOXINS,
		ACCESS_SCIENCE_MAIN,
		ACCESS_SCIENCE_XENOARCH,
		ACCESS_SCIENCE_XENOBIO,
		ACCESS_SCIENCE_XENOBOTANY,
	)
	additional_access = list(
		ACCESS_SCIENCE_ROBOTICS,
	)

	departments = list(/datum/department/research::id)

	alt_titles = list(
		/datum/prototype/alt_title/scientist/juinor::id,
		/datum/prototype/alt_title/scientist/assistant::id,
		/datum/prototype/alt_title/scientist/researcher::id,
		/datum/prototype/alt_title/scientist/xenoarch::id,
		/datum/prototype/alt_title/scientist/anomalist::id,
		/datum/prototype/alt_title/scientist/circuit::id,
		/datum/prototype/alt_title/scientist/fieldtech::id,
		/datum/prototype/alt_title/scientist/xenobiologist::id,
		/datum/prototype/alt_title/scientist/xenobiologist/xenozoologist::id,
		/datum/prototype/alt_title/scientist/xenobiologist/xenoanthropologist::id,
		/datum/prototype/alt_title/scientist/xenobotanist::id,
		/datum/prototype/alt_title/scientist/xenobotanist/xenoflorist::id,
		/datum/prototype/alt_title/scientist/xenobotanist/xenohydroponicist::id,
	)

/datum/prototype/alt_title/scientist
	parent_role = /datum/prototype/role/job/scientist::id
	abstract_type = /datum/prototype/alt_title/scientist

/datum/prototype/alt_title/scientist/juinor
	id = "AltScientistJuinor"
	title = "Juinor Scientist"
	sorting_order = SSR_JUINOR
	menu_blurb = "A Junior Scientist is a lower-level member of research staff, whose main purpose is to help scientists with their specialized work in more menial fashion, while also learning the specializations in process."

/datum/prototype/alt_title/scientist/assistant
	id = "AltScientistAssistant"
	title = "Lab Assistant"
	sorting_order = SSR_JUINOR
	menu_blurb = "A Lab Assistant is a lower-level member of research staff, whose main purpose is to help scientists with their specialized work in more menial fashion, while also learning the specializations in process."

/datum/prototype/alt_title/scientist/researcher
	id = "AltScientistResearcher"
	title = "Researcher"

/datum/prototype/alt_title/scientist/xenoarch
	id = "AltScientistXenoarch"
	title = "Xenoarchaeologist"
	menu_blurb = "A Xenoarchaeologist enters digsites in search of artifacts of alien origin. These digsites are frequently in vacuum or other inhospitable locations, and as such a Xenoarchaeologist should be prepared to handle hostile environmental conditions."

/datum/prototype/alt_title/scientist/anomalist
	id = "AltScientistAnomalist"
	title = "Anomalist"
	menu_blurb = "An Anomalist is a Scientist whose expertise is analyzing alien artifacts. They are familiar with the most common methods of testing artifact function. They work closely with Xenoarchaeologists, or Miners, if either role is present."

/datum/prototype/alt_title/scientist/circuit
	id = "AltScientistCircuit"
	title = "Circuit Designer"
	menu_blurb = "A Circuit Designer is a Scientist whose expertise is working with integrated circuits. They are familiar with the workings and programming of those devices. They work to create various useful devices using the capabilities of integrated circuitry."

/datum/prototype/alt_title/scientist/fieldtech
	id = "AltScientistFieldTech"
	title = "Research Field Technician"

/datum/prototype/alt_title/scientist/xenobiologist
	id = "AltScientistXenobiologist"
	title = "Xenobiologist"
	menu_blurb = "A Xenobiologist studies esoteric lifeforms, usually in the relative safety of their lab. They attempt to find ways to benefit from the byproducts of these lifeforms, and their main subject at present is the Giant Slime."
	outfit = /datum/outfit/job/station/scientist/xenobiologist

//Recovered xenobio alt-titles for arpee purposes
/datum/prototype/alt_title/scientist/xenobiologist/xenozoologist
	id = "AltScientistXenobioZoo"
	title = "Xenozoologist"
	menu_blurb = "Xenozoologists are well versed in the study of extra-terrestrial behavior, physiology, classification, and habitats."

/datum/prototype/alt_title/scientist/xenobiologist/xenoanthropologist
	id = "AltScientistXenobioAnthro"
	title = "Xenoanthropologist"
	menu_blurb = "Xenoanthropologist still heavily focuses their study on alien lifeforms, but their specialty leans more towards fellow sapient beings than simple animals."

/datum/prototype/alt_title/scientist/xenobotanist
	id = "AltScientistXenobotanist"
	title = "Xenobotanist"
	menu_blurb = "A Xenobotanist grows and cares for a variety of abnormal, custom made, and frequently dangerous plant life. When the products of these plants are both safe and beneficial to the station, they may choose to introduce it to the rest of the crew."
	outfit = /datum/outfit/job/station/scientist/xenobiologist

//Recovered xenobotanist alt-titles for arpee
/datum/prototype/alt_title/scientist/xenobotanist/xenoflorist
	id = "AltScientistXenobotFlorist"
	title = "Xenoflorist"

/datum/prototype/alt_title/scientist/xenobotanist/xenohydroponicist
	id = "AltScientistXenobotHydro"
	title = "Xenohydroponicist"

/datum/outfit/job/station/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	uniform = /obj/item/clothing/under/rank/scientist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	l_ear = /obj/item/radio/headset/headset_sci
	shoes = /obj/item/clothing/shoes/white

	id_type = /obj/item/card/id/science/scientist
	pda_type = /obj/item/pda/science
	pda_slot = SLOT_ID_LEFT_POCKET

	backpack = /obj/item/storage/backpack/toxins
	satchel_one = /obj/item/storage/backpack/satchel/tox
	messenger_bag = /obj/item/storage/backpack/messenger/tox
	dufflebag = /obj/item/storage/backpack/dufflebag/sci

/datum/outfit/job/station/scientist/xenobiologist
	name = OUTFIT_JOB_NAME("Xenobiologist")
	id_type = /obj/item/card/id/science/xenobiologist
