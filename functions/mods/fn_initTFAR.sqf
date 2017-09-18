addonTFAR = false;

if ("task_force_radio" call ARTR_fnc_checkMod) then
{
	addonTFAR = true;

	call compile preprocessFileLineNumbers "\task_force_radio\functions\common.sqf";

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


	["ARTR_receivedRadios", "OnRadiosReceived", { _this call ARTR_fnc_TFARRadiosAdded; }, player] call TFAR_fnc_addEventHandler;
};
