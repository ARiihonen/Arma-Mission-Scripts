//First, upgrade the existing waves

private _maxUpgrade = (count infantryTiers - 1);
private _escalationCount = call escalationAmount;

for "_i" from 1 to _escalationCount do
{
	private _possibleEscalations = [];
	private _possibleUpgrades = ({ _x < _maxUpgrade } count attackGroups);

	if (count attackGroups < (call maxGroups) ) then { _possibleEscalations pushBack 1; };

	if (_possibleUpgrades > 0) then { _possibleEscalations pushBack 2; };

	if (count _possibleEscalations > 0) then
	{
		private _escalation = selectRandom _possibleEscalations;

		if (_escalation == 1) then
		{
			attackGroups pushBack 0;
		} else {
			attackGroups sort true;

			private _maxUpgradeIndex = ( _possibleUpgrades - 1);
			private _upgradeIndex = [0,_maxUpgradeIndex] call ARTR_fnc_randInt;
			private _upgradeOriginal = attackGroups select _upgradeIndex;
			private _upgradeValue = _upgradeOriginal + 1;
			attackGroups set [_upgradeIndex, _upgradeValue];
		};
	};
};

private _vehicleAmount = [4, (call maxVehicles)] select ((call maxVehicles) <= 4);
attackVehicles = [];
for "_i" from 1 to _vehicleAmount do
{
	private _spawnMarker = selectRandom (possibleVehicleSpawns select { !(_x in attackVehicles) });
	attackVehicles pushBack _spawnMarker;
};

//Then, spawn all the now-upgraded groups and randomize a time for them to sync their waypoints to
private _syncTime = serverTime + (random(5*60));
{
	private _marker = "mrk_attack_" + str([11] call ARTR_fnc_randInt);

	[_marker, (infantryTiers select _x), _syncTime] remoteExecCall ["ARTR_fnc_infantryGroup", call ARTR_fnc_getAIController, false];
} forEach attackGroups;

{
	private _marker = _x;
	//private _vehicleType = selectRandom (selectRandom vehicleSelection);
	private _vehicleType = selectRandom (vehicleSelection select 1);
	[_marker,_vehicleType,_syncTime] remoteExecCall ["ARTR_fnc_vehicleGroup", call ARTR_fnc_getAIController, false];
} forEach attackVehicles;

//Depending on the setting, respawn players as the new wave starts
switch ("RespawnPreference" call BIS_fnc_getParamValue >= 2) do
{
	case 1: { call ARTR_fnc_respawnHelicopters; };
	case 2: { call ARTR_fnc_respawnPlayers; };
	case 3: { call ARTR_fnc_respawnPlayers; call ARTR_fnc_respawnHelicopters; };
};
