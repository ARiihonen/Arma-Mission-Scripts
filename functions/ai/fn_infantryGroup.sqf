params ["_marker", "_units", "_syncTime"];

private _pos = markerPos _marker;
private _dir = markerDir _marker;

private _group = [_pos, EAST, _units, [], [], [], [], [], _dir] call BIS_fnc_spawnGroup;

//Set skills
(units _group) call ARTR_fnc_setSkills;

//Set gear
{
	[_x] call ARTR_fnc_setIrregularGear;
} forEach (units _group);

[_group,_marker,_syncTime] call ARTR_fnc_enemyAttack;
