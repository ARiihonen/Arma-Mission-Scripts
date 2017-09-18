params [
	[ "_unit", player, [objNull] ],
	[ "_radios", [], [[]] ]
];

//SQUAD SPECIFIC RADIO CHANNEL SETTINGS: [GROUP ID, DEFAULT CHANNEL]. By default, channel 0 is for inter-squad communication
//Need to use player setgroupID "id"; in unit init-field to get this initialised properly.
ARTR_radioChannels = [

];

_addStuff = [] spawn {
	waitUntil { missionNamespace getVariable ["artr_gearAdded",false] };

	private _primaryChannel = -1;
	private _secondaryChannel = -1;
	private _groupID = groupID (group player);

	//load the radio channel setup
	private _radioGroups = [];
	private _radioChannels = [];
	{
		_radioGroups pushBack (_x select 0);
		_radioChannels pushBack (_x select 1);
	} forEach ARTR_radioChannels;

	//if player group has specific radio channel, set that
	if (_groupID in _radioGroups) then {
		_primaryChannel = _radioChannels select (_radioGroups find _groupID);
	};

	//if leader, set secondary channel to 0
	if (player == leader group player || (typeOf player) find "_SL_" >= 0 || (typeOf player) find "_TL_" >= 0 ) then {
		_secondaryChannel = 0;
	};

	//if player should get primary channel set up, set it up
	if (_primaryChannel != -1) then {
		[call TFAR_fnc_activeSwRadio, _primaryChannel] call TFAR_fnc_setSwChannel;
	};

	//if player should get secondary channel set up, set it up
	if (_secondaryChannel != -1) then {
		[call TFAR_fnc_activeSwRadio, _secondaryChannel] call TFAR_fnc_setAdditionalSwChannel;
	};

	missionNamespace setVariable ["artr_gearAdded", false, false];
};
