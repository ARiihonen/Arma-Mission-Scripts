addonTFAR = false;

if ("task_force_radio" call ARTR_fnc_checkMod) then
{
	addonTFAR = true;

	call compile preprocessFileLineNumbers "\task_force_radio\functions\common.sqf";

	//General settings
	ARTR_TFAR_autoLR = false; 			//automatically add backpack radio to leader
	ARTR_TFAR_gruntUpgrade = true; 		//give personal radio to regular riflemen
	ARTR_TFAR_microDagr = false;			//give microDAGR to regular riflemen
	ARTR_TFAR_sameSW = true;				//same SW frequency for entire side
	ARTR_TFAR_sameLR = true;				//same LR frequency for entire side
	ARTR_TFAR_sameDD = true;				//same DD frequency for entire side

	private _gearSetting = "default";
	switch ("GearPreference" call BIS_fnc_getParamValue) do
	{
		case 1: {
			if ("rhsusf_c_weapons" call ARTR_fnc_checkMod) then { _gearSetting = "RHSUSF"; };
		};
		case 2: {
			if ("UK3CB_BAF_Weapons" call ARTR_fnc_checkMod && "UK3CB_BAF_Equipment" call ARTR_fnc_checkMod) then { _gearSetting =  "BAF"; };
		};
		case 3: {
			if ("rhs_c_weapons" call ARTR_fnc_checkMod) then { _gearSetting = "RHSAFRF"; };
		};
	};

	//BLUFOR radios and channel settings
	tf_west_radio_code = "_blufor";
	switch( _gearSetting ) do
	{
		case "RHSUSF": {
			TF_defaultWestBackpack = "tf_anprc155_coyote";
			TF_defaultWestPersonalRadio = "tf_anprc152";
			TF_defaultWestRiflemanRadio = "tf_anprc152";
			TF_defaultWestAirborneRadio = "tf_anarc210";
		};

		case "RHSAFRF": {
			TF_defaultWestBackpack = "tf_mr3000_rhs";
			TF_defaultWestPersonalRadio = "tf_anprc152";
			TF_defaultWestRiflemanRadio = "tf_anprc152";
			TF_defaultWestAirborneRadio = "tf_mr6000l";
		};

		case "BAF": {
			TF_defaultWestBackpack = "UK3CB_BAF_B_Bergen_DPMT_JTAC_A";
			TF_defaultWestPersonalRadio = "tf_anprc152";
			TF_defaultWestRiflemanRadio = "tf_anprc152";
			TF_defaultWestAirborneRadio = "tf_anarc210";
		};

		default {
			TF_defaultWestBackpack = "tf_rt1523g";
			TF_defaultWestPersonalRadio = "tf_anprc152";
			TF_defaultWestRiflemanRadio = "tf_anprc152";
			TF_defaultWestAirborneRadio = "tf_anarc210";
		};
	};

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

	[
		"CBA_beforeSettingsInitialized",
		{
			["CBA_settings_setSettingMission", ["TF_no_auto_long_range_radio",ARTR_TFAR_autoLR,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_give_personal_radio_to_regular_soldier",ARTR_TFAR_gruntUpgrade,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_give_microdagr_to_soldier",ARTR_TFAR_microDagr,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_same_sw_frequencies_for_side",ARTR_TFAR_sameSW,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_same_lr_frequencies_for_side",ARTR_TFAR_sameLR,true]] call CBA_fnc_localEvent;
			["CBA_settings_setSettingMission", ["TF_same_dd_frequencies_for_side",ARTR_TFAR_sameDD,true]] call CBA_fnc_localEvent;
			["CBA_beforeSettingsInitialized",ARTR_TFAR_thisId] call CBA_fnc_removeEventHandler;
		},
		[]
	] call CBA_fnc_addEventHandlerArgs;

	["ARTR_receivedRadios", "OnRadiosReceived", { _this call ARTR_fnc_TFARRadiosAdded; }, player] call TFAR_fnc_addEventHandler;

	["ARTR_AIHearing", "OnSpeak", { _this call ARTR_fnc_TFARSpeaking; }, player] call TFAR_fnc_addEventHandler;

	["ARTR_TFARVolume", "OnSpeakVolume", { _this call ARTR_fnc_TFARVolumeChange; }, player] call TFAR_fnc_addEventHandler;
};
