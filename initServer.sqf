//Update spawn points
{ _x call ARTR_fnc_updateSpawnPoints; } forEach [west, resistance];

//Create tasks
[west, "WESTWin", ["REACH THE GREEN MONOLITH", "CONQUER MONOLITH", "ADVANCE"], green_monolith, "ASSIGNED", 10, true, "attack", false] call BIS_fnc_taskCreate;
[resistance, "GUERWin", ["REACH THE BLUE MONOLITH", "CONQUER MONOLITH", "ADVANCE"], blue_monolith, "ASSIGNED", 10, true, "attack", false] call BIS_fnc_taskCreate;

//Triggers to handle teams dying
tr_bluDead = [
	" { side _x == west && !(_x getVariable ['hades',false]) } count playableUnits <= 0",
	"west spawn ARTR_fnc_respawnPlayers;"
] call ARTR_fnc_emptyTrigger;

tr_grnDead = [
	" { side _x == resistance && !(_x getVariable ['hades',false]) } count playableUnits <= 0",
	"resistance spawn ARTR_fnc_respawnPlayers;"
] call ARTR_fnc_emptyTrigger;
