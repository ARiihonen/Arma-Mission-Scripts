
//copy default channel preset
["ACRE_PRC152", "default", "example1"] call acre_api_fnc_copyPreset;

//Name individual channels
["ACRE_PRC152", "example1", 1, "description", "FALCON"] call acre_api_fnc_setPresetChannelField;

//Save new channel setup
["ACRE_PRC152", "example1"] call acre_api_fnc_setPreset;

caran_playerRadioSetup = {
	_unit = player;
	_team = groupID (group player);

	waitUntil { ([] call acre_api_fnc_isInitialized) };
	
	if (player == leader group player) then {
		waitUntil { count ([] call acre_api_fnc_getCurrentRadioList) == 2 };
	} else {
		waitUntil { count ([] call acre_api_fnc_getCurrentRadioList) == 1  };
	};

	switch _team do {
		//Set team internal radio channels
		case 'Command': { [ (["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 1] call acre_api_fnc_setRadioChannel; };
		case 'Alpha': { [ (["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel; };
		case 'Bravo': { [ (["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 3] call acre_api_fnc_setRadioChannel; };
		case 'Sierra': { [ (["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 4] call acre_api_fnc_setRadioChannel; };
	};
	
	if (player == leader group player) then {
		[ (["ACRE_PRC152"] call acre_api_fnc_getRadioByType), 1] call acre_api_fnc_setRadioChannel;
		_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType; 
		_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType; 
		_success = [ [ _personalRadio, _handheldRadio ] ] call acre_api_fnc_setMultiPushToTalkAssignment;
	};
};