/*
With the increased revive time, we still don't really want people to sit idle for five minutes waiting to die if their team has forsaken them. Adding a trigger that checks for friendlies in a near radius and killing the unconscious player if nobody is present for a time will allow people to finish a firefight before healing their friends, but won't have people waiting to die for ages
*/

//Define settings for the trigger (up here for easy modification)
private _minDistance = 10;
private _timeOut = 60;

//remove previous trigger if it exists
if (!isNull (player getVariable ["ARTR_killTrigger", objNull])) then
{
    deleteVehicle (player getVariable "ARTR_killTrigger");
};

//Build trigger condition based on mod factors

//Player unconsciousness
private _unconsciousString = ["lifeState player == 'INCAPACITATED'", "player getVariable ['ACE_isUnconscious', false]"] select ("ace_medical" call ARTR_fnc_checkMod);

//Active friendlies condition
private _nearbyCondition = "alive _x && ";
if ("ace_medical" call ARTR_fnc_checkMod) then
{
	_nearbyCondition = _nearbyCondition + "!(_x getVariable ['ACE_isUnconscious', false])";
} else {
	_nearbyCondition = _nearbyCondition + "lifeState _x != 'INCAPACITATED'";
};

//Finalize _conditionString
private _conditionString = _unconsciousString + " && ({ side _x == " + str(playerSide) + " && " + _nearbyCondition + " && _x distance player <= " + str(_minDistance) + "} count playableUnits <= 0)";

diag_log "DEATH TIMER LOGIC";
diag_log _conditionString;

//Create the trigger: kill player after the interruptable timeout if there are no friendlies within the specified range
tr_killTimer = [
	_conditionString,
	"player setDamage 1;"
] call ARTR_fnc_emptyTrigger;
tr_killTimer setTriggerTimeout [_timeOut, _timeOut, _timeOut, true];

//Store the variable in case of respawns and stuff
player setVariable ["ARTR_killTrigger", tr_killTimer, false];
