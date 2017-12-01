if (isServer) then {
	/*
	Set any preInit-settings for the mission here, including randomizing unit presence variables using ARTR_fnc_randInt and ARTR_fnc_presenceArray
	*/
	private _players = playersNumber west;

	private _units_count = if (_players < 8) then { 2; } else {
		if (_players < 10) then { 3; } else {
			if (_players < 12) then { 4; } else {
				if (_players < 14) then { 3; } else {
					4;
				};
			};
		};
	};

	private _patrol_guys_count = floor (_players/2);
	private _extras_count = floor (_players/2);
	private _patrols_count = if (_players < 8) then { 1; } else { 2; };
	private _camps_count = if (_players < 12) then { 2; } else { 3; };
	private _camps = [6, _camps_count] call ARTR_fnc_presenceArray;

	camp_1 = [];
	camp_1_patrols = [];
	if (1 in _camps) then {
		camp_1 = [4, _units_count] call ARTR_fnc_presenceArray;
		camp_1_patrols = [2, _patrols_count] call ARTR_fnc_presenceArray;
	};

	camp_2 = [];
	camp_2_patrols = [];
	if (2 in _camps) then {
		camp_2 = [4, _units_count] call ARTR_fnc_presenceArray;
		camp_2_patrols = [2, _patrols_count] call ARTR_fnc_presenceArray;
	};

	camp_3 = [];
	camp_3_patrols = [];
	if (3 in _camps) then {
		camp_3 = [4, _units_count] call ARTR_fnc_presenceArray;
		camp_3_patrols = [2, _patrols_count] call ARTR_fnc_presenceArray;
	};

	camp_4 = [];
	camp_4_patrols = [];
	if (4 in _camps) then {
		camp_4 = [4, _units_count] call ARTR_fnc_presenceArray;
		camp_4_patrols = [2, _patrols_count] call ARTR_fnc_presenceArray;
	};

	camp_5 = [];
	camp_5_patrols = [];
	if (5 in _camps) then {
		camp_5 = [4, _units_count] call ARTR_fnc_presenceArray;
		camp_5_patrols = [2, _patrols_count] call ARTR_fnc_presenceArray;
	};

	camp_6 = [];
	camp_6_patrols = [];
	if (6 in _camps) then {
		camp_6 = [4, _units_count] call ARTR_fnc_presenceArray;
		camp_6_patrols = [2, _patrols_count] call ARTR_fnc_presenceArray;
	};

	patrol_guys = [31, _patrol_guys_count] call ARTR_fnc_presenceArray;

	extra_camps = [2,1] call ARTR_fnc_presenceArray;
	extras = [7, _extras_count] call ARTR_fnc_presenceArray;

};