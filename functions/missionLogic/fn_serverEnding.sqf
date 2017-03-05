//Runs end.sqf on everyone. Activate from trigger. For varying mission end states, calculate the correct one here and send it as an argument for end.sqf
_ending = "";
switch ( missionNamespace getVariable ["mission_phase", 0] ) do {
	case 1: {
		_ending = "WinOne";
	};

	case 2: {
		_ending = "WinBoth";
	};

	default {
		_ending = "Lose";
	};
};

if (({ !alive _x } count allPlayers) != 0 ) then {

	if ( (count (allPlayers select { !alive _x })) > ( count allPlayers/2) ) then {
		_ending = _ending + "Heavy";
	} else {
		_ending = _ending + "Light";
	};
};

[_ending] remoteExecCall ["ARTR_fnc_clientEnding",0,false];
