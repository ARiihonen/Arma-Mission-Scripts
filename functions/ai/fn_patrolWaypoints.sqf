params ["_group"];

private _waypointID = _group getVariable "patrolWaypointID";
private _waypointPrefix = "mrk_patrol" + _waypointID;

for "_i" from 1 to 10 do
{
	if (_i < 10) then
	{
		private _newWaypointMarker = _waypointPrefix;

		switch (_waypointID) do
		{
			case "NorthOuter":
			{
				_newWaypointMarker = _newWaypointMarker + "_" + str([7] call ARTR_fnc_randInt)
			};
			case "NorthInner":
			{
				_newWaypointMarker = _newWaypointMarker + "_" + str([6] call ARTR_fnc_randInt)
			};
			case "SouthOuter":
			{
				_newWaypointMarker = _newWaypointMarker + "_" + str([9] call ARTR_fnc_randInt)
			};
			case "SouthInner":
			{
				_newWaypointMarker = _newWaypointMarker + "_" + str([10] call ARTR_fnc_randInt)
			};
		};

		_newWP = _group addWaypoint [markerPos _newWaypointMarker, 50];
		_newWP setWaypointType "MOVE";
		_newWP setWaypointFormation "WEDGE";
		_newWP setWaypointSpeed "LIMITED";
		_newWP setWaypointBehaviour "SAFE";
		_newWP setWaypointCombatMode "RED";

		if (_i == 1) then
		{
			_group setCurrentWaypoint _newWP;
			_group setVariable ["firstWaypoint", _newWP];
		};
	} else {
		private _firstWP = _group getVariable "firstWaypoint";

		_newWP = _group addWaypoint [waypointPosition _firstWP,0];
		_newWP setWaypointType "CYCLE";
	};
};
