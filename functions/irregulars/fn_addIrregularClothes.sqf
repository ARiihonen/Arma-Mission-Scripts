params [
	["_unit", player, [objNull]]
];

private _clothArray = _unit call ARTR_fnc_getIrregularClothes;

if (count _clothArray > 0) then {

	_clothArray params [
		[ "_uniform", "", [""] ],
		[ "_vest", "", [""] ],
		[ "_backpack", "", [""] ],
		[ "_headwear", "", [""] ],
	];

	if (_uniform != "") then {
		[_unit, _uniform] call ARTR_fnc_switchUniform;
	};

	if (_vest != "") then {
		[_unit, _vest] call ARTR_fnc_switchVest;
	};

	if (count _headWear > 0) then {
		if (_headWear select 0 != "") then {_unit addHeadgear (_headWear select 0);};
		if (_headWear select 1 != "") then {_unit addGoggles (_headWear select 1);};
	};

	if (_backpack != "") then {
		[_unit, _backpack] call ARTR_fnc_switchBackpack;
	};
};
