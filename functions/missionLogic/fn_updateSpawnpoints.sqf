params ["_spawnObjectType"];

private _spawnObjects = allMissionObjects _spawnObjectType;

private _otherTeam = [west,resistance] select (side player == west);
private _targetMonolith = [green_monolith,blue_monolith] select (side player == west);

private _otherPlayers = playableUnits select { side _x == _otherTeam && !(_x getVariable ["hades",false]) };

private _position = MIDDLE_POSITION;
if ( count _otherPlayers > 0 ) then
{

	_position = getPosWorld ( ([_otherPlayers,[_targetMonolith],{_x distance _input0},"DESCEND"] call BIS_fnc_sortBy) select 0);

} else {
	private _lastPosName = "last_pos_" + str(_otherTeam);
	if (!isNil {(missionNamespace getVariable [_lastPosName, nil])} ) then
	{
		_position = missionNamespace getVariable _lastPosName;
	};
};

if (_otherTeam == resistance) then
{
	_position = _position vectorAdd [BLUE_SPAWNDELTA,0,0];
} else {
	_position = _position vectorAdd [GREEN_SPAWNDELTA,0,0];
};

private _activeList = _spawnObjects select {
	(_x distance _targetMonolith) > (_position distance _targetMonolith)
};

_activeList = [
	_activeList,
	[_targetMonolith],
	{ _x distance _input0 },
	"ASCEND"
] call BIS_fnc_sortBy;

_activeList;
