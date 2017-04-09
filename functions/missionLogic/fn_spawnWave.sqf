if (isServer) then
{
	//Kill any enemies cowardly enough to chill outside the AO even when the next wave is coming
	{
		{
			_x setDamage 1;
		} forEach (units _x);
	} forEach ( allGroups select { side _x == east && !(_x in (call activeGroups)) && isNull objectParent (leader _x)} );

	//Upgrade the existing waves
	private _maxUpgrade = (count infantryTiers - 1);
	private _minAdditions = call minWave;
	private _maxAdditions = call maxWave;

	//Fill the attack list with scrub enemies until minimum amount is reached
	while { count attackList < _minAdditions } do {
		attackList pushBack 0;
	};

	//Escalate the existing attack with the remaining escalation points
	private _escalationCount = (call escalationAmount) - _minAdditions;
	if (_escalationCount > 0) then
	{
		for "_i" from 1 to _escalationCount do
		{
			//Figure out the possible escalation types (if all units are max tier, can't be upgraded, if max amount is reached, more can't be added)
			private _possibleEscalations = [];
			if (count attackList < _maxAdditions) then { _possibleEscalations pushBack 1; };
			private _possibleUpgrades = ({ _x < _maxUpgrade } count attackList);
			if (_possibleUpgrades > 0) then { _possibleEscalations pushBack 2; };

			//If possible escalations exist, choose a random type
			if (count _possibleEscalations > 0) then
			{
				private _escalation = selectRandom _possibleEscalations;

				if (_escalation == 1) then
				{
					attackList pushBack 0;
				} else {
					//Sort the attack list, choose a random unit under the max tier and upgrade its value
					attackList sort true;
					private _maxUpgradeIndex = ( _possibleUpgrades - 1);
					private _upgradeIndex = [0,_maxUpgradeIndex] call ARTR_fnc_randInt;
					private _upgradeOriginal = attackList select _upgradeIndex;
					private _upgradeValue = _upgradeOriginal + 1;
					attackList set [_upgradeIndex, _upgradeValue];
				};
			};
		};
	};

	//Synchronize time for the AI groups to attack at
	private _syncTime = serverTime + (random(2*60));

	//Randomize attacking vehicle starting markers and types, send each to be spawned on AI controller
	private _vehicleAmount = [4, (call maxVehicles)] select ((call maxVehicles) >= 4);
	private _attackVehicles = [];
	for "_i" from 1 to _vehicleAmount do
	{
		private _spawnMarker = selectRandom (possibleVehicleSpawns select { !(_x in _attackVehicles) });
		private _vehicleType = selectRandom (selectRandom vehicleSelection);
		[_spawnMarker,_vehicleType,_syncTime] remoteExecCall ["ARTR_fnc_vehicleGroup", call ARTR_fnc_getAIController, false];

		_attackVehicles pushBack _spawnMarker;
	};

	//Finalize groups by selecting spawn locations and add them to the spawn queue
	{
		private _marker = "mrk_attack_" + str([11] call ARTR_fnc_randInt);
		spawnQueue pushBack ([_marker, (infantryTiers select _x), _syncTime]);
	} forEach attackList;

	//Depending on the setting, respawn players as the new wave starts
	switch ("RespawnPreference" call BIS_fnc_getParamValue >= 2) do
	{
		case 1: { call ARTR_fnc_respawnHelicopters; };
		case 2: { call ARTR_fnc_respawnPlayers; };
		case 3: { call ARTR_fnc_respawnPlayers; call ARTR_fnc_respawnHelicopters; };
	};

	//Call in a mortar strike to mark the start of the new wave
	[_syncTime] call ARTR_fnc_mortarFire;

	//Handle new wave spawning
	call ARTR_fnc_handleWave;
};
