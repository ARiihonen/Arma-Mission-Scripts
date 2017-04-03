if ({ !alive _x && !(_x getVariable ["Pilot",false]) } count allPlayers >= 0) then
{
	if (isNil "respawnTruck" || {!(canMove respawnTruck)} ) then
	{
		private _truckType = ["B_Truck_01_transport_F","RHS_Ural_VDV_01"] select (missionNamespace getVariable ["gearSelection","default"] == "RHSAFRF");
		private _pos = markerPos "mrk_reinforceStart";
		private _dir = markerDir "mrk_reinforceStart";

		respawnTruck = _truckType createVehicle _pos;
		respawnTruck setDir _dir;
		respawnTruck setPos _pos;

		private _driver = createAgent ["B_Soldier_lite_F", markerPos "mrk_reinforceStart", [], 0, "NONE"];
		[_driver] call ARTR_fnc_modGear;

		_driver moveInDriver respawnTruck;
		respawnTruck lockDriver true;

		respawnTruck setVariable ["driver",_driver,false];
		missionNamespace setVariable ["respawnTruck",respawnTruck,true];
	};

	(respawnTruck getVariable "driver") setDestination [markerPos "mrk_reinforceWaypoint", "LEADER PLANNED", true];

	{
		[_x,1,true] call BIS_fnc_respawnTickets;
	} forEach (allPlayers select { !alive _x && !(_x getVariable ["Pilot",false]) });

	tr_removeTruck = [
		"{ vehicle _x inArea tr_targetZone || vehicle _x == respawnTruck } count allPlayers <= 0",
		"
			respawnTruck setPos (markerPos 'mrk_reinforceStart');
			respawnTruck setDir (markerDir 'mrk_reinforceStart');
			(respawnTruck getVariable 'driver') setDestination [markerPos 'mrk_reinforceStart', 'LEADER PLANNED', true];
		"
	] call ARTR_fnc_emptyTrigger;

	[
		west,
		"tsk_reinforce",
		["Reinforcements are on their way. Get them into the fight.","Reinforcements","mrk_reinforceWaypoint"],
		"mrk_reinforceWaypoint",
		"ASSIGNED",
		1,
		false,
		"run",
		false
	] call BIS_fnc_taskCreate;

	["TaskCreated", ["Reinforcements on the way"]] remoteExec ["BIS_fnc_showNotification", west, false];

	//Trigger checks task completion (when all players not pilots are in the play area)
	tr_reinforcementTask = [
		"{ alive _x && !(_x getVariable ['Pilot',false]) && !(_x inArea tr_suppressionZone) } count allPlayers >= 0",
		"
			['tsk_reinforce', 'SUCCEEDED', false] call BIS_fnc_taskSetState;
			['TaskSucceeded', ['Reinforcements in the fight']] remoteExec ['BIS_fnc_showNotification', west, false];
		"
	] call ARTR_fnc_emptyTrigger;
};
