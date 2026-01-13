/proc/create_objects_in_loc(atom/loc, alist/item_paths)
	if(!istype(loc))
		CRASH("Inappropriate loction given.")
	if(!istype(item_paths))
		CRASH("Inappropriate item path list given.")

	for(var/item_path, count in item_paths)
		for(var/i in 1 to count)
			new item_path(loc)
