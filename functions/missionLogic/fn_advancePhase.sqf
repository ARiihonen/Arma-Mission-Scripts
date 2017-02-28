switch ( missionNamespace getVariable ["mission_phase", 0] ) do {
	case 1: {
		["ClearAnother", "Succeeded", false] call BIS_fnc_taskSetState;
		["TaskSucceeded", ["Camp cleared"]] remoteExec ["BIS_fnc_showNotification", west, false];

		missionNamespace setVariable ["mission_phase", 2, true];

		_endMission = [] spawn {
			if ( count (allPlayers select { !alive _x }) == 0 ) then {
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

	case 0: {
		["ClearTask", "Succeeded", false] call BIS_fnc_taskSetState;
		["TaskSucceeded", ["Island cleared"]] remoteExec ["BIS_fnc_showNotification", west, false];

		missionNamespace setVariable ["mission_phase", 1, true];

		_newTasking = [] spawn {

			if ( count (allPlayers select { !alive _x }) == 0 ) then {

				//radio message if no players have died
				[ukko,"newTask"] remoteExec ["sideRadio", 0, false];

				sleep 2;

				[west, "ClearAnother", ["SIGINT has picked up communications between the guerrilla fighters on the island and another group. Continue the operation and clear the other camp.", "Clear New Camp", "Clear"], markerPos "marker_camps", "assigned", 2, false, "attack", false] call BIS_fnc_taskCreate;
				["TaskAssigned", ["Clear new camp"]] remoteExec ["BIS_fnc_showNotification", west, false];

				"marker_camps" setMarkerAlpha 1;

			} else {

				//radio message if some players have died
				[ukko,"rtbBad"] remoteExec ["sideRadio", 0, false];

				sleep 2;

				call ARTR_fnc_serverEnding;
			};
		};
	};
};
