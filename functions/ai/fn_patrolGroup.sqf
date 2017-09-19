params ["_marker", "_units", "_waypointID"];

private _pos = markerPos _marker;
private _dir = markerDir _marker;

private _group = [_pos, resistance, _units, [], [], [], [], [], _dir] call BIS_fnc_spawnGroup;
_group setVariable ["patrolWaypointID", _waypointID];

//Set skills
(units _group) call ARTR_fnc_setSkills;

//Set gear
/*
{
	[_x,"guerrilla",typeOf _x] call ARTR_fnc_setIrregularGear;
} forEach (units _group);
*/

[_group] call ARTR_fnc_patrolWaypoints;
