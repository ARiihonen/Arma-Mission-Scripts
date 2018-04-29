/*
With the increased revive time, we still don't really want people to sit idle for five minutes waiting to die if their team has forsaken them. Adding a trigger that checks for friendlies in a near radius and killing the unconscious player if nobody is present for a time will allow people to finish a firefight before healing their friends, but won't have people waiting to die for ages
*/

//Define settings for the trigger (up here for easy modification)
private _areaSize = 10;
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
if (!isNull (player getVariable ["ARTR_killTrigger", objNull])) then
{
    deleteVehicle (player getVariable "ARTR_killTrigger");
};

//Select the correct trigger condition based on whether ACE Medical is on
private _conditionString = ["this && lifeState player == 'INCAPACITATED'", "this && player getVariable ['ACE_isUnconscious', false]"] select ("ace_medical" call ARTR_fnc_checkMod);

//Create the trigger: kill player after the interruptable timeout if there are no friendlies within the specified range
tr_killTimer = createTrigger ["emptyDetector", player, false];
tr_killTimer setTriggerArea [_areaSize, _areaSize, 0, false];
tr_killTimer setTriggerActivation [_sideString, "PRESENT", false];
tr_killTimer setTriggerTimeout [_timeOut,_timeOut,_timeOut,true];
tr_killTimer setTriggerStatements [
    _conditionString,
    "player setDamage 1;",
	""
];

//Attach the trigger to the player
player setVariable ["ARTR_killTrigger", tr_killTimer, false];
tr_killTimer attachTo [player, [0,0,0]];
