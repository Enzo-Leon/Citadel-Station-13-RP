// This causes PoI maps to get 'checked' and compiled, when undergoing a unit test.
// This is so Travis can validate PoIs, and ensure future changes don't break PoIs, as PoIs are loaded at runtime and the compiler can't catch errors.
// When adding a new PoI, please add it to this list.

/datum/map_template/lostships
	name = "POI - Space Content"
	desc = "A map template base.  In space for derelicts."

// To be added: Templates for space exploration when they are made.
