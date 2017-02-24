_unit = _this select 0;
_radios = _this select 1;

diag_log format ["RADIOS ADDED FOR %1: %2", _unit, _radios];

//SQUAD SPECIFIC RADIO CHANNEL SETTINGS: [GROUP ID, DEFAULT CHANNEL]. By default, channel 0 is for inter-squad communication
//Need to use player setgroupID "id"; in unit init-field to get this initialised properly.
ARTR_radioChannels = [
	["Alpha", 1],
	["Beta", 2]
];

_primaryChannel = false;
_secondaryChannel = false;
_groupID = groupID (group player);

//load the radio channel setup
_radioGroups = [];
_radioChannels = [];
{
	_radioGroups set [count _radioGroups, (_x select 0)];
	_radioChannels set [count _radioChannels, (_x select 1)];
} forEach ARTR_radioChannels;

//if player group has specific radio channel, set that
if (_groupID in _radioGroups) then {
	_primaryChannel = _radioChannels select (_radioGroups find _groupID);
};

//if leader, set secondary channel to 0
if (player == leader group player || ["_TL_",(typeOf player)] call BIS_fnc_inString || ["_SL_",(typeOf player)] call BIS_fnc_inString ) then {
	_secondaryChannel = 0;
};

//if player should get primary channel set up, set it up
if (typeName _primaryChannel != "BOOL") then {
	[call TFAR_fnc_activeSwRadio, _primaryChannel] call TFAR_fnc_setSwChannel;
};

//if player should get secondary channel set up, set it up
if (typeName _secondaryChannel != "BOOL") then {
	[call TFAR_fnc_activeSwRadio, _secondaryChannel] call TFAR_fnc_setAdditionalSwChannel;
};
