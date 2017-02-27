//Runs on the client after server has initialised
waitUntil { missionNamespace getVariable["ARTR_serverInit", false] };

{
	_markerName = format["%1_marker", _x];
	_marker = createMarkerLocal [_markerName, getPos _x];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "mil_dot";
	_marker setMarkerColorLocal "colorRed";

	_x setVariable ["marker", _marker, false];

	if (side player == east) then
	{
		_id = _x addAction [
			"<t color='#AADDAA'>Place tracker</t>",
			"_this call ARTR_fnc_trackerAction;",
			"",
			6,
			false,
			true,
			"",
			"_this distance _target < 5"
		];

		_x setVariable ["tracker_action", _id, false];
	};
} forEach boxes;

switch (side player) do
{
	case east: {
		//Starting position marker
		_mark = createMarkerLocal ["start", getMarkerPos "redStart"];
		_mark setMarkerShapeLocal "ICON";
		_mark setMarkerTypeLocal "mil_start";
		_mark setMarkerColorLocal "colorBlue";

		//create camera
		call ARTR_fnc_initUAV;
	};

	case west: {
		//Add EHs to handle defenders being killed by infiltrators
		player addEventHandler ["Hit", "_this call ARTR_fnc_defenderHit;"];
		player addEventHandler ["Killed", "_this call ARTR_fnc_defenderKilled;"];
	};
};
