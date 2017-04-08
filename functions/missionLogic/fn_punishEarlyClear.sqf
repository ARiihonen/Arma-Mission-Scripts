
{
	_x call BIS_fnc_ambientAnim__terminate;
} forEach (allUnits select { side _x == RESISTANCE && ((getPosWorld _x) inArea trigger_islandCleared) });

{
	{
		deleteWaypoint _x;
	} forEach (waypoints _x);

	_newWaypoint = _x addWaypoint [getMarkerPos "mrk_pickup", 10];
	_newWaypoint setWaypointSpeed "FULL";
	_x setCurrentWaypoint _newWaypoint;

} forEach (allGroups select { side _x == RESISTANCE && ((getPosWorld leader _x) inArea trigger_islandCleared) });
