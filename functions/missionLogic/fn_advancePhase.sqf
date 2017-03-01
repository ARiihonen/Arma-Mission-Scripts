switch ( missionNamespace getVariable ["mission_phase", 0] ) do {
	case 0:
	{
		["ClearTask", "Succeeded", false] call BIS_fnc_taskSetState;
		["TaskSucceeded", ["Island cleared"]] remoteExec ["BIS_fnc_showNotification", west, false];

		missionNamespace setVariable ["mission_phase", 1, true];

		_newTasking = [] spawn
		{

			if ( count (allPlayers select { !alive _x }) == 0 ) then
			{

				//radio message if no players have died
				[ukko,"newTask"] remoteExec ["sideRadio", 0, false];

				"marker_camps" setMarkerAlpha 1;
				"mrk_lz" setMarkerAlpha 1;

				"marker_island" setMarkerColor "colorGUER";
				"marker_island" setMarkerBrush "FDiagonal";

				sleep 10;

				[ukko,"heloPickup"] remoteExec ["sideRadio", 0, false];

				[west, "BoardHelo", ["A helicopter is coming to pick you up from the beach for transport to your new task.", "Board transport", "Board"], markerPos "mrk_pickup", "assigned", 3, false, "default", false] call BIS_fnc_taskCreate;
				["TaskAssigned", ["Board helicopter"]] remoteExec ["BIS_fnc_showNotification", west, false];

				[west, "ClearAnother", ["SIGINT has picked up communications between the guerrilla fighters on the island and another group. Continue the operation and clear the other camp.", "Clear New Camp", "Clear"], markerPos "marker_camps", "created", 2, false, "attack", false] call BIS_fnc_taskCreate;

			} else {

				//radio message if some players have died
				[ukko,"rtbBad"] remoteExec ["sideRadio", 0, false];

				sleep 2;

				call ARTR_fnc_serverEnding;
			};
		};
	};

	case 1:
	{
		["ClearAnother", "Succeeded", false] call BIS_fnc_taskSetState;
		["TaskSucceeded", ["Camp cleared"]] remoteExec ["BIS_fnc_showNotification", west, false];

		missionNamespace setVariable ["mission_phase", 2, true];

		"marker_camps" setMarkerColor "colorGUER";
		"marker_camps" setMarkerBrush "FDiagonal";

		_endMission = [] spawn
		{
			if ( count (allPlayers select { !alive _x }) == 0 ) then
			{
				//radio message if no players have died
				[ukko,"rtbGood"] remoteExec ["sideRadio", 0, false];
			} else {
				//radio message if some players have died
				[ukko,"rtbBad"] remoteExec ["sideRadio", 0, false];
			};

			sleep 2;

			call ARTR_fnc_serverEnding;
		};
	};
};
