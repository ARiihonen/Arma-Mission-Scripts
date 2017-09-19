params ["_group"];

private _in = selectRandom ["mrk_vehicleIn_1","mrk_vehicleIn_2"];
private _out = selectRandom ["mrk_vehicleIn_1","mrk_vehicleIn_2"];

private _inWP = _group addWaypoint [markerPos _in, 0];
_inWP setWaypointType "MOVE";
_inWP setWaypointSpeed "NORMAL";
_inWP setWaypointBehaviour "SAFE";
_inWP setWaypointFormation "COLUMN";
_inWP setWaypointCombatMode "RED";
_group setCurrentWaypoint _inWP;

private _getoutWP = _group addWaypoint [markerPos "mrk_vehicleCentre", 0];
_getoutWP setWaypointType "GETOUT";

private _walkWaypoints = [
	[
		"mrk_patrolNorthOuter_1",
		"mrk_patrolNorthOuter_2",
		"mrk_patrolNorthOuter_3",
		"mrk_patrolNorthOuter_4",
		"mrk_patrolNorthOuter_5",
		"mrk_patrolNorthOuter_6",
		"mrk_patrolNorthOuter_7",
		"mrk_patrolNorthInner_1",
		"mrk_patrolNorthInner_2",
		"mrk_patrolNorthInner_3",
		"mrk_patrolNorthInner_4",
		"mrk_patrolNorthInner_5",
		"mrk_patrolNorthInner_6",
		"mrk_patrolSouthOuter_1",
		"mrk_patrolSouthOuter_2",
		"mrk_patrolSouthOuter_3",
		"mrk_patrolSouthOuter_4",
		"mrk_patrolSouthOuter_5",
		"mrk_patrolSouthOuter_6",
		"mrk_patrolSouthOuter_7",
		"mrk_patrolSouthOuter_8",
		"mrk_patrolSouthOuter_9",
		"mrk_patrolSouthInner_1",
		"mrk_patrolSouthInner_2",
		"mrk_patrolSouthInner_3",
		"mrk_patrolSouthInner_4",
		"mrk_patrolSouthInner_5",
		"mrk_patrolSouthInner_6",
		"mrk_patrolSouthInner_7",
		"mrk_patrolSouthInner_8",
		"mrk_patrolSouthInner_9",
		"mrk_patrolSouthInner_10"
	],
	1,
	10
] call ARTR_fnc_chooseRandoms;

{
	private _newWP = _group addWaypoint [markerPos _x,20];
	_newWP setWaypointType "MOVE";
	_newWP setWaypointTimeout [0,10,60];
} forEach _walkWaypoints;

private _getinWP = _group addWaypoint [markerPos "mrk_vehicleCentre", 0];
_getinWP setWaypointType "GETIN";

private _outWP = _group addWaypoint [markerPos _out, 0];
_outWP setWaypointType "MOVE";
_outWP setWaypointStatements [
	"",
	"[group this] call ARTR_fnc_vehiclePatrol;"
];
