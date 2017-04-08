/*
while { {_x inArea tr_operationArea} count playableUnits >= 0 || { } count playableUnits >= 0 } do
{
	{
		//Define chased unit if previous one is unavailable or not defined
		if () then
		{

		};

		//Add new waypoint at the current location (they will follow their previous waypoints, making them roughly follow the path of their prey)
		_newWaypoint = _x addWaypoint [getPosWorld(_x getVariable "chasedUnit"),10];
	} forEach chaseGroups;

	sleep 5;
};

//SAD waypoint at the latest position (if they have a legitimate target)

tr_restartHunt = [
	"{_x inArea tr_operationArea} count playableUnits >= 0 || { } count playableUnits >= 0",
	"call ARTR_fnc_chaseForce;"
] call ARTR_fnc_emptyTrigger;
