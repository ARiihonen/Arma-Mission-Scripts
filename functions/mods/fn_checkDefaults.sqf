addonACEMedical = "ACE_Medical" call ARTR_fnc_checkMod;
addonTFAR = "task_force_radio" call ARTR_fnc_checkMod;
addonACRE = false;

if (addonTFAR) then {
	call ARTR_fnc_initTFAR;
};

if (addonACRE) then {
	call ARTR_fnc_initACRE;
};
