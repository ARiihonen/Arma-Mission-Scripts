waitUntil { missionNamespace getVariable["ARTR_serverInit", false] }

if (side player == west || side player == resistance) then
{
	{
		deleteMarkerLocal _x;
	} forEach (["mrk_meetOne","mrk_meetTwo","mrk_meetThree","mrk_meetFour"] - ((side player) getVariable "real_meet_location"));
};

call ARTR_fnc_initBriefing;

switch (side player) do
{
	case west: { commandHelo = heloBLU; };
	case east: { commandHelo = heloRED; };
	case resistance: { commandHelo = heloGRN; };
};

//command actions for helicopter
act_heloIn = commandHelo addAction [
	"Pick LZ",
	{player call ARTR_fnc_designateLZ;},
	[],
	2,
	false,
	true,
	nil,
	{vehicle player == (_this select 0) && player == leader group player && !(player getVariable ['ACE_isUnconscious', false])},
	1,
	false
];

act_heloOut = commandHelo addAction [
	"Return to Base",
	{call ARTR_fnc_RTB;},
	[],
	1,
	false,
	true,
	nil,
	{vehicle player == (_this select 0) && player == leader group player && !(player getVariable ['ACE_isUnconscious', false]) &&  time > 15*60},
	1,
	false
];

act_heloPick = commandHelo addAction [
	"Call helicopter",
	{player call ARTR_fnc_designateLZ;},
	[],
	2,
	false,
	true,
	nil,
	{ player call ARTR_fnc_hasRadio && player == leader group player && !(player getVariable ['ACE_isUnconscious', false])},
	1,
	false
];

//Cuff escaping handler
ARTR_captiveEH = [
	"ace_captiveStatusChanged",
	{
		params ["_unit","_state","_type"];

		if (_unit == player && _type == "SetHandcuffed") then
		{
			if (_state) then {
				call ARTR_fnc_handcuffed;
			} else {
				waitUntil {!isNil (player getVariable ["uncuffKeyHandler",nil]) };
				(player getVariable "uncuffKeyHandler") call CBA_fnc_removeKeyHandler;
			};
		};
	}
] call CBA_fnc_addEventHandler;

if (player == hostageBLU || player == hostageGRN) then
{
	[player,true] call ACE_captives_fnc_setHandcuffed;
};
