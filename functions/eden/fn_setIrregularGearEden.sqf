/*
Randomise gear for irregular soldiers in Eden, so you don't need to waste resources in changing unnecessary gear stuff in-mission.

Params:
	0 - Clothes collection - STRING (leave/remove or a collection in ARTR_irregularCollections)
	1 - Weapon collection (optional, default: "leave") - STRING (leave/remove or a collection defined in ARTR_irregularCollections)
*/
params [
	["_clothCollection", "leave", [""] ],
	["_weaponCollection", "leave", [""] ]
];

collect3DENHistory {
	{
		[_x,_clothCollection,_weaponCollection] call ARTR_fnc_setIrregularGear;
		save3DENInventory [_x];
	} forEach get3DENSelected "object";
};
