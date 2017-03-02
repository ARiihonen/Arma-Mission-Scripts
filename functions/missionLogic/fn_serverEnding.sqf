//calculate which ending to show here, then remoteExec the ending on all clients
_end = "Lose";

[_end] remoteExecCall ["ARTR_fnc_clientEnding",0,false];
