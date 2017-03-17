waitUntil { missionNamespace getVariable["ARTR_serverInit", false] };

if (side player == west || side player == resistance) then
{
	{
		deleteMarkerLocal _x;
	} forEach (["mrk_meetOne","mrk_meetTwo","mrk_meetThree","mrk_meetFour"] - [(missionNamespace getVariable "real_meet_location")]);
};

call ARTR_fnc_initBriefing;

switch (side player) do
{
	case west: { commandHelo = heloBLU; };
	case east: { commandHelo = heloRED; };
	case resistance: { commandHelo = heloGRN; };
};

//command actions for helicopter
private _conditionInside = {
	vehicle player == commandHelo &&
	player == leader group player &&
	!(player getVariable ['ACE_isUnconscious', false])
};

private _conditionOutside = {
	vehicle player != commandHelo &&
	player == leader group player &&
	!(player getVariable ['ACE_isUnconscious', false]) &&
	call ARTR_fnc_hasRadio
};

private _conditionGTG = {
	player == leader group player &&
	!(player getVariable ['ACE_isUnconscious', false]) &&
	(vehicle player == commandHelo || player call ARTR_fnc_hasRadio) &&
	commandHelo getVariable ["landed",false]
};

private _conditionRTB = {
	vehicle player == commandHelo &&
	player == leader group player &&
	!(player getVariable ['ACE_isUnconscious', false]) &&
	time > (20*60)
};

act_assignLZ = [
	"assignLZ",
	"Assign LZ",
	"",
	{ commandHelo call ARTR_fnc_designateLZ; },
	{true},
	{},
	[],
	[0,0,0]
] call ace_interact_menu_fnc_createAction;

act_callHelo = [
	"callHelo",
	"Call Helicopter",
	"",
	{ commandHelo call ARTR_fnc_designateLZ; },
	{true},
	{},
	[],
	[0,0,0]
] call ace_interact_menu_fnc_createAction;

act_goodToGo = [
	"callHelo",
	"Clear to lift",
	"",
	{ commandHelo call ARTR_fnc_goodToGo; },
	{true},
	{},
	[],
	[0,0,0],
	20
] call ace_interact_menu_fnc_createAction;

act_rtb = [
	"RTB",
	"Return to Base",
	"",
	{ commandHelo call ARTR_fnc_RTB; },
	{true},
	{},
	[],
	[0,0,0]
] call ace_interact_menu_fnc_createAction;

[commandHelo, 0, ["ACE_Actions"], act_assignLZ] call ace_interact_menu_fnc_addActionToObject;
[commandHelo, 0, ["ACE_Actions"], act_goodToGo] call ace_interact_menu_fnc_addActionToObject;
[commandHelo, 0, ["ACE_Actions"], act_rtb] call ace_interact_menu_fnc_addActionToObject;
[player, 0, ["ACE_SelfActions"], act_callHelo] call ace_interact_menu_fnc_addActionToObject;

//Cuff escaping handler
ARTR_captiveEH = [
	"ace_captiveStatusChanged",
	{
		params ["_unit","_state","_type"];

		if (_unit == player && _type == "SetHandcuffed") then
		{
			if (_state) then
			{
				call ARTR_fnc_handcuffed;
			} else {
				waitUntil {!isNil (player getVariable ["uncuffKeyHandler",nil]) };
				(player getVariable "uncuffKeyHandler") call CBA_fnc_removeKeyHandler;
			};
		};
	}
] call CBA_fnc_addEventHandler;

/*
if (player == hostageBLU || player == hostageGRN) then
{
	[player,true] call ACE_captives_fnc_setHandcuffed;
};
*/
