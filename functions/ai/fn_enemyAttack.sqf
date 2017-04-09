params ["_group","_initialMarker","_syncTime"];

private _secondaryMarker = _initialMarker + "_" + (selectRandom["1","2"]);

private _setupWaypoint = _group addWaypoint [markerPos _secondaryMarker,0];
_setupWaypoint setWaypointType "MOVE";
_setupWaypoint setWaypointSpeed "FULL";
_setupWaypoint setWaypointBehaviour "AWARE";
_setupWaypoint setWaypointCombatMode "YELLOW";
_setupWaypoint setWaypointFormation "DIAMOND";
_group setCurrentWaypoint _setupWaypoint;

private _waitWaypoint = _group addWaypoint [markerPos _secondaryMarker,0];
_waitWaypoint setWaypointType "MOVE";
_waitWaypoint setWaypointSpeed "NORMAL";
_waitWaypoint setWaypointBehaviour "STEALTH";
_waitWaypoint setWaypointCombatMOde "YELLOW";
_waitWaypoint setWaypointFormation "WEDGE";
_waitWaypoint setWaypointStatements [
	("serverTime > " + str(_syncTime)),
	"(group this) setVariable ['attacking',true,true];"
];

private _attackWaypoint = _group addWaypoint [markerPos "mrk_attackCentre",50];
_attackWaypoint setWaypointType "SAD";
_attackWaypoint setWaypointSpeed "NORMAL";
_attackWaypoint setWaypointBehaviour "AWARE";
_attackWaypoint setWaypointCombatMode "YELLOW";
_attackWaypoint setWaypointFormation "LINE";
