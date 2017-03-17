/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

/*
//Quit mission if either hostage does not exist
if (isNil "hostageBLU" || isNil "hostageGRN") exitWith
{
	false call ARTR_fnc_serverEnding;
};
*/

private _realMeet = selectRandom ["mrk_meetOne","mrk_meetTwo","mrk_meetThree","mrk_meetFour"];
missionNamespace setVariable ["real_meet_location", _realMeet, true];

//Task creating: [owner, task name/[task name, parent task name], [description, title, marker], destination, state, priority, shownotification, type, shared] call BIS_fnc_taskCreate;

//Hostage team main tasks
[west, "tsk_BLUMain", ["Get the hostage back from the other team. If it turns out impossible, do not let your hostage go.", "Get back prisoner", _realMeet], _realMeet, "ASSIGNED", 2, false, "Meet", true] call BIS_fnc_taskCreate;
[resistance, "tsk_GRNMain", ["Get the hostage back from the other team. If it turns out impossible, do not let your hostage go.", "Get back prisoner", _realMeet], _realMeet, "ASSIGNED", 2, false, "Meet", true] call BIS_fnc_taskCreate;

//Potential extra targets are 50% chance so you can't rely on something being more likely
if (random 1 > 0.5) then
{
	_extraTask = selectRandom [[west],[resistance],[west,resistance]];

	if (west in _extraTask) then
	{
		[west, "tsk_BLUExtra", ["Keep the hostage you have, don't let him go.", "Keep hostage", nil], nil, "CREATED", 1, false, "attack", true] call BIS_fnc_taskCreate;
		["tsk_BLUMain",["Get the hostage back from the other team. If it turns out impossible, kill all of the hostage takers in revenge.", "Get back prisoner", _realMeet]] call BIS_fnc_taskSetDescription;
	};

	if (resistance in _extraTask) then
	{
		[resistance, "tsk_GRNExtra", ["Keep the hostage you have, don't let him go.", "Keep hostage", nil], nil, "CREATED", 1, false, "attack", true] call BIS_fnc_taskCreate;
		["tsk_GRNMain",["Get the hostage back from the other team. If it turns out impossible, kill all of the hostage takers in revenge.", "Get back prisoner", _realMeet]] call BIS_fnc_taskSetDescription;
	};
};

/*
//Hostages tasks
[hostageBLU, "tsk_hosBLU", ["Wherever you end up, you need to stay alive.", "Survive", nil], nil, "ASSIGNED", 2, false, "defend", true] call BIS_fnc_taskCreate;
[hostageBLU, "tsk_hosBLU_H", ["Get back to friendly forces.", "Get home", nil], nil, "CREATED", 1, false, "run", true] call BIS_fnc_taskCreate;

[hostageGRN, "tsk_hosGRN", ["Wherever you end up, you need to stay alive.", "Survive", nil], nil, "ASSIGNED", 2, false, "defend", true] call BIS_fnc_taskCreate;
[hostageGRN, "tsk_hosGRN_H", ["Get back to friendly forces.", "Get home", nil], nil, "CREATED", 1, false, "run", true] call BIS_fnc_taskCreate;

//Spec Ops tasks
_mainTarget = selectRandom [[hostageBLU],[hostageGRN],[hostageBLU,hostageGRN]];
if (hostageGRN in _mainTarget) then
{
	[east, "tsk_REDGRN", ["Capture the GREENFOR hostage, currently in the hands of the BLUFOR unit.", "Capture GRN prisoner", nil], nil, "ASSIGNED", 1, false, "attack", true] call BIS_fnc_taskCreate;
};

if (hostageBLU in _mainTarget) then
{
	[east, "tsk_REDBLU", ["Capture the BLUFOR hostage, currently in the hands of the GREENFOR unit.", "Capture BLU prisoner", nil], nil, "ASSIGNED", 1, false, "attack", true] call BIS_fnc_taskCreate;
};
*/


//Updating tasks example: ["TaskName", "STATE", false] call BIS_fnc_taskSetState;
//Custom task update notification: ["NotificationName", ["Message"]] remoteExec ["BIS_fnc_showNotification", west, false];

//Mission ends when only one team is left alive and on the ground, or all teams have departed (leaving behind everyone still on the ground)
tr_allGone = [
	"{alive _x && !(_x getVariable ['ARTR_leftBehind',false])} count allPlayers <= 0",
	"true call ARTR_fnc_serverEnding"
] call ARTR_fnc_emptyTrigger;

//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable["ARTR_serverInit", true, true];
