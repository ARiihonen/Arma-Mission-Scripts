if (isServer) then {
//Randomizing unit presence variables using ARTR_fnc_randInt and ARTR_fnc_presenceArray

	unitsFloorOneOne = [];
	unitsFloorTwoOne = [];
	unitsFloorThreeOne = [];
	unitsFloorOneTwo = [];
	unitsFloorTwoTwo = [];
	unitsFloorThreeTwo = [];
	brokenFenceObjects = [];

	_fenceOpeningsTotal = 10;
	_fenceOpeningsMin = 2;
	_fenceOpeningsMax = 4;

	_entranceCount = 7;
	_entranceMin = 1;
	_entranceMax = 3;

	_outerOneCount = 3;
	_outerOneMin = 0;
	_outerOneMax = 1;

	_outerTwoCount = 4;
	_outerTwoMin = 0;
	_outerTwoMax = 1;

	_windowThingsCount = 6;
	_windowThingsMin = 2;
	_windowThingsMax = 4;

	_marksmenCount = 25;
	_roofCount = 8;
	_floorOneCountOne = 20;
	_floorOneCountTwo = 42;
	_floorOneCountThree = 64;
	_floorTwoCount = 32;
	_floorThreeCount = 61;

	_enemiesOnRoof = 4;

	_playerCount = playersNumber independent;

	_buildingCount = if (_playerCount < 12) then { 1; } else { 2; };
	_enemiesPerFloorTotal = _playerCount;
	_marksmenTotal = ceil(_playerCount / 2);

	_enemiesPerFloor = _enemiesPerFloorTotal/_buildingCount;
	_marksmenPerBuilding = _marksmenTotal / _buildingCount;

	fenceOpenings = [_fenceOpeningsTotal,_fenceOpeningsMax,_fenceOpeningsMin] call ARTR_fnc_presenceArray;

	buildings = [2,_buildingCount] call ARTR_fnc_presenceArray;
	publicVariable "buildings";

	buildingOneEntrances = [];
	buildingOneClimbup = 0;
	buildingOneOpenStairs = 0;
	buildingOneStairsExclusive = 0;
	buildingOneStairsSides = 0;

	outerOneOne = [];
	outerTwoOne = [];

	windowThingsOne = [];

	oneToThreeOne = [];
	oneToTwoOne = [];
	zeroToThreeOne = [];
	oneOrTwoOne = 0;
	zeroToOneOne = [];

	openWallOne = 0;
	doubleRoomsOne = 0;
	entrancesTwoOne = [];

	buildingOneMarksmen = [];
	buildingOneFloorOne = [];
	buildingOneFloorTwo = [];
	buildingOneFloorThree = [];
	buildingOneRoof = [];
	buildingOneFloorOneLayout = 0;
	if (1 in buildings) then {
		buildingOneEntrances = [_entranceCount,_entranceMin,_entranceMax] call ARTR_fnc_presenceArray;
		if (3 in buildingOneEntrances) then {
			buildingOneClimbup = [2] call ARTR_fnc_randInt;
		};
		if (5 in buildingOneEntrances) then {
			buildingOneOpenStairs = [2] call ARTR_fnc_randInt;
		};
		if (7 in buildingOneEntrances) then {
			buildingOneStairsExclusive = [3] call ARTR_fnc_randInt;
			buildingOneStairsSides = [2] call ARTR_fnc_randInt;
		};

		outerOneOne = [_outerOneCount,_outerOneMin,_outerOneMax] call ARTR_fnc_presenceArray;
		outerTwoOne = [_outerTwoCount,_outerTwoMin,_outerTwoMax] call ARTR_fnc_presenceArray;

		windowThingsOne = [_windowThingsCount,_windowThingsMin,_windowThingsMax] call ARTR_fnc_presenceArray;

		oneToThreeOne = [3,1,3] call ARTR_fnc_presenceArray;
		oneToTwoOne = [3,1,2] call ARTR_fnc_presenceArray;
		zeroToThreeOne = [3,0,3] call ARTR_fnc_presenceArray;
		oneOrTwoOne = [2] call ARTR_fnc_randInt;
		zeroToOneOne = [2,0,1] call ARTR_fnc_presenceArray;

		openWallOne = [2,0] call ARTR_fnc_randInt;
		doubleRoomsOne = [2,0] call ARTR_fnc_randInt;
		entrancesTwoOne = [3,1,2] call ARTR_fnc_presenceArray;

		bigRoomOne = if (1 in entrancesTwoOne) then {
			[3,0,2] call ARTR_fnc_presenceArray;
		} else {
			[3,0,3] call ARTR_fnc_presenceArray;
		};
		sideRoomOneOne = [2,0] call ARTR_fnc_randInt;
		sideRoomTwoOne = [2,0] call ARTR_fnc_randInt;
		smallRoomOne = [2,0] call ARTR_fnc_randInt;

		buildingOneMarksmen = [_marksmenCount,_marksmenTotal] call ARTR_fnc_presenceArray;
		buildingOneFloorTwo = [_floorTwoCount,_enemiesPerFloor] call ARTR_fnc_presenceArray;
		buildingOneFloorThree = [_floorThreeCount,_enemiesPerFloor] call ARTR_fnc_presenceArray;
		buildingOneRoof = [_roofCount,_enemiesOnRoof] call ARTR_fnc_presenceArray;

		buildingOneFloorOneLayout = [3] call ARTR_fnc_randInt;
		switch(buildingOneFloorOneLayout) do {
			case 1: { buildingOneFloorOne = [_floorOneCountOne,_enemiesPerFloor] call ARTR_fnc_presenceArray; };
			case 2: { buildingOneFloorOne = [_floorOneCountTwo,_enemiesPerFloor,_enemiesPerFloor,_floorOneCountOne-1] call ARTR_fnc_presenceArray; };
			case 3: { buildingOneFloorOne = [_floorOneCountThree,_enemiesPerFloor,_enemiesPerFloor,_floorOneCountTwo-1] call ARTR_fnc_presenceArray; };
			default { buildingOneFloorOne = []; };
		};
	};

	buildingTwoEntrances = [];
	buildingTwoClimbup = 0;
	buildingTwoOpenStairs = 0;
	buildingTwoStairsExclusive = 0;
	buildingTwoStairsSides = 0;

	outerOneTwo = [];
	outerTwoTwo = [];

	windowThingsTwo = [];

	oneToThreeTwo = [];
	oneToTwoTwo = [];
	zeroToThreeTwo = [];
	oneOrTwoTwo = 0;
	zeroToOneTwo = [];

	openWallTwo = 0;
	doubleRoomsTwo = 0;
	entrancesTwoTwo = [];

	buildingTwoMarksmen = [];
	buildingTwoFloorOne = [];
	buildingTwoFloorTwo = [];
	buildingTwoFloorThree = [];
	buildingTwoRoof = [];
	buildingTwoFloorOneLayout = 0;
	if (2 in buildings) then {
		buildingTwoEntrances = [_entranceCount,_entranceMin,_entranceMax] call ARTR_fnc_presenceArray;
		if (3 in buildingTwoEntrances) then {
			buildingTwoClimbup = [2] call ARTR_fnc_randInt;
		};
		if (5 in buildingTwoEntrances) then {
			buildingTwoOpenStairs = [2] call ARTR_fnc_randInt;
		};
		if (7 in buildingTwoEntrances) then {
			buildingTwoStairsExclusive = [3] call ARTR_fnc_randInt;
			buildingTwoStairsSides = [2] call ARTR_fnc_randInt;
		};

		outerOneTwo = [_outerOneCount,_outerOneMin,_outerOneMax] call ARTR_fnc_presenceArray;
		outerTwoTwo = [_outerTwoCount,_outerTwoMin,_outerTwoMax] call ARTR_fnc_presenceArray;

		windowThingsTwo = [_windowThingsCount,_windowThingsMin,_windowThingsMax] call ARTR_fnc_presenceArray;

		oneToThreeTwo = [3,1,3] call ARTR_fnc_presenceArray;
		oneToTwoTwo = [3,1,2] call ARTR_fnc_presenceArray;
		zeroToThreeTwo = [3,0,3] call ARTR_fnc_presenceArray;
		oneOrTwoTwo = [2] call ARTR_fnc_randInt;
		zeroToOneTwo = [2,0,1] call ARTR_fnc_presenceArray;

		openWallTwo = [2,0] call ARTR_fnc_randInt;
		doubleRoomsTwp = [2,0] call ARTR_fnc_randInt;
		entrancesTwoTwo = [3,1,2] call ARTR_fnc_presenceArray;

		bigRoomTwo = if (1 in entrancesTwoOne) then {
			[3,0,2] call ARTR_fnc_presenceArray;
		} else {
			[3,0,3] call ARTR_fnc_presenceArray;
		};
		sideRoomOneTwo = [2,0] call ARTR_fnc_randInt;
		sideRoomTwoTwo = [2,0] call ARTR_fnc_randInt;
		smallRoomTwo = [2,0] call ARTR_fnc_randInt;

		buildingTwoMarksmen = [_marksmenCount,_marksmenTotal] call ARTR_fnc_presenceArray;
		buildingTwoFloorTwo = [_floorTwoCount,_enemiesPerFloor] call ARTR_fnc_presenceArray;
		buildingTwoFloorThree = [_floorThreeCount,_enemiesPerFloor] call ARTR_fnc_presenceArray;
		buildingTwoRoof = [_roofCount,_enemiesOnRoof] call ARTR_fnc_presenceArray;

		buildingTwoFloorOneLayout = [3] call ARTR_fnc_randInt;
		switch(buildingTwoFloorOneLayout) do {
			case 1: { buildingTwoFloorOne = [_floorOneCountOne,_enemiesPerFloor] call ARTR_fnc_presenceArray; };
			case 2: { buildingTwoFloorOne = [_floorOneCountTwo,_enemiesPerFloor,_enemiesPerFloor,_floorOneCountOne-1] call ARTR_fnc_presenceArray; };
			case 3: { buildingTwoFloorOne = [_floorOneCountThree,_enemiesPerFloor,_enemiesPerFloor,_floorOneCountTwo-1] call ARTR_fnc_presenceArray; };
			default { buildingTwoFloorOne = []; };
		};
	};

};
