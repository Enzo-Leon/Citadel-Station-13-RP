#if !defined(USING_MAP_DATUM)

	#include "greston_defines.dm"
	#include "greston_turfs.dm"
	#include "greston_things.dm"
	#include "greston_phoronlock.dm"
	#include "greston_areas.dm"
	#include "greston_areas2.dm"
	#include "greston_shuttle_defs.dm"
	#include "greston_shuttles.dm"
	#include "greston_telecomms.dm"

	#if !AWAY_MISSION_TEST //Don't include these for just testing away missions
		#include "../../_maps/map_files/greston/greston-01-surfaceb.dmm"
		#include "../../_maps/map_files/greston/greston-02-surface1.dmm"
		#include "../../_maps/map_files/greston/greston-03-surface2.dmm"
		#include "../../_maps/map_files/greston/greston-04-surface3.dmm"
		#include "../../_maps/map_files/greston/greston-05-colony.dmm"
		#include "../../_maps/map_files/greston/greston-06-mining.dmm"
		#include "../../_maps/map_files/greston/greston-07-reactor.dmm"
	#endif

	#include "submaps/_greston_submaps.dm"

	#define USING_MAP_DATUM /datum/map/greston

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring greston

#endif
