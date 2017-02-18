//calculate which ending to show here, then remoteExec the ending on all clients

//Win if all enemies dead, lose if not, then remoteExec on everyone
_end = if ( {side _x == WEST} count allUnits <= 0 ) then { "Win"; } else { "Lose"; };

//Update task: success if win, failure if not
if (_end == "Win") then {
	["clearTask", "SUCCEEDED", false] call BIS_fnc_taskSetState;
} else {
	["clearTask", "FAILED", false] call BIS_fnc_taskSetState;
};

[_end] remoteExecCall ["ARTR_fnc_clientEnding",0,false];
