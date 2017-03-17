tr_areaRestriction = [
	"alive player && !(player inArea trigger_area || player inArea trigger_bluearea || player inArea trigger_greenarea || player inArea trigger_purgatory)",
	"[] spawn ARTR_fnc_areaRestriction;"
] call ARTR_fnc_emptyTrigger;
tr_areaRestriction setTriggerTimeout [2,2,2,true];
tr_areaRestriction setTriggerActivation ["NONE", "PRESENT", true];

call ARTR_fnc_environmentInit;
