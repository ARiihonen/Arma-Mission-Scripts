params ["_team"];
_team_name = ["WEST","GUER"] select (_team == resistance);

_otherTeam = [west,resistance] select (_team == west);
_otherTeam_name = ["WEST","GUER"] select (_team == west);

{
	deleteVehicle _x;
} forEach everything;

_win_task = _team_name + "Win";
_lose_task = _otherTeam_name + "Win";

[_win_task, "SUCCEEDED", false] call BIS_fnc_taskSetState;
[_lose_task, "FAILED", false] call BIS_fnc_taskSetState;

["Victory"] remoteExecCall ["ARTR_fnc_clientEnding",_team,false];
["Loss"] remoteExecCall ["ARTR_fnc_clientEnding",_otherTeam,false];

_ensureEnd = [] spawn
{
	sleep 20;
	endMission "END1";
};
