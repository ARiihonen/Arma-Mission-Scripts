_players_blue = playersNumber west;

_trucks_start = 10*60 + (_players_blue * 10 * 60);
missionNamespace setVariable ["trucks_start", _trucks_start, false];

_uav_end = _trucks_start;
missionNamespace setVariable ["uav_end", _uav_end, false];

boxes = [];

if (isServer) then {
	/*
	Set any preInit-settings for the mission here, including randomizing unit presence variables using ARTR_fnc_randInt and ARTR_fnc_presenceArray
	*/

	_max_box = 0;
	switch ( ceil(_players_blue / 2)) do {
		case 1: { _max_box = 6; };
		case 2: { _max_box = 10; };
		case 3: { _max_box = 14; };
		case 4: { _max_box = 18; };
	};

	box_positions = [_max_box, _players_blue*2] call ARTR_fnc_presenceArray;
};
