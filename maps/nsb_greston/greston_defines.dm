//Turfmakers
#define LUMOS4_SET_ATMOS	initial_gas_mix = ATMOSPHERE_ID_LUMOS4
#define LUMOS4_TURF_CREATE(x)	x/lumos4/initial_gas_mix = ATMOSPHERE_ID_LUMOS4;x/lumos4/outdoors=TRUE;x/lumos4/allow_gas_overlays = FALSE
#define LUMOS4_TURF_CREATE_UN(x)	x/lumos4/initial_gas_mix=ATMOSPHERE_ID_LUMOS4

//Normal map defs
#define Z_LEVEL_SURFACE_UNDER				1
#define Z_LEVEL_SURFACE_LOW					2
#define Z_LEVEL_SURFACE_MID					3
#define Z_LEVEL_SURFACE_HIGH				4
#define Z_LEVEL_MINES						5
#define Z_LEVEL_REACTOR						6
#define Z_LEVEL_CENTCOM						7
#define Z_LEVEL_MISC						8
#define Z_LEVEL_SHIPS						9
//Camera networks
#define NETWORK_GRESTON "Greston"
#define NETWORK_TCOMMS "Telecommunications" //Using different from Polaris one for better name
#define NETWORK_OUTSIDE "Outside"
#define NETWORK_EXPLORATION "Exploration"
#define NETWORK_XENOBIO "Xenobiology"

/datum/map/greston
	name = "Lumos"
	full_name = "NSB Greston"
	path = "greston"

	use_overmap = FALSE
	//overmap_z = //Z_LEVEL_MISC
	//overmap_size = //20

	zlevel_datum_type = /datum/map_z_level/greston

	lobby_icon = 'icons/misc/title_vr.dmi'
	lobby_screens = list("title1", "title2", "title3", "title4", "title5", "title6", "title7")
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi' //CITADEL CHANGE: Ignore this line because it's going to be overriden in modular_citadel\maps\greston\greston_defines.dm

	holomap_smoosh = list(list(
		Z_LEVEL_SURFACE_UNDER,
		Z_LEVEL_SURFACE_LOW,
		Z_LEVEL_SURFACE_MID,
		Z_LEVEL_SURFACE_HIGH))

	station_name  = "NSB Greston"
	station_short = "Greston"
	dock_name     = "Lumos-4 Colony"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Lumos"

	shuttle_docked_message = "The scheduled Orange Line tram to the %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Orange Line tram has left the station. Estimate %ETA% until the tram arrives at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to the %dock_name% is occuring. The tram will be arriving shortly. Those departing should proceed to the Orange Line tram station within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The evacuation tram has arrived at the tram station. You have approximately %ETD% to board the tram."
	emergency_shuttle_leaving_dock = "The emergency tram has left the station. Estimate %ETA% until the shuttle arrives at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has begun, and an off-schedule tram has been called. It will arrive at the tram station in approximately %ETA%."
	emergency_shuttle_recall_message = "The evacuation tram has been recalled."

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIRCUITS,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_EXPLORATION,
							//NETWORK_DEFAULT,  //Is this even used for anything? Robots show up here, but they show up in ROBOTS network too,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_OUTSIDE,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_ROBOTS,
							NETWORK_SECURITY,
							NETWORK_TCOMMS,
							NETWORK_GRESTON
							)
	secondary_networks = list(
							NETWORK_ERT,
							NETWORK_MERCENARY,
							NETWORK_THUNDER,
							NETWORK_COMMUNICATORS,
							NETWORK_ALARM_ATMOS,
							NETWORK_ALARM_POWER,
							NETWORK_ALARM_FIRE
							)

	bot_patrolling = FALSE

	allowed_spawns = list("Tram Station","Gateway","Cryogenic Storage","Cyborg Storage")
	spawnpoint_died = /datum/spawnpoint/tram
	spawnpoint_left = /datum/spawnpoint/tram
	spawnpoint_stayed = /datum/spawnpoint/cryo

	meteor_strike_areas = list(/area/greston/surfacebase/outside/outside3)

	default_skybox = /datum/skybox_settings/greston

	unit_test_exempt_areas = list(
		/area/greston/surfacebase/outside/outside1,
		/area/vacant/vacant_site,
		/area/vacant/vacant_site/east,
		/area/crew_quarters/sleep/Dorm_1/holo,
		/area/crew_quarters/sleep/Dorm_3/holo,
		/area/crew_quarters/sleep/Dorm_5/holo,
		/area/crew_quarters/sleep/Dorm_7/holo)
	unit_test_exempt_from_atmos = list(
		/area/engineering/atmos/intake, // Outside,
		/area/rnd/external, //  Outside,
		/area/greston/surfacebase/mining_main/external, // Outside,
		/area/greston/surfacebase/mining_main/airlock, //  Its an airlock,
		/area/greston/surfacebase/emergency_storage/rnd,
		/area/greston/surfacebase/emergency_storage/atrium)

	lateload_z_levels = list(
		list("Greston - Misc","Greston - Ships","Greston - Mines") //Stock greston lateload maps
	)

	ai_shell_restricted = TRUE
	ai_shell_allowed_levels = list(
		Z_LEVEL_SURFACE_UNDER,
		Z_LEVEL_SURFACE_LOW,
		Z_LEVEL_SURFACE_MID,
		Z_LEVEL_SURFACE_HIGH,
		Z_LEVEL_MINES,
		Z_LEVEL_REACTOR,
		Z_LEVEL_CENTCOM,
		Z_LEVEL_MISC,
		Z_LEVEL_SHIPS
		)

	lateload_single_pick = null //Nothing right now.

