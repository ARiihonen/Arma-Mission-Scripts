if (commandHelo getVariable ["availableForTasking",true]) then
{
	//message stuff "go ahead"

	//get new waypoint location on map click
	openMap [true,false];
	ARTR_mapClickEH = addMissionEventHandler [
		"MapSingleClick",
		{
			params ["_units","_position","_altPressed","_shiftPressed"];

			[_position,commandHelo] remoteExecCall ["ARTR_fnc_newLandingZone",commandHelo,false];

			openMap [false,false];

			//message stuff "ok coming in, confirm position"
		}
	];

	//handle closing the map (with the click or without)
	tr_mapClosed = [
		"!visibleMap",
		"
			removeMissionEventHandler ARTR_mapClickEH;
		"
	] call ARTR_fnc_emptyTrigger;
} else {
	if (commandHelo getVariable ["onStation",true]) then
	{
		//message stuff "not available for tasking"
	} else {
		//message stuff "no answer"
	};
};
