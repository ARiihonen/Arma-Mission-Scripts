params [
	["_unit", player, [objNull] ],
	["_clothCollection", "leave", [""] ],
	["_weaponCollection", "leave", [""] ]
];

[_unit,_clothCollection] call ARTR_fnc_setIrregularClothes;
[_unit,_weaponCollection] call ARTR_fnc_setIrregularWeapons;
