params ["_group"];

{
	deleteWaypoint _x;
} forEach (waypoints _group);
