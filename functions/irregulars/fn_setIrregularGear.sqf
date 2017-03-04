params [
	["_unit", player, [objNull] ],
	["_clothSets", "leave", ["",[]] ],
	["_weaponSets", "leave", ["",[]] ]
];

[_unit,_clothSets] call ARTR_fnc_setIrregularClothes;
[_unit,_weaponSets] call ARTR_fnc_setIrregularWeapons;
