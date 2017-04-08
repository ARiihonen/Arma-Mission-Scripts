/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//Task creating: [owner, task name/[task name, parent task name], [description, title, marker], destination, state, priority, shownotification, type, shared] call BIS_fnc_taskCreate;

//Updating tasks example: ["TaskName", "STATE", false] call BIS_fnc_taskSetState;
//Custom task update notification: ["NotificationName", ["Message"]] remoteExec ["BIS_fnc_showNotification", west, false];

//Call server ending if all players are dead
trigger_dead = ["{ alive _x } count playableUnits <= 0", "call ARTR_fnc_serverEnding;"] call ARTR_fnc_emptyTrigger;
trigger_dead setTriggerTimeout [5, 5, 5, true];

//Air alert EH
{
	private _index = _x addEventHandler [
		"Fired",
		{
			params ["_unit","_object","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

			if (_weapon in ["LMG_Minigun_Transport2","gatling_20mm_VTOL_01","autocannon_40mm_VTOL_01","cannon_105mm_VTOL_01","gatling_30mm_VTOL_02"]) then
			{
				["Air"] call ARTR_fnc_alert;
				thunder removeEventHandler ["Fired",thunder getVariable "FiredEHIndex"];
				lightning removeEventHandler ["Fired",lightning getVariable "FiredEHIndex"];
			};
		}
	];
	_x setVariable ["FiredEHIndex", _index];
} forEach [thunder,lightning];


//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable["ARTR_serverInit", true, true];
