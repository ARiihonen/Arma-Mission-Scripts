/*
With the increased revive time, we still don't really want people to sit idle for five minutes waiting to die if their team has forsaken them. Adding a trigger that checks for friendlies in a near radius and killing the unconscious player if nobody is present for a time will allow people to finish a firefight before healing their friends, but won't have people waiting to die for ages
*/

//Define settings for the trigger (up here for easy modification)
private _maxRange = 15;
private _timeOut = 60;

//Get the trigger-friendly string for player side
private _sideString = "";
switch (playerSide) do
{
    case west: { _sideString = "WEST"; };
    case east: { _sideString = "EAST"; };
    case resistance: { _sideString = "GUER"; };
    case civilian: { _sideString = "CIV"; };
};

//remove previous trigger if it exists
if (!isNull (player getVariable ["ARTR_killTimer", objNull])) then
{
    deleteVehicle (player getVariable "ARTR_killTimer");
};

//Create trigger that kills player if no conscious friendlies are within range
private _tr_killTimer = [
    format [
        "
            player getVariable ['ace_isUnconscious', false] &&
            {
                {
                    _x distance player <= %1 &&
                    {
                        side _x == playerSide && !(_x getVariable ['ace_isUnconscious', false])
                    }
                } count playableUnits <= 0
            }
        ",
        _maxRange
    ],
    "player setDamage 1;"
] call ARTR_fnc_emptyTrigger;
_tr_killTimer setTriggerTimeout [_timeOut, _timeOut, _timeOut, true];

//Store the trigger in player namespace
player setVariable ["ARTR_killTimer", _tr_killTimer, false];