player addAction [
	"<t color='#FF0000'>Report island cleared</t>",
	"[1] remoteExecCall ['ARTR_fnc_advancePhase',2,false];",
	"",
	1,
	false,
	true,
	"",
	"(player == leader group player) && triggerActivated trigger_islandSouth_1 && triggerActivated trigger_islandSouth_2 && triggerActivated trigger_islandNorth_1 && triggerActivated trigger_islandNorth_2 && (missionNamespace getVariable ['mission_phase',0] == 0)"
];
