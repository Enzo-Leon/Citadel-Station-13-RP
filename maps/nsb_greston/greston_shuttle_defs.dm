//////////////////////////////////////////////////////////////
// Escape shuttle and pods
/datum/shuttle/autodock/ferry/emergency/escape
	name = "Escape"
	location = FERRY_LOCATION_OFFSITE
	shuttle_area = /area/shuttle/escape
	warmup_time = 10
	landmark_offsite = "escape_cc"
	landmark_station = "escape_station"
	landmark_transition = "escape_transit"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

//////////////////////////////////////////////////////////////
/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod1
	name = "Large Escape Pod 1"
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/large_escape_pod1
	warmup_time = 0
	landmark_station = "escapepod1_station"
	landmark_offsite = "escapepod1_cc"
	landmark_transition = "escapepod1_transit"
	docking_controller_tag = "large_escape_pod_1"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

//////////////////////////////////////////////////////////////
// Supply shuttle
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	location = FERRY_LOCATION_OFFSITE
	shuttle_area = /area/shuttle/supply
	warmup_time = 10
	landmark_offsite = "supply_cc"
	landmark_station = "supply_station"
	docking_controller_tag = "supply_shuttle"
	flags = SHUTTLE_FLAGS_PROCESS|SHUTTLE_FLAGS_SUPPLY

//////////////////////////////////////////////////////////////
// Trade Ship
/datum/shuttle/autodock/multi/trade
	name = "Trade"
	current_location = "cc_trade_dock"
	shuttle_area = /area/shuttle/trade
	docking_controller_tag = "trade_shuttle"
	warmup_time = 10	//want some warmup time so people can cancel.
	destination_tags = list(
		"cc_trade_dock",
		"greston_dockarm_d1l",
		"nav_aerostat_south",
		"nav_beach_e",
		"nav_beach_c",
		"nav_beach_nw"
	)

//////////////////////////////////////////////////////////////
// greston Shuttle
/datum/shuttle/autodock/ferry/greston_backup
	name = "greston Backup"
	location = FERRY_LOCATION_OFFSITE	 // Offsite is the surface hangar
	warmup_time = 5
	move_time = 45
	landmark_offsite = "greston_backup_low"
	landmark_station = "greston_dockarm_d1a3"
	landmark_transition = "greston_backup_transit"
	shuttle_area = /area/shuttle/greston
	docking_controller_tag = "greston_shuttle"


//////////////////////////////////////////////////////////////
// ERT Shuttle
/datum/shuttle/autodock/multi/specialops
	name = "NDV Phantom"
	can_cloak = TRUE
	cloaked = FALSE
	warmup_time = 8
	move_time = 60
	current_location = "specops_base"
	landmark_transition = "specops_transit"
	shuttle_area = /area/shuttle/specialops
	destination_tags = list(
		)
	docking_controller_tag = "specops_shuttle_hatch"
	announcer = "Automated Traffic Control"
	arrival_message = "Attention. An NT support vessel is approaching Lumos-4."
	departure_message = "Attention. A NT support vessel is now leaving Lumos-4."

//////////////////////////////////////////////////////////////
// RogueMiner "Belter: Shuttle
// TODO - Not implemented yet on new map

/datum/shuttle/autodock/ferry/belter
	name = "Belter"
	location = FERRY_LOCATION_STATION
	warmup_time = 6
	move_time = 30
	shuttle_area = /area/shuttle/belter
	landmark_station = "belter_station"
	landmark_offsite = "belter_zone1"
	landmark_transition = "belter_transit"
	docking_controller_tag = "belter_docking"

/datum/shuttle/autodock/ferry/belter/New()
	move_time = move_time + rand(-10 SECONDS, 20 SECONDS) //50sec max, 20sec min.
	..()


//////////////////////////////////////////////////////////////
// CC Lewdship shuttle
// DISABLED - cruiser has been removed entirely
/*
/datum/shuttle/autodock/ferry/cruiser_shuttle
	name = "Cruiser Shuttle"
	location = 1
	warmup_time = 10	//want some warmup time so people can cancel.
	area_offsite = /area/shuttle/cruiser/cruiser
	area_station = /area/shuttle/cruiser/station
	docking_controller_tag = "cruiser_shuttle"
	dock_target_station = "d1a1_dock"
	dock_target_offsite = "cruiser_shuttle_bay"
*/
