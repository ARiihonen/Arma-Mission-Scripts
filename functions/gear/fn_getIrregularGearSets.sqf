_unit = _this;

_gearSets = [];
switch (side _unit) do {
	case east: { _gearSets = missionNamespace getVariable ["ARTR_IrregularGearEast", false]; };
	case west: { _gearSets = missionNamespace getVariable ["ARTR_IrregularGearWest", false]; };
	case independent: {	_gearSets = missionNamespace getVariable ["ARTR_IrregularGearGuer", false]; };
	default { _gearSets = false; };
};

_gearSets;
