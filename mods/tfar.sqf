//General settings
tf_no_auto_long_range_radio = true; //Disables automatic distribution of backpack radios to group leaders.
tf_give_personal_radio_to_regular_soldier = false; //Enables distribution of commander radios to squadmates.
tf_same_sw_frequencies_for_side = true; //Generates identical short range radio settings for the entire faction.
tf_same_lr_frequencies_for_side = true; //Generates identical long range radio settings for the entire faction.
TF_give_microdagr_to_soldier = false; //Determines whether or not MicroDAGR is issued.

//BLUFOR radios and channel settings
tf_west_radio_code = "_independent";
tf_defaultWestBacpkpack = "tf_anprc155";
tf_defaultWestPersonalRadio = "tf_anprc148jem";
tf_defaultWestRiflemanRadio = "tf_anprc154";
tf_defaultWestAirborneRadio = "tf_anarc156";

_settingsSwWest = false call TFAR_fnc_generateSwSettings;
_settingsSwWest set [2, ["31.00","31.05","31.10","31.20","31.30","31.40"]];
tf_freq_west = _settingsSwWest;

_settingsLrWest = false call TFAR_fnc_generateLrSettings;
_settingsLrWest set [2, ["31","32","33","40","50","51"]];
tf_freq_west_lr = _settingsLrWest;

//GREENFOR radios and channel settings
tf_guer_radio_code = "_independent";
tf_defaultGuerBacpkpack = "tf_anprc155";
tf_defaultGuerPersonalRadio = "tf_anprc148jem";
tf_defaultGuerRiflemanRadio = "tf_anprc154";
tf_defaultGuerAirborneRadio = "tf_anarc156";

_settingsSwGuer = false call TFAR_fnc_generateSwSettings;
_settingsSwGuer set [2, ["31.00","31.05","31.10","31.20","31.30","31.40"]];
tf_freq_Guer = _settingsSwGuer;

_settingsLrGuer = false call TFAR_fnc_generateLrSettings;
_settingsLrGuer set [2, ["31","32","33","40","50","51"]];
tf_freq_Guer_lr = _settingsLrGuer;

//REDFOR radios and channel settings
tf_east_radio_code = "_independent";
tf_defaultEastBacpkpack = "tf_anprc155";
tf_defaultEastPersonalRadio = "tf_anprc148jem";
tf_defaultEastRiflemanRadio = "tf_anprc154";
tf_defaultEastAirborneRadio = "tf_anarc156";

_settingsSwEast = false call TFAR_fnc_generateSwSettings;
_settingsSwEast set [2, ["31.00","31.05","31.10","31.20","31.30","31.40"]];
tf_freq_east = _settingsSwEast;

_settingsLrEast = false call TFAR_fnc_generateLrSettings;
_settingsLrEast set [2, ["31","32","33","40","50","51"]];
tf_freq_east_lr = _settingsLrEast;

//SQUAD SPECIFIC RADIO CHANNEL SETTINGS: [GROUP ID, DEFAULT CHANNEL]. By default, channel 0 is for inter-squad communication
//Need to use player setgroupID "id"; in unit init-field to get this initialised properly.
caran_radioChannels = [
	["Command", 1],
	["Alpha", 2],
	["Bravo", 3],
	["Sierra", 4]
];

caran_playerRadioSetup = {
	#include "\task_force_radio\functions\common.sqf";
	WaitUntil {sleep 0.1; count (player call TFAR_fnc_radiosList) > 0};

	_primaryChannel = false;
	_secondaryChannel = false;
	_groupID = groupID (group player);
	
	//load the radio channel setup
	_radioGroups = [];
	_radioChannels = [];
	{
		_radioGroups set [count _radioGroups, (_x select 0)];
		_radioChannels set [count _radioChannels, (_x select 1)];
	} forEach caran_radioChannels;
	
	//if player group has specific radio channel, set that
	if (_groupID in _radioGroups) then {
		_primaryChannel = _radioChannels select (_radioGroups find _groupID);
	};
	
	//if leader, set secondary channel to 0
	if (player == leader group player) then {
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
};