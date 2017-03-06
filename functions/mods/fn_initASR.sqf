addonASR = false;
if ("asr_ai3_main" call ARTR_fnc_checkMod) then
{
	addonASR = true;

	private _setSkills = false; 				//BOOL: set AI Skills according to ASR settings
	private _seekCover = true; 					//BOOL: AI move to cover
	private _useBuildings = 0.8; 				//FLOAT: Chance that AI search buildings
	private _getinWeapons = 0.5; 				//FLOAT: Chance that AI get in static or vehicle weapons
	private _rearm = 50; 						//INT: basic rearming range (meters)
	private _rearm_mags = 2; 					//INT: rearm if primary has less than (magazines)
	private _rearm_fak = 1; 					//INT: rearm if first aid less than (kits)
	private _radiorange = 500; 				//INT: radio report max range (meters, 0 to disable)
	private _radiodelay = 5; 					//INT: base radio report delay (seconds)
	private _delayPlus = 15; 					//INT: max extra delay (seconds)
	private _packNVG = true; 					//BOOL: AI pack NVGs during day
	private _fallDown = true; 					//BOOL: Soldiers fall when hit
	private _aiStamina = false; 				//BOOL: Stamina system for AI in players group
	private _teamSwitchLeader = true; 			//BOOL: become group leader on team switch

	["asr_ai3_main_setskills", _setSkills, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_seekcover", _seekCover, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_usebuildings", _useBuildings, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_getinweapons", _getinWeapons, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_rearm", _rearm, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_rearm_mags", _rearm_mags, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_rearm_fak", _rearm_fak, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_radiorange", _radiorange, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_rrdelaymin", _radiodelay, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_rrdelayplus", _delayPlus, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_packNVG", _packNVG, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_fallDown", _fallDown, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_pgaistamina", _aiStamina, true, "client"] call CBA_settings_fnc_set;
	["asr_ai3_main_onteamswitchleader", _teamSwitchLeader, true, "client"] call CBA_settings_fnc_set;

};
