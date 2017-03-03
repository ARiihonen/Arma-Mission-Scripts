params [
	[ "_unit", player, [objNull] ]
];

_gearArray = [];

_gearArray pushBack (_unit call ARTR_fnc_getIrregularUniform);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularVest);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularHeadwear);
_gearArray pushBack (_unit call ARTR_fnc_getIrregularBackpack);

_gearArray;
