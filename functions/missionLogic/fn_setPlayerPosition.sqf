params ["_unit"];

private _counter_name = "respawn_counter_" + str(side _unit);
private _spawn_points = call compile ("active_spawns_" + str(side _unit));

private _index = missionNamespace getVariable [_counter_name, 0];
private _new_index = _index + 1;
missionNamespace setVariable [_counter_name, _new_index, false];

if (count _spawn_points >= _index + 1) then
{
	_unit setPos (_spawn_points select _index);
};

if (side _unit == west) then
{
	_unit setDir 270;
} else {
	_unit setDir 90;
};
