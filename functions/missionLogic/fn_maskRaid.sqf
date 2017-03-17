if ( !(missionNamespace getVariable ["maskTaskGiven",false]) ) then
{
	missionNamespace setVariable ["maskTaskGiven",true,true];

	[east, "MaskTask", ["Destroy supply boxes to mask the mission as a typical raid", "Destroy", ""], nil, "ASSIGNED", 6, false, "destroy", false] call BIS_fnc_taskCreate;
	["TaskAssigned", ["Mask the mission as a raid"]] remoteExecCall ["BIS_fnc_showNotification", east, false];

	//Create trigger to detect and change mask task status
	trigger_masking = createTrigger ["EmptyDetector", [0,0,0], false];
	trigger_masking setTriggerActivation ["NONE", "PRESENT", true];
	trigger_masking setTriggerStatements [
		"
			{ !alive _x &&  } count boxes >= missionNamespace getVariable ['murdered_defenders',0]",
		"
			['MaskTask', 'SUCCEEDED', false] call BIS_fnc_taskSetState;
			['TaskSucceeded', ['Mission masked sufficiently']] remoteExecCall ['BIS_fnc_showNotification', east, false];
		",
		"
			['MaskTask', 'ASSIGNED', false] call BIS_fnc_taskSetState;
			['TaskAssigned', ['Insufficient supplies destroyed']] remoteExecCall ['BIS_fnc_showNotification', east, false];
		"
	];
};
