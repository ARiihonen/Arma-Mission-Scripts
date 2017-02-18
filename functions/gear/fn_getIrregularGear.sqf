_side = side _this;

_gearArray = [];

_gearArray pushBack (_unit call ARTR_fnc_getIrregularUniform);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularVest);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularHeadwear);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularBackpack);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularWeapons);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularItems);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularWeaponItems);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularLinkItems);

diag_log "";
diag_log format ["UNIT %1, GEARARRAY %2", _this, _gearArray];

_gearArray;
