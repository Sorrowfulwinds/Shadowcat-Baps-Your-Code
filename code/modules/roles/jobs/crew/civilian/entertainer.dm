/datum/prototype/role/job/entertainer
	id = "JobNtEntertainer"
	title = "Entertainer"

	menu_blurb = "An entertainer does just that, entertains! Put on plays, play music, sing songs, tell stories, or read your favorite fanfic."

	spawn_blurb = "You report to the Head of Personnel.\n"

	outfit = /datum/outfit/job/station/assistant
	selection_color =  "#515151"
	sorting_order = SSR_STANDARD

	minimal_access = list(
		ACCESS_GENERAL_ENTERTAINMENT,
	)

	departments = list(/datum/department/civilian::id)

	alt_titles = list(
		/datum/prototype/alt_title/entertainer/actor::id,
		/datum/prototype/alt_title/entertainer/performer::id,
		/datum/prototype/alt_title/entertainer/musician::id,
		/datum/prototype/alt_title/entertainer/stagehand::id,
		/datum/prototype/alt_title/entertainer/dancer::id,
		/datum/prototype/alt_title/entertainer/singer::id,
		/datum/prototype/alt_title/entertainer/magician::id,
		/datum/prototype/alt_title/entertainer/comedian::id,
		/datum/prototype/alt_title/entertainer/tragedian::id,
	)

/datum/prototype/alt_title/entertainer
	parent_role = /datum/prototype/role/job/entertainer::id
	abstract_type = /datum/prototype/alt_title/entertainer

/datum/prototype/alt_title/entertainer/actor
	id = "AltEntertainerActor"
	title = "Actor"
	menu_blurb = "An Actor is someone who acts out a role! Whatever sort of character it is, get into it and impress people with power of comedy and tragedy!"

/datum/prototype/alt_title/entertainer/performer
	id = "AltEntertainerPerformer"
	title = "Performer"
	menu_blurb = "A Performer is someone who performs! Whatever sort of performance will come to your mind, the world's a stage!"

/datum/prototype/alt_title/entertainer/musician
	id = "AltEntertainerMusician"
	title = "Musician"
	menu_blurb = "A Musician is someone who makes music with a wide variety of musical instruments!"

/datum/prototype/alt_title/entertainer/stagehand
	id = "AltEntertainerStagehand"
	title = "Stagehand"
	menu_blurb = "A Stagehand typically performs everything the rest of the entertainers don't. Operate lights, shutters, windows, or narrate through your voicebox!"

/datum/prototype/alt_title/entertainer/dancer
	id = "AltEntertainerDancer"
	title = "Dancer"
	menu_blurb = "A Dancer is someone who impresses people through power of their own body! From waltz to breakdance, as long as crowd as cheering!"

/datum/prototype/alt_title/entertainer/singer
	id = "AltEntertainerSinger"
	title = "Singer"
	menu_blurb = "A Singer is someone with gift of melodious voice! Impress people with your vocal range!"

/datum/prototype/alt_title/entertainer/magician
	id = "AltEntertainerMagician"
	title = "Magician"
	menu_blurb = "A Magician is someone who awes those around them with impossible! Show off your repertoire of magic tricks, while keeping the secret hidden!"

/datum/prototype/alt_title/entertainer/comedian
	id = "AltEntertainerComedian"
	title = "Comedian"
	menu_blurb = "A Comedian will focus on making people laugh with the power of wit! Telling jokes, stand-up comedy, you are here to make others smile!"

/datum/prototype/alt_title/entertainer/tragedian
	id = "AltEntertainerTragedian"
	title = "Tragedian"
	menu_blurb = "A Tragedian will focus on making people think about life and world around them! Life is a tragedy, and who's better to convey its emotions than you?"
