private _possibleGroups = allGroups select { _x getVariable ["attacking", false] && (leader _x) inArea tr_suppressionZone && side _x == east };

private _min = 1;
private _max = count _possibleGroups;

for "_i" from 1 to (_max-_min) do
{
	if (random 1 < 0.5) then
	{
		_possibleGroups deleteAt (_i-1);
	};
};

private _units = [];
{
	_units append (units _x);
} forEach _possibleGroups;

{
	private _unit = _x;
	private _possibleTargets = ([
		suppressionTargets,
		[_unit],
		{
			_input0 distance _x
		},
		"ASCEND",
		{
			((markerPos "mrk_attackCentre") distance _x) < ((markerPos "mrk_attackCentre") distance _input0)
		}
	] call BIS_fnc_sortBy) select [0,4];
	private _target = selectRandom _possibleTargets;

	private _primary = primaryWeapon _x;
	private _primaryRemoved = false;
	if ( { _x == "RPG7_F" || _x == "RPG32_HE_F" } count (backpackItems _unit) > 0 ) then
	{
		if (_primary != "") then {
			_unit removeWeapon _primary;
			_primaryRemoved = true;
		};
	};

	_unit doSuppressiveFire _target;

	if (_primaryRemoved) then
	{
		_weaponBack = [_unit,_primary] spawn
		{
			params ["_unit","_primary"];

			sleep 30;
			_unit addWeapon _primary;
		};
	};
} forEach _units;
