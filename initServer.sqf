/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//Task creating: [owner, task name/[task name, parent task name], [description, title, marker], destination, state, priority, shownotification, type, shared] call BIS_fnc_taskCreate;
[
	independent,
	"tsk_clr",
	[
		"Destroy the FIA forces surrounded in the construction site.",
		"Clear Enemies",
		"mrk_buildings"
	],
	"mrk_buildings",
	true,
	1,
	false,
	"attack",
	true
] call BIS_fnc_taskCreate;

//Updating tasks example: ["TaskName", "STATE", false] call BIS_fnc_taskSetState;
//Custom task update notification: ["NotificationName", ["Message"]] remoteExec ["BIS_fnc_showNotification", west, false];

//Call server ending if all players are dead
trigger_dead = ["{ alive _x } count playableUnits <= 0", "call ARTR_fnc_serverEnding;"] call ARTR_fnc_emptyTrigger;
trigger_dead setTriggerTimeout [5, 5, 5, true];

//If ACE Medical is present, add another trigger to fail if all living players have been unconscious for too long
if ("ace_medical" call ARTR_fnc_checkMod) then
{
	trigger_unconscious = ["{ !(_x getVariable ['ACE_isUnconscious', false]) } count playableUnits <= 0", "call ARTR_fnc_serverEnding;"] call ARTR_fnc_emptyTrigger;
	trigger_unconscious setTriggerTimeout [20, 20, 20, true];
};

//Sleep for 10-30 seconds and call server ending if all enemies dead
trigger_clear = ["{ side _x == WEST } count allUnits <= 0", "call ARTR_fnc_serverEnding;"] call ARTR_fnc_emptyTrigger;
trigger_clear setTriggerTimeout [10, 15, 30, false];

trigger_almostClear = [
	"{side _x == WEST} count allUnits <= 1",
	"{ _x setDamage 1 } forEach (allUnits select { side _x == WEST})"
] call ARTR_fnc_emptyTrigger;
trigger_almostClear setTriggerTimeout [30,30,30, false];

//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable["ARTR_serverInit", true, true];
