_setSkills = false; 				//BOOL: set AI Skills according to ASR settings
_seekCover = true; 					//BOOL: AI move to cover
_useBuildings = 0.8; 				//FLOAT: Chance that AI search buildings
_getinWeapons = 0.5; 				//FLOAT: Chance that AI get in static or vehicle weapons
_rearm = 50; 						//INT: basic rearming range (meters)
_rearm_mags = 2; 					//INT: rearm if primary has less than (magazines)
_rearm_fak = 1; 					//INT: rearm if first aid less than (kits)
_radiorange = 2000; 				//INT: radio report max range (meters, 0 to disable)
_radiodelay = 5; 					//INT: base radio report delay (seconds)
_delayPlus = 15; 					//INT: max extra delay (seconds)
_packNVG = true; 					//BOOL: AI pack NVGs during day
_fallDOwn = true; 					//BOOL: Soldiers fall when hit
_aiStamina = false; 				//BOOL: Stamina system for AI in players group
_teamSwitchLeader = true; 			//BOOL: become group leader on team switch


_setSkillsSet = ["asr_ai3_main_setskills", _setSkills, true, "client"] call CBA_settings_fnc_set;
_seekCoverSet = ["asr_ai3_main_seekcover", _seekCover, true, "client"] call CBA_settings_fnc_set;
_useBuildingsSet = ["asr_ai3_main_usebuildings", _useBuildings, true, "client"] call CBA_settings_fnc_set;
_getinWeaponsSet = ["asr_ai3_main_getinweapons", _getinWeapons, true, "client"] call CBA_settings_fnc_set;
_rearmSet = ["asr_ai3_main_rearm", _rearm, true, "client"] call CBA_settings_fnc_set;
_rearm_mags_set = ["asr_ai3_main_rearm_mags", _rearm_mags, true, "client"] call CBA_settings_fnc_set;
_rearm_fak_set = ["asr_ai3_main_rearm_fak", _rearm_fak, true, "client"] call CBA_settings_fnc_set;
_radiorangeSet = ["asr_ai3_main_radiorange", _radiorange, true, "client"] call CBA_settings_fnc_set;
_radioDelaySet = ["asr_ai3_main_rrdelaymin", _radiodelay, true, "client"] call CBA_settings_fnc_set;
_delayPlusSet = ["asr_ai3_main_rrdelayplus", _delayPlus, true, "client"] call CBA_settings_fnc_set;
_packNVGSet = ["asr_ai3_main_packNVG", _packNVG, true, "client"] call CBA_settings_fnc_set;
_fallDownSet = ["asr_ai3_main_fallDown", _fallDown, true, "client"] call CBA_settings_fnc_set;
_aiStaminaSet = ["asr_ai3_main_pgaistamina", _aiStamina, true, "client"] call CBA_settings_fnc_set;
_teamSwitchLeaderSet = ["asr_ai3_main_onteamswitchleader", _teamSwitchLeader, true, "client"] call CBA_settings_fnc_set;

diag_log format ["SETTING ASR STUFF: %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14", _setSkillsSet, _seekCoverSet, _useBuildingsSet, _getinWeaponsSet, _rearmSet, _rearm_mags_set, _rearm_fak_set, _radiorangeSet, _radioDelaySet, _delayPlusSet, _packNVGSet, _fallDownSet, _aiStaminaSet, _teamSwitchLeaderSet];
