/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//Evacuate task setting
[
	west,
	["","",""],
	nil,
	"ASSIGNED",
	1,
	false,
	"defend",
	false
] call BIS_fnc_taskCreate;

//Enemy wave logic
trigger_wave = [
	"{ alive _x && side _x == east } count allUnits <= 5",
	"call ARTR_fnc_spawnWave"
] call ARTR_fnc_emptyTrigger;
trigger_wave setTriggerTimeout [5,10,30,true];
trigger_wave setTriggerActivation ["NONE","PRESENT",true];

//Call server ending if all players are dead or in the escape zone
trigger_dead = ["{ alive _x && !(vehicle _x inArea tr_escapeZone) } count playableUnits <= 0", "call ARTR_fnc_serverEnding;"] call ARTR_fnc_emptyTrigger;
trigger_dead setTriggerTimeout [5, 5, 5, true];

//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable["ARTR_serverInit", true, true];
