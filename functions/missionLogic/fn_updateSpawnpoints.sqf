params ["_team"];

private _team_name = str(_team);
private _other_team = [west,resistance] select (_team == west);
private _monolith = [blue_monolith,green_monolith] select (_team == resistance);
private _monolithName = ["blue_monolith","green_monolith"] select (_team == resistance);
private _spawn_points = [RESPAWNS_BLUE,RESPAWNS_GREEN] select (_team == resistance);

private _other_players = playableUnits select { side _x == _other_team && !(_x getVariable ["hades",false]) };
private _counter_name = "respawn_counter_" + _team_name;

private _position = MIDDLE_POSITION;
if ( count _other_players > 0 ) then
{

	_position = getPos ( ([_other_players,[_monolith],{_x distance _input0},"ASCEND"] call BIS_fnc_sortBy) select 0);

} else {
	_var = "last_pos_" + _team_name;
	if (!isNil {(missionNamespace getVariable [_var, nil])} ) then
	{
		_position = missionNamespace getVariable _var;
	};
};

if (_team == west) then
{
	_position = _position vectorAdd [BLUE_SPAWNDELTA,0,0];
} else {
	_position = _position vectorAdd [GREEN_SPAWNDELTA,0,0];
};

call compile format [
	"active_spawns_%1 = [ (%2 select { (_x distance %4) < (%3 distance %4) }), [], { _x distance %4 }, 'DESCEND'] call BIS_fnc_sortBy;",
	_team_name,
	_spawn_points,
	_position,
	_monolithName
];

missionNamespace setVariable [_counter_name, 0, false];
