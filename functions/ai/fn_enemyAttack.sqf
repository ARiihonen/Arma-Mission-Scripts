params ["_group","_initialMarker","_syncTime"];

private _secondaryMarker = _initialMarker + "_" + (selectRandom["1","2"]);

private _setupWaypoint = _group addWaypoint [markerPos _secondaryMarker,0];
_setupWaypoint setWaypointType "MOVE";
_setupWaypoint setWaypointSpeed "NORMAL";
_setupWaypoint setWaypointBehaviour "AWARE";
_setupWaypoint setWaypointCombatMode "RED";
_setupWaypoint setWaypointFormation "DIAMOND";
_group setCurrentWaypoint _setupWaypoint;

if (random 1 < 0.25) then
{
	_setupWaypoint setWaypointStatements [
		"true",
		"{ _x enableAI 'AUTOCOMBAT'; } forEach thisList;"
	];
};

private _waitWaypoint = _group addWaypoint [markerPos _secondaryMarker,0];
_waitWaypoint setWaypointType "MOVE";
_waitWaypoint setWaypointSpeed "NORMAL";
_waitWaypoint setWaypointBehaviour "STEALTH";
_waitWaypoint setWaypointCombatMOde "RED";
_waitWaypoint setWaypointFormation "DIAMOND";
_waitWaypoint setWaypointStatements [
	("serverTime > " + str(_syncTime)),
	"(group this) setVariable ['attacking',true,true];"
];

private _attackWaypoint = _group addWaypoint [markerPos "mrk_attackCentre",50];
_attackWaypoint setWaypointType "SAD";
_attackWaypoint setWaypointSpeed "NORMAL";
_attackWaypoint setWaypointBehaviour "AWARE";
_attackWaypoint setWaypointCombatMode "RED";
_attackWaypoint setWaypointFormation "LINE";
