/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//Evacuate task setting
[
	west,
	"tsk_evacuate",
	["Evacuate the base: save as much gear as you can, and destroy the rest","Evacuate","mrk_attackCentre"],
	"mrk_attackCentre",
	"ASSIGNED",
	2,
	false,
	"defend",
	false
] call BIS_fnc_taskCreate;

//Spawn new units when there are some in the queue and there aren't too many
tr_queue = [
	"(count (call activeGroups) < call maxGroups) && count spawnQueue > 0",
	"call ARTR_fnc_handleQueue; deleteVehicle thisTrigger;"
] call ARTR_fnc_emptyTrigger;

//Restrict operating area for AI
trigger_areaRestriction = [
	"{ isNull objectParent (leader _x) && side _x == east && !(leader _x inArea tr_enemyArea)} count allGroups >= 0",
	"{ {_x setDamage 1;} forEach (units _x); } forEach (allGroups select { isNull objectParent (leader _x) && side _x == east && !(leader _x inArea tr_enemyArea) });"
] call ARTR_fnc_emptyTrigger;
trigger_areaRestriction setTriggerActivation ["NONE","PRESENT",true];

//Call server ending if all players are dead or in the escape zone
trigger_dead = ["{ alive _x && !(vehicle _x inArea tr_targetZone) } count playableUnits <= 0", "call ARTR_fnc_serverEnding;"] call ARTR_fnc_emptyTrigger;
trigger_dead setTriggerTimeout [5, 5, 5, true];

//Init suppression targets
private _suppressionTargetPositions = [];
{
	_suppressionTargetPositions pushBack (getPosASL _x);
	deleteVehicle _x;
} forEach suppressionTargets;
suppressionTargets = _suppressionTargetPositions;
publicVariable "suppressionTargets";

//Init destroy objects
destroyObjects = destroyObjects apply {
	[_x, ([dummyOne,dummyTwo] select (dummyOne distance _x > dummyTwo distance _x))]
};
diag_log format ["destroyObjects: %1", destroyObjects];
_buildingDestroyEH = addMissionEventHandler [
	"BuildingChanged",
	{
		params ["_old","_new","_isRuin"];
		if (typeOf _old == "Land_dp_smallTank_F" && _isRuin) then
		{
			private _dummy = [dummyOne,dummyTwo] select (dummyOne distance _new > dummyTwo distance _new);
			{
				deleteVehicle (_x select 0);
			} forEach (destroyObjects select { (_x select 1) == _dummy});
		};
	}
];


//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable["ARTR_serverInit", true, true];
