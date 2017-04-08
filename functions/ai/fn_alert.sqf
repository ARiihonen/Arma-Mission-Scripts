params ["_type"];

if (!(_type in missionNamespace getVariable ["AlertModes", []])) then
{
	(missionNamespace getVariable ["AlertModes",[]]) append ([[_type],["Air","Ground"]] select (_type == "Ground"));

	//Make the target attempt escape
	call ARTR_fnc_escapeTarget;

	//Make everyone in the camp run into the woods
	{
		//Choose nearest position in the woods (one of the outer waypoint markers)
		private _leader = leader _x;
		private _positionMarkers = outerPatrolMarkersSouth + outerPatrolMarkersNorth;
		_positionMarkers apply [_leader distance _x, _x];
		_positionMarkers sort true;
		private _closestPos = markerPos (_positionMarkers select 0 select 1);

		//Remove all waypoints from the group
		[_x] call ARTR_fnc_removeWaypoints;

		//Add a new waypoint at the closest woods defende position around the village
		_newWP = _x addWaypoint [_closestPos, 20];
		_newWP setWaypointType "COMBAT";
		_newWP setWaypointCombatMode "RED";
		_newWP setWaypointSpeed "FULL";
		_newWP setWaypointFormation "WEDGE";
		_x setCurrentWaypoint _newWP;
	} forEach (allGroups select { side _x == resistance && leader _x != target });

	//If it is a ground alert, start reinforcement loop and enemy chase logic
	if (_type == "Ground") then
	{
		//Reinforcements start arriving immediately
		[] spawn ARTR_fnc_reinforcements;

		//When the players get outside the village, the reinforcements and units in the village give chase
		tr_chasePlayers = [
			"{ _x inArea tr_village } count playableUnits <= 0",
			"[] spawn ARTR_fnc_chaseForces;"
		] call ARTR_fnc_emptyTrigger;
	};
};
