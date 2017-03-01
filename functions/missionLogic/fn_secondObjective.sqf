["TaskAssigned", ["Clear second camp"]] remoteExec ["BIS_fnc_showNotification", west, false];
["ClearAnother", "ASSIGNED", false] spawn BIS_fnc_taskSetState;
