params ["_team"];

private _otherTeam = [west,resistance] select (_team == west);

private _unitsToMove = playableUnits select { side _x == _otherTeam && !(_x inArea trigger_blue || _x inArea trigger_green) };
private _unitsInHades = playableUnits select { _x inArea trigger_purgatory };
_unitsToMove = _unitsToMove + _unitsInHades;

private _delta = [100,-100] select (_team == resistance);
{
	private _pos = getPosWorld _x;
	_x setPos (_pos vectorAdd [_delta,0,0]);
} forEach [trigger_blue, trigger_green];

{ _x setDamage 1; } forEach _unitsToMove;
