params ["_team"];

_team call ARTR_fnc_updateSpawnPoints;

private _permission_name = "respawn_permission_" + str(_team);
missionNamespace setVariable [_permission_name,true,true];

{
	_x setDamage 1;
} forEach ( playableUnits select { side _x == _team && _x getVariable ["hades",false] } );

{
	[_x,1] call BIS_fnc_respawnTickets;
} forEach ( allPlayers select { side group _x == _team && !alive _x } );

sleep 5;
missionNamespace setVariable [_permission_name, false, true];
