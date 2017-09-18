addonTFAR = false;

if ("task_force_radio" call ARTR_fnc_checkMod) then
{
	addonTFAR = true;

	//BLUFOR radios and channel settings
	TF_west_radio_code = "_blufor";
	TF_defaultWestBackpack = "TFAR_rt1523g";
	TF_defaultWestPersonalRadio = "TFAR_anprc152";
	TF_defaultWestRiflemanRadio = "TFAR_rf7800str";
	TF_defaultWestAirborneRadio = "TFAR_anarc210";

	//GREENFOR radios and channel settings
	TF_guer_radio_code = "_independent";
	TF_defaultGuerBackpack = "TFAR_anprc155";
	TF_defaultGuerPersonalRadio = "TFAR_anprc148jem";
	TF_defaultGuerRiflemanRadio = "TFAR_anprc154";
	TF_defaultGuerAirborneRadio = "TFAR_anarc164";

	//REDFOR radios and channel settings
	TF_east_radio_code = "_opfor";
	TF_defaultEastBackpack = "TFAR_mr3000";
	TF_defaultEastPersonalRadio = "TFAR_fadak";
	TF_defaultEastRiflemanRadio = "TFAR_pnr1000a";
	TF_defaultEastAirborneRadio = "TFAR_mr6000l";

	//Default frequencies
	if (isServer) then
	{
	    TFAR_defaultFrequencies_sr_west = ["45","50","60","70","80","90","100","110","120"];
        TFAR_defaultFrequencies_lr_west = ["45","55","65","75","85","95","105","115","125"];
        TFAR_defaultFrequencies_sr_east = ["45","50","60","70","80","90","100","110","120"];
        TFAR_defaultFrequencies_lr_east = ["45","55","65","75","85","95","105","115","125"];
        TFAR_defaultFrequencies_sr_independent = ["45","50","60","70","80","90","100","110","120"];
        TFAR_defaultFrequencies_lr_independent = ["45","55","65","75","85","95","105","115","125"];
	};

	["ARTR_receivedRadios", "OnRadiosReceived", { _this call ARTR_fnc_TFARRadiosAdded; }, player] call TFAR_fnc_addEventHandler;
};
