addonTFAR = false;

if ("task_force_radio" call ARTR_fnc_checkMod) then
{
	addonTFAR = true;

	call compile preprocessFileLineNumbers "\task_force_radio\functions\common.sqf";

	//General settings
	_autoLR = false; 			//automatically add backpack radio to leader
	_gruntUpgrade = true; 		//give personal radio to regular riflemen
	_microDagr = false;			//give microDAGR to regular riflemen
	_sameSW = true;				//same SW frequency for entire side
	_sameLR = true;				//same LR frequency for entire side
	_sameDD = true;				//same DD frequency for entire side


	//BLUFOR radios and channel settings
	tf_west_radio_code = "_blufor";
	TF_defaultWestBackpack = "tf_rt1523g";
	TF_defaultWestPersonalRadio = "tf_anprc152";
	TF_defaultWestRiflemanRadio = "tf_rf7800str";
	TF_defaultWestAirborneRadio = "tf_anarc210";

	//GREENFOR radios and channel settings
	tf_guer_radio_code = "_independent";
	TF_defaultGuerBackpack = "tf_anprc155";
	TF_defaultGuerPersonalRadio = "tf_anprc148jem";
	TF_defaultGuerRiflemanRadio = "tf_anprc154";
	TF_defaultGuerAirborneRadio = "tf_anarc164";

	//REDFOR radios and channel settings
	tf_east_radio_code = "_opfor";
	TF_defaultEastBackpack = "tf_mr3000";
	TF_defaultEastPersonalRadio = "tf_fadak";
	TF_defaultEastRiflemanRadio = "tf_pnr1000a";
	TF_defaultEastAirborneRadio = "tf_mr6000l";


	["CBA_settings_setSettingMission", ["TF_no_auto_long_range_radio",_autoLR,true]] call CBA_fnc_localEvent;
	["CBA_settings_setSettingMission", ["TF_give_personal_radio_to_regular_soldier",_gruntUpgrade,true]] call CBA_fnc_localEvent;
	["CBA_settings_setSettingMission", ["TF_give_microdagr_to_soldier",_microDagr,true]] call CBA_fnc_localEvent;
	["CBA_settings_setSettingMission", ["TF_same_sw_frequencies_for_side",_sameSW,true]] call CBA_fnc_localEvent;
	["CBA_settings_setSettingMission", ["TF_same_lr_frequencies_for_side",_sameLR,true]] call CBA_fnc_localEvent;
	["CBA_settings_setSettingMission", ["TF_same_dd_frequencies_for_side",_sameDD,true]] call CBA_fnc_localEvent;

	/*
	[
		"CBA_beforeSettingsInitialized",
		{
			["CBA_settings_setSettingMission", ["TF_no_auto_long_range_radio",ARTR_TFAR_autoLR,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_give_personal_radio_to_regular_soldier",ARTR_TFAR_gruntUpgrade,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_give_microdagr_to_soldier",ARTR_TFAR_microDagr,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_same_sw_frequencies_for_side",ARTR_TFAR_sameSW,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_same_lr_frequencies_for_side",ARTR_TFAR_sameLR,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_same_dd_frequencies_for_side",ARTR_TFAR_sameDD,true]] call CBA_fnc_localEvent;
			["CBA_beforeSettingsInitialized",_thisId] call CBA_fnc_removeEventHandler;
		},
		[]
	] call CBA_fnc_addEventHandlerArgs;
	*/

	["ARTR_receivedRadios", "OnRadiosReceived", { _this call ARTR_fnc_TFARRadiosAdded; }, player] call TFAR_fnc_addEventHandler;
};
