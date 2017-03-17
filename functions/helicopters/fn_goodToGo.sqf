params ["_helo"];

_group = group (driver _helo);
_group call ARTR_fnc_removeAllWaypoints;

_helo setVariable ["landed",false,true];
_helo setVariable ["availableForTasking",true,true];

if ( {isPlayer _x} count (crew _helo) > 0 ) then
{
	_loiterWP = _group addWaypoint [getPosWorld _helo];
	_loiterWP setWaypointType "LOITER";
	_loiterWP setWaypointLoiterRadius 100;
	_group setCurrentWaypoint _loiterWP;

} else {
	_helo call ARTR_fnc_standByStation;
};
