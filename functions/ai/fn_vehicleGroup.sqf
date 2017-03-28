params ["_marker","_vehicleType","_syncTime"];

private _pos = markerPos _marker;
private _dir = markerDir _marker;

private _vehicle = createVehicle [_vehicleType, _pos, [], 0, "NONE"];
_vehicle setDir _dir;

private _group = [_pos, EAST, ([["O_G_Soldier_lite_F"],["O_G_Soldier_TL_F","O_G_Soldier_lite_F"]] select (_vehicleType == "O_G_Offroad_01_armed_F")), [], [], [], [], [], _dir] call BIS_fnc_spawnGroup;

{
	switch (_forEachIndex) do
	{
		case 0: {
			_x assignAsDriver _vehicle;
			_x moveInDriver _vehicle;
		};

		case 1: {
			_x assignAsGunner _vehicle;
			_x moveInGunner _vehicle;
		};

		default {
			_x assignAsCargo _vehicle;
			_x moveInCargo _vehicle;
		};
	}
} forEach (units _group);

//Set skills
(units _group) call ARTR_fnc_setSkills;

//Set gear
{
	[_x] call ARTR_fnc_setIrregularGear;
} forEach (units _group);

if (_vehicleType != "O_G_Offroad_01_armed_F") then
{
	private _newTrigger = createTrigger ["EmptyDetector", getPosWorld _vehicle, false];

	_newTrigger setVariable ["vehicle", _vehicle, false];
	_newTrigger attachTo [_vehicle,[0,0,0]];

	_newTrigger setTriggerActivation ["West", "Present", false];
	_newTrigger setTriggerArea [5,5,0,false,5];
	_newTrigger setTriggerType "NONE";
	_newTrigger setTriggerTimeout [0,1,3,true];
	_newTrigger setTriggerStatements [
		"this || !canMove (thisTrigger getVariable 'vehicle') || !alive (driver (thisTrigger getVariable 'vehicle'))",
		"[thisTrigger getVariable 'vehicle'] call ARTR_fnc_VBIED;",
		""
	];

	{
		private _unit = _x;
		{
			_unit disableAI _x;
		} forEach ["TARGET","AUTOTARGET","FSM","AIMINGERRO","SUPPRESSION","CHECKVISIBLE","COVER","AUTOCOMBAT"];
	} forEach (units _group);

	_explosionWaypoint = _group addWaypoint [markerPos "mrk_VBIEDCentre", 50];
	_explosionWaypoint setWaypointType "SAD";
	_explosionWaypoint setWaypointCombatMode "BLUE";
	_explosionWaypoint setWaypointSpeed "FULL";
	_explosionWaypoint setWaypointBehaviour "AWARE";
	_explosionWaypoint setWaypointStatements [
		"true || !alive this || !canMove(vehicle this)",
		"[this] call ARTR_fnc_VBIED;"
	];

	_group setCurrentWaypoint _explosionWaypoint;
} else {
	[_group,_marker,_syncTime] call ARTR_fnc_enemyAttack;
};
