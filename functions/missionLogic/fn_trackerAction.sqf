_box = _this select 0;

_box setVariable ["tracked", true, true];
["TrackerPlaced",[]] call BIS_fnc_showNotification;

_box remoteExecCall ["ARTR_fnc_boxTracked", east, true];
