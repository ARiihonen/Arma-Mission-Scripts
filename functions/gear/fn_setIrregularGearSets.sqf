_side = param [0,west,[west]];
_sets = param [1,"",[""]];

switch _side do {
	case west: { missionNamespace setVariable ["ARTR_IrregularGearWest", true, true]; };
	case east: { missionNamespace setVariable ["ARTR_IrregularGearEast", true, true]; };
	case independent: { missionNamespace setVariable ["ARTR_IrregularGearGuer", true, true]; };
};
