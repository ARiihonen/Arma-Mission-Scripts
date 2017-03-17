params ["_pos","_helo"];

_helo setVariable ["availableForTasking",false,true];
private _group = (group driver _helo);

_group call ARTR_fnc_removeAllWaypoints;

_landingWP = _group addWaypoint [_pos];
_landingWP setWaypointType "MOVE";
_landingWP setWaypointStatements [
	"true",
	"
		(vehicle this) land 'GET IN';
		(vehicle this) setVariable ['landed',true,true];
	"
];
_group setCurrentWaypoint _landingWP;

_holdWP = _group addWaypoint [_pos];
_holdWP setWaypointType "HOLD";

tr_heloLandingZone = createTrigger ["EmptyDetector", _pos, false];
tr_heloLandingZone setTriggerArea [100,100,0,false];
tr_heloLandingZone setTriggerActivation [_side, "PRESENT", false];

tr_heloLandingZone setVariable ["helicopter",_helo,false];

if ( {isPlayer _x} count (crew _helo) > 0 ) then
{
	tr_heloLandingZone setTriggerTimeout [30,30,30,true];
} else {
	tr_heloLandingZone setTriggerTimeout [300,300,300,true];
};

tr_heloLandingZone setTriggerStatements [
	"this || ((thisTrigger getVariable 'helicopter') getVariable 'availableForTasking')",
	"(thisTrigger getVariable 'helicopter') call ARTR_fnc_goodToGo;",
	""
];
