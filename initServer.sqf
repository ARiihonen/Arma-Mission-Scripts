/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/
//Creating tasks
[west, "ProtectTask", ["Protect the supply stashes in the area until relief comes in", "Guard Duty", ""], nil, "ASSIGNED", 2, false, "search", false] call BIS_fnc_taskCreate;
[east, "InfiltrateTask", ["Infiltrate the area and tag at least half of the supply boxes without being noticed", "Infiltration", ""], nil, "ASSIGNED", 2, false, "intel", false] call BIS_fnc_taskCreate;
[east, "ExfilTask", ["Escape the area without being captured or killed", "Exfiltration", ""], nil, "CREATED", 1, false, "exit", false] call BIS_fnc_taskCreate;

//Create trigger to detect and change infiltration task status
trigger_tracking = createTrigger ["EmptyDetector", [0,0,0], false];
trigger_tracking setTriggerActivation ["NONE", "PRESENT", true];
trigger_tracking setTriggerStatements [
	"
		({ alive _x && _x getVariable ['tracked', false] } count boxes >= ({ side (group _x) == west && isPlayer _x } count allUnits))",
	"
		['InfiltrateTask', 'SUCCEEDED', false] call BIS_fnc_taskSetState;
		['TaskSucceeded', ['Minimum tracker amount met']] remoteExecCall ['BIS_fnc_showNotification', east, false];
	",
	"
		['InfiltrateTask', 'ASSIGNED', false] call BIS_fnc_taskSetState;
		['TaskAssigned', ['Insufficient trackers online']] remoteExecCall ['BIS_fnc_showNotification', east, false];
	"
];

//Triggers to show UAV time ending notification for OPFOR players
_uavEnding = missionNamespace getVariable ['uav_end', (60*60)];
trigger_uavTen = [
	"true",
	"['UAVTimeout', ['10 minutes']] remoteExecCall ['BIS_fnc_showNotification', east, false];",
	""
] call ARTR_fnc_emptyTrigger;
trigger_uavTen setTriggerTimeout [_uavEnding-10*60,_uavEnding-10*60,_uavEnding-10*60,false];

trigger_uavFive = [
	"true",
	"['UAVTimeout', ['5 minutes']] remoteExecCall ['BIS_fnc_showNotification', east, false];",
	""
] call ARTR_fnc_emptyTrigger;
trigger_uavFive setTriggerTimeout [_uavEnding-5*60,_uavEnding-5*60,_uavEnding-5*60,false];

trigger_uavOne = [
	"true",
	"['UAVTimeout', ['1 minute']] remoteExecCall ['BIS_fnc_showNotification', east, false];",
	""
] call ARTR_fnc_emptyTrigger;
trigger_uavOne setTriggerTimeout [_uavEnding-1*60,_uavEnding-1*60,_uavEnding-1*60,false];

trigger_uavDone = [
	"true",
	"['UAVEnd', []] remoteExecCall ['BIS_fnc_showNotification', east, false];
	missionNamespace setVariable ['uav_done', true, true];",
	""
] call ARTR_fnc_emptyTrigger;
trigger_uavDone setTriggerTimeout [_uavEnding,_uavEnding,_uavEnding,false];


//End mission triggers

//End mission if either side is dead
trigger_dead = [
	"({ side _x == west } count playableUnits == 0 || { side _x == east } count playableUnits == 0) && !(missionNamespace getVariable ['ARTR_serverEnding', false])",
	"call ARTR_fnc_serverEnding;",
	""
] call ARTR_fnc_emptyTrigger;

//End mission if redfor exfiltrate
trigger_exfil = [
	"( triggerActivated tr_missionActive && { !(_x in insertion) && side _x == east } count playableUnits <= 0 ) || ( !canMove insertion && { side _x == east && _x inArea tr_operationArea } count playableUnits == 0 ) && !(missionNamespace getVariable ['ARTR_serverEnding', false])",
	"call ARTR_fnc_serverEnding;",
	""
] call ARTR_fnc_emptyTrigger;

//add event handlers to detect killed AI defenders
{
	_x addEventHandler ["Hit", "_this call ARTR_fnc_defenderHit;"];
	_x addEventHandler ["Killed", "_this call ARTR_fnc_defenderKilled;"];
} forEach (allUnits select { side _x == west && !isPlayer _x });

{
	_x setVariable ["R3D_LOG_Disabled", true, true];
	_x setVariable ["ace_cookoff_enable", false, true];
} forEach boxes;

missionNamespace setVariable ["authorizedPlayers", call BIS_fnc_listPlayers, true];

//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable ["ARTR_serverInit", true, true];
