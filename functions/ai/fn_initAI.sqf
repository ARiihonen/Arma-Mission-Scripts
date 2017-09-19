if ( (isServer && isNil "headlessClient") || (!isServer && !hasInterface) ) then
{
	//Unit chill animations (dudes in barracks sit down, others lean on walls)
	{
		[_x,"SIT_LOW","RANDOM"] call BIS_fnc_ambientAnimCombat;
	} forEach (barracksUnits);

	{
		[_x,"LEAN","RANDOM"] call BIS_fnc_ambientAnimCombat;
	} forEach ( allUnits select { side _x == resistance && !(_x in barracksUnits || typeOf _x == "I_C_Soldier_Para_7_F") } );

	//Target surrender trigger
	tr_surrender = [
		"alive target && { !(_X == target) } count (units group target) <= 0 && { _x distance target < 20 } count playableUnits >= 1",
		"call ARTR_fnc_surrenderTarget"
	] call ARTR_fnc_emptyTrigger;

	//Target surrender event handler
	target addMPEventHandler [
		"MPHit",
		{
			params ["_unit", "_causedBy", "_damage", "_instigator"];
			if (isPlayer _instigator) then
			{
				call ARTR_fnc_surrenderTarget;
			};
		}
	];

	//If patrols have not been spawned, spawn them
	if (missionNamespace getVariable ["sentriesNotSpawned", true]) then
	{
		missionNamespace setVariable ["sentriesNotSpawned", false, true];

		private _patrolUnits = ["I_C_Soldier_Para_2_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_1_F"];

		//Spawn outer layer patrols
		for "_i" from 1 to 2 do
		{
			private _northPatrolMarkers = [];
			for "_i" from 1 to 7 do {
				_northPatrolMarkers pushBack ( "mrk_patrolNorthOuter_" + str(_i) );
			};
			private _startMarker = selectRandom _northPatrolMarkers;
			[_startMarker,_patrolUnits,"NorthOuter"] call ARTR_fnc_patrolGroup;

			private _southPatrolMarkers = [];
			for "_i" from 1 to 9 do {
				_southPatrolMarkers pushBack ( "mrk_patrolSouthOuter_" + str(_i) );
			};
			_startMarker = selectRandom _southPatrolMarkers;
			[_startMarker,_patrolUnits,"SouthOuter"] call ARTR_fnc_patrolGroup;
		};

		//Spawn inner layer patrols
		for "_i" from 1 to 3 do
		{
			private _northPatrolMarkers = [];
			for "_i" from 1 to 6 do {
				_northPatrolMarkers pushBack ( "mrk_patrolNorthInner_" + str(_i) );
			};
			private _startMarker = selectRandom _northPatrolMarkers;
			[_startMarker,_patrolUnits,"NorthInner"] call ARTR_fnc_patrolGroup;

			private _southPatrolMarkers = [];
			for "_i" from 1 to 10 do {
				_southPatrolMarkers pushBack ( "mrk_patrolSouthInner_" + str(_i) );
			};
			_startMarker = selectRandom _southPatrolMarkers;
			[_startMarker,_patrolUnits,"SouthInner"] call ARTR_fnc_patrolGroup;
		};

		//Spawn vehicle patrols
		private _vehicleStarts = [
			"mrk_vehicleSpawn_1",
			"mrk_vehicleSpawn_2",
			"mrk_vehicleSpawn_3",
			"mrk_vehicleSpawn_4",
			"mrk_vehicleSpawn_5",
			"mrk_vehicleSpawn_6",
			"mrk_vehicleCentre"
		];

		for "_i" from 1 to (1+floor(random(3))) do {
			private _start = _vehicleStarts deleteAt (floor random (count _vehicleStarts));

			private _vehicle = createVehicle [(selectRandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F"]),markerPos _start,[],0,"NONE"];
			_vehicle setDir (markerDir _start);

			private _group = [markerPos _start, resistance, ["I_C_Soldier_Para_2_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_1_F"], [], [], [], [], [], markerDir _start] call BIS_fnc_spawnGroup;

			{
				switch (_forEachIndex) do
				{
					case 0: {
						_x assignAsDriver _vehicle;
						_x moveInDriver _vehicle;
					};

					case 1: {
						_x assignAsGunner _vehicle;
						_x moveInGunner _vehicle;
					};

					default {
						_x assignAsCargo _vehicle;
						_x moveInCargo _vehicle;
					};
				}
			} forEach (units _group);

			//Set skills
			(units _group) call ARTR_fnc_setSkills;

			//Set gear
			/*
			{
				[_x,"guerrilla",(typeOf _x)] call ARTR_fnc_setIrregularGear;
			} forEach (units _group);
			*/


			//Make waypoints for them
			[_group] call ARTR_fnc_vehicleWaypoints;
		};
	};

	//If the Blackfish has no pilot, add one and make him orbit the target
	if (isNil {driver thunder}) then
	{
		private _orbitHeight = 1500;
		private _orbitDistance = 1500;

		if (count crew thunder > 0) then
		{
			_orbitHeight = 600;
			_orbitDistance = 600;
		};

		_unit = "B_T_Pilot_F" createUnit (getPos thunder);
		_unit assignAsDriver thunder;
		_unit moveInDriver thunder;

		_loiterWP = (group driver thunder) addWaypoint [markerPos "", 0];
		_loiterWP setWaypointType "LOITER";
		_loiterWP setWaypointBehaviour "AWARE";
		_loiterWP setWaypointSpeed "LIMITED";
		_loiterWP setWaypointCombatMode "GREEN";
		_loiterWP setWaypointLoiterType "CIRCLE_L";
		_loiterWP setWaypointLoiterRadius _orbitDistance;
		(group driver thunder) setCurrentWaypoint _loiterWP;
		thunder flyInHeightASL [_orbitHeight,_orbitHeight,_orbitHeight];
	};

	//If the GHosthawk doesn't have a pilot, add one and make him go land at a default LZ
	if (isNil {driver lightning}) then
	{
		_unit = "B_T_Helipilot_F" createUnit (getPos lightning);
		_unit assignAsDriver lightning;
		_unit moveInDriver lightning;
	};
};
