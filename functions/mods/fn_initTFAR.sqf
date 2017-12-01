addonTFAR = false;

if ("task_force_radio" call ARTR_fnc_checkMod) then
{
	addonTFAR = true;

	["ARTR_receivedRadios", "OnRadiosReceived", { _this call ARTR_fnc_TFARRadiosAdded; }, player] call TFAR_fnc_addEventHandler;
};
