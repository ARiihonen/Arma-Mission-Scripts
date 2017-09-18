addonTFAR = false;

if ("task_force_radio" call ARTR_fnc_checkMod) then
{
	addonTFAR = true;

	//BLUFOR radios and channel settings
	TFAR_west_radio_code = "_blufor";
	TFAR_defaultWestBackpack = "TFAR_rt1523g";
	TFAR_defaultWestPersonalRadio = "TFAR_anprc152";
	TFAR_defaultWestRiflemanRadio = "TFAR_rf7800str";
	TFAR_defaultWestAirborneRadio = "TFAR_anarc210";

	//GREENFOR radios and channel settings
	TFAR_guer_radio_code = "_independent";
	TFAR_defaultGuerBackpack = "TFAR_anprc155";
	TFAR_defaultGuerPersonalRadio = "TFAR_anprc148jem";
	TFAR_defaultGuerRiflemanRadio = "TFAR_anprc154";
	TFAR_defaultGuerAirborneRadio = "TFAR_anarc164";

	//REDFOR radios and channel settings
	TFAR_east_radio_code = "_opfor";
	TFAR_defaultEastBackpack = "TFAR_mr3000";
	TFAR_defaultEastPersonalRadio = "TFAR_fadak";
	TFAR_defaultEastRiflemanRadio = "TFAR_pnr1000a";
	TFAR_defaultEastAirborneRadio = "TFAR_mr6000l";


	["ARTR_receivedRadios", "OnRadiosReceived", { _this call ARTR_fnc_TFARRadiosAdded; }, player] call TFAR_fnc_addEventHandler;
};
