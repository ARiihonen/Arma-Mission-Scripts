diag_log format ["Group ending: %1", _this];
params ["_evidence", "_group", "_task"];
private _ending = "";

//Check percentage of evidence destroyed
private _percentDestroyed = ( { _x getVariable ["evidenceDestroyed",false] } count _evidence ) / ( count _evidence );

//Primary type is lose if less than 75% of the evidence has been destroyed
if (_percentDestroyed < 0.9) then
{
    _ending = "Lose";
    [_task, "FAILED", false] call BIS_fnc_taskSetState;

    //The loss is total if less than 50% has been destroyed, otherwise partial
    if (_percentDestroyed < 0.5) then
    {
        _ending = _ending + "Total";
    } else {
        _ending = _ending + "Partial";
    };
} else {
    //Victory if 90% or more of the evidence has been destroyed
    _ending = "Win";
    [_task, "SUCCEEDED", false] call BIS_fnc_taskSetState;

    //The victory is complete if all evidence was destroyed
    if (_percentDestroyed >= 1) then
    {
        _ending = _ending + "Total";
    } else {
        _ending = _ending + "Partial";
    };
};

//Remoteexec the correct ending on the team's members
[_ending] remoteExecCall ["ARTR_fnc_clientEnding",_group,false];