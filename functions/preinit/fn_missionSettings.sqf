if (isServer) then {
	destroyObjects = [];

	private _buildings = [6] call ARTR_fnc_populateArray;

	messBuilding = selectRandom _buildings;
	_buildings deleteAt (_buildings find messBuilding);
	messSoldiers = [7,4] call ARTR_fnc_presenceArray;

	CPBuilding = selectRandom _buildings;
	_buildings deleteAt (_buildings find CPBuilding);

	barracksBuildings = [_buildings,2] call ARTR_fnc_chooseRandoms;
	_buildings = _buildings - barracksBuildings;

	barracks_1 = [[],[9,6] call ARTR_fnc_presenceArray] select (1 in barracksBuildings);
	barracks_2 = [[],[9,6] call ARTR_fnc_presenceArray] select (2 in barracksBuildings);
	barracks_3 = [[],[9,6] call ARTR_fnc_presenceArray] select (3 in barracksBuildings);
	barracks_4 = [[],[9,6] call ARTR_fnc_presenceArray] select (4 in barracksBuildings);
	barracks_5 = [[],[9,6] call ARTR_fnc_presenceArray] select (5 in barracksBuildings);
	barracks_6 = [[],[9,6] call ARTR_fnc_presenceArray] select (6 in barracksBuildings);

	_buildings append [7,8,9,10,11];
	ammoBuildings = [_buildings,2,3] call ARTR_fnc_chooseRandoms;
};

enemyCars = [];

chaseGroups = [];

barracksUnits = [];
