/turf/simulated/flesh
	name = "flesh wall"
	desc = "The fleshy surface of this wall squishes nicely under your touch but looks and feels extremly strong"
	icon = 'icons/turf/stomach_vr.dmi'
	icon_state = "flesh"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/flesh/colour
	name = "flesh wall"
	desc = "The fleshy surface of this wall squishes nicely under your touch but looks and feels extremly strong"
	icon = 'icons/turf/stomach_vr.dmi'
	icon_state = "colorable-wall"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/flesh/attackby()
	return

/turf/simulated/flesh/Initialize(mapload)
	. = ..()
	update_icon(1)	//TODO: TG icon smoothing

var/list/flesh_overlay_cache = list()

/turf/simulated/flesh/update_icon(var/update_neighbors)
	cut_overlays()

	if(density)
		icon = 'icons/turf/stomach_vr.dmi'
		icon_state = "flesh"
		for(var/direction in GLOB.cardinal)
			var/turf/T = get_step(src,direction)
			if(istype(T) && !T.density)
				var/place_dir = turn(direction, 180)
				if(!flesh_overlay_cache["flesh_side_[place_dir]"])
					flesh_overlay_cache["flesh_side_[place_dir]"] = image('icons/turf/stomach_vr.dmi', "flesh_side", dir = place_dir)
				add_overlay(flesh_overlay_cache["flesh_side_[place_dir]"])

	if(update_neighbors)
		for(var/direction in GLOB.alldirs)
			if(istype(get_step(src, direction), /turf/simulated/flesh))
				var/turf/simulated/flesh/F = get_step(src, direction)
				F.update_icon()

/turf/simulated/bone
	name = "bone wall"
	desc = "This wall of aging bones is held together by sinew and dried gore. The empty eye sockets stare back at you."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "bone"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/bone/attackby()
	return

/turf/simulated/bone/Initialize(mapload)
	. = ..()
	update_icon(1)	//TODO: TG icon smoothing

var/list/bone_overlay_cache = list()

/turf/simulated/bone/update_icon(var/update_neighbors)
	cut_overlays()

	if(density)
		icon = 'icons/turf/wall_masks.dmi'
		icon_state = "bone"
		for(var/direction in GLOB.cardinal)
			var/turf/T = get_step(src,direction)
			if(istype(T) && !T.density)
				var/place_dir = turn(direction, 180)
				if(!bone_overlay_cache["bone[place_dir]"])
					bone_overlay_cache["bone[place_dir]"] = image('icons/turf/wall_masks.dmi', "bone", dir = place_dir)
				add_overlay(bone_overlay_cache["bone[place_dir]"])

	if(update_neighbors)
		for(var/direction in GLOB.alldirs)
			if(istype(get_step(src, direction), /turf/simulated/bone))
				var/turf/simulated/bone/F = get_step(src, direction)
				F.update_icon()
