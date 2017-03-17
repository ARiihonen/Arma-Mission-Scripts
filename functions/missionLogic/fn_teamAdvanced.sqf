params ["_team"];

_other_team = [west,resistance] select (_team == west);

_units_to_move = playableUnits select { side _x == _other_team && !(_x inArea trigger_blue || _x inArea trigger_green) };
_units_in_hades = playableUnits select { _x inArea trigger_purgatory };
_units_to_move = _units_to_move + _units_in_hades;

_delta = [100,-100] select (_team == resistance);

{
	_pos = getPos _x;
	_x setPos (_pos vectorAdd [_delta,0,0]);
} forEach [trigger_blue, trigger_green];

_other_team call ARTR_fnc_updateSpawnPoints;

{ _x call ARTR_fnc_setPlayerPosition; } forEach _units_to_move;
{ _x setVariable ["hades",false,true]; } forEach _units_in_hades;
