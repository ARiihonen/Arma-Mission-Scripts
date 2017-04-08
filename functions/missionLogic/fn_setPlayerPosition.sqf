private _spawnObjects = (["B_TargetSoldier","I_TargetSoldier"] select (side player == resistance)) call ARTR_fnc_updateSpawnPoints;
private _spawnIndex = (units group player) find player;

if (count _spawnObjects >= _spawnIndex + 1) then
{
	private _spawnObject = _spawnObjects select _spawnIndex;
	private _pos = (getPos _spawnObject);
	_pos set [2,0];
	player setPos _pos;
	player setDir (getDir _spawnObject);
};