/datum/map/greston/perform_map_generation()
/*
	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_SURFACE_MINE, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_SURFACE_MINE, 64, 64)         // Create the mining ore distribution map.
*/
	return 1

/datum/skybox_settings/greston
	icon_state = "space5"
	use_stars = FALSE

/datum/planet/lumos4
	expected_z_levels = list(
		Z_LEVEL_SURFACE_UNDER,
		Z_LEVEL_SURFACE_LOW,
		Z_LEVEL_SURFACE_MID,
		Z_LEVEL_SURFACE_HIGH,
		Z_LEVEL_MINES,
		Z_LEVEL_REACTOR
	)

// Short range computers see only the four main levels, others can see the surrounding surface levels.
/datum/map/greston/get_map_levels(var/srcz, var/long_range = TRUE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz == Z_LEVEL_SHIPS || srcz == Z_LEVEL_MISC)
		return list() //no longer return signals in key transit levels, this means some runtimes from CWCs but
	else if (srcz >= Z_LEVEL_SURFACE_UNDER && srcz <= Z_LEVEL_SURFACE_HIGH)
		return list(
			Z_LEVEL_SURFACE_UNDER,
			Z_LEVEL_SURFACE_LOW,
			Z_LEVEL_SURFACE_MID,
			Z_LEVEL_SURFACE_HIGH
			)
	else
		return list(srcz) //may prevent runtimes, but more importantly gives gps units a shortwave-esque function

// Overmap represetation of greston
/obj/effect/overmap/visitable/sector/lumos4
	name = "Lumos 4"
	desc = "A once bustling mining colony, this place has since been shuttered due to multiple accidents and unexplained issues. NanoTrasen has now converted this to a research facility to study incorporeal concepts."
	scanner_desc = @{"[i]Registration[/i]: NSB Greston
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), NanoTrasen IFF
[b]Notice[/b]: NanoTrasen Base, authorized personnel only"}
	base = 1
	icon_state = "globe"
	color = "#d35b5b"
	initial_generic_waypoints = list(
		"greston_dockarm_d1a1", //Bottom left
		"greston_dockarm_d1a2", //Top left
		"greston_dockarm_d1a3", //Left on inside
		"greston_dockarm_d2a1", //Bottom right
		"greston_dockarm_d2a2", //Top right
		"greston_dockarm_d1l", //End of left arm
		"greston_dockarm_d2l", //End of right arm
		"greston_excursion_hangar", //Excursion shuttle hangar
		)

// For making the 6-in-1 holomap, we calculate some offsets
#define greston_MAP_SIZE 140 // Width and height of compiled in greston z levels.
#define greston_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define greston_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*greston_MAP_SIZE) - greston_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define greston_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (3*greston_MAP_SIZE)) / 2) // 60

// We have a bunch of stuff common to the station z levels
/datum/map_z_level/greston/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_XENOARCH_EXEMPT
	holomap_legend_x = 220
	holomap_legend_y = 160

	/datum/map_z_level/greston/station/surface_under
		z = Z_LEVEL_SURFACE_UNDER
		name = "Surface 1"
		flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_XENOARCH_EXEMPT
		base_turf = /turf/simulated/floor/outdoors/rocks/lumos4
		holomap_offset_x = greston_HOLOMAP_MARGIN_X
		holomap_offset_y = greston_HOLOMAP_MARGIN_Y + greston_MAP_SIZE*0

/datum/map_z_level/greston/station/surface_low
	z = Z_LEVEL_SURFACE_LOW
	name = "Surface 1"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/floor/outdoors/rocks/lumos4
	holomap_offset_x = greston_HOLOMAP_MARGIN_X
	holomap_offset_y = greston_HOLOMAP_MARGIN_Y + greston_MAP_SIZE*0

/datum/map_z_level/greston/station/surface_mid
	z = Z_LEVEL_SURFACE_MID
	name = "Surface 2"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/open
	holomap_offset_x = greston_HOLOMAP_MARGIN_X
	holomap_offset_y = greston_HOLOMAP_MARGIN_Y + greston_MAP_SIZE*1

/datum/map_z_level/greston/station/surface_high
	z = Z_LEVEL_SURFACE_HIGH
	name = "Surface 3"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/open
	holomap_offset_x = greston_HOLOMAP_MARGIN_X
	holomap_offset_y = greston_HOLOMAP_MARGIN_Y + greston_MAP_SIZE*2

/datum/map_z_level/greston/mine
	z = Z_LEVEL_MINES
	name = "Old Mining"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	base_turf = /turf/simulated/floor/outdoors/rocks/lumos4

/datum/map_z_level/greston/reactor
	z = Z_LEVEL_REACTOR
	name = "Nuclear Reactor"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER
	base_turf = /turf/simulated/floor/outdoors/rocks/lumos4

/datum/map_z_level/greston/colony
	z = Z_LEVEL_CENTCOM
	name = "Colony"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_z_level/greston/ships
	z = Z_LEVEL_SHIPS
	name = "Misc"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_z_level/greston/misc
	z = Z_LEVEL_MISC
	name = "Misc"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_XENOARCH_EXEMPT
