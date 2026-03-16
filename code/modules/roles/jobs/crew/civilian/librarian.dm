/datum/prototype/role/job/librarian
	id = "JobNtLibrarian"
	title = "Librarian"

	menu_blurb = "The Librarian curates the book selection in the Library, so the crew might enjoy it."

	spawn_blurb = "You report to the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/librarian
	selection_color =  "#515151"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_GENERAL_LIBRARY,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(
		/datum/prototype/alt_title/librarian/journalist::id,
		/datum/prototype/alt_title/librarian/writer::id,
		/datum/prototype/alt_title/librarian/reporter::id,
		/datum/prototype/alt_title/librarian/historian::id,
		/datum/prototype/alt_title/librarian/archivist::id,
		/datum/prototype/alt_title/librarian/professor::id,
		/datum/prototype/alt_title/librarian/academic::id,
		/datum/prototype/alt_title/librarian/philosopher::id,
	)

/datum/prototype/alt_title/librarian
	parent_role = /datum/prototype/role/job/librarian::id
	abstract_type = /datum/prototype/alt_title/librarian

/datum/prototype/alt_title/librarian/journalist
	id = "AltLibrarianJournalist"
	title = "Journalist"
	menu_blurb = "The Journalist uses the Library as a base of operations, from which they can report the news and goings-on on the station with their camera."

/datum/prototype/alt_title/librarian/writer
	id = "AltLibrarianWriter"
	title = "Writer"
	menu_blurb = "The Writer uses the Library as a quiet place to write whatever it is they choose to write."

/datum/prototype/alt_title/librarian/reporter
	id = "AltLibrarianReporter"
	title = "Reporter"
	menu_blurb = "The Reporter uses the Library as a base of operations, from which they can report the news and goings-on on the station with their camera."
	outfit = /datum/outfit/job/station/librarian/reporter

/datum/prototype/alt_title/librarian/historian
	id = "AltLibrarianHistorian"
	title = "Historian"
	menu_blurb = "The Historian uses the Library as a base of operation to record any important events occurring on station."

/datum/prototype/alt_title/librarian/archivist
	id = "AltLibrarianArchivist"
	title = "Archivist"
	menu_blurb = "The Archivist uses the Library as a base of operation to record any important events occurring on station."

/datum/prototype/alt_title/librarian/professor
	id = "AltLibrarianProfessor"
	title = "Professor"
	menu_blurb = "The Professor uses the Library as a base of operations to share their vast knowledge with the crew."

/datum/prototype/alt_title/librarian/academic
	id = "AltLibrarianAcademic"
	title = "Academic"
	menu_blurb = "The Academic uses the Library as a base of operations to share their vast knowledge with the crew."

/datum/prototype/alt_title/librarian/philosopher
	id = "AltLibrarianPhilosopher"
	title = "Philosopher"
	menu_blurb = "The Philosopher uses the Library as a base of operation to ruminate on nature of life and other great questions, and share their opinions with the crew."

/datum/outfit/job/station/librarian
	name = OUTFIT_JOB_NAME("Librarian")
	uniform = /obj/item/clothing/under/suit_jacket/red
	l_hand = /obj/item/barcodescanner
	id_type = /obj/item/card/id/civilian/librarian
	pda_type = /obj/item/pda/librarian

/datum/outfit/job/station/librarian/reporter
	name = OUTFIT_JOB_NAME("Reporter")
	belt = /obj/item/camera
	backpack_contents = list(
		/obj/item/clothing/accessory/badge/corporate_tag/press = 1,
		/obj/item/tape_recorder = 1,
		/obj/item/camera_film = 1
	)
