/*
Randomise gear for irregular soldiers in Eden, so you don't need to waste resources in changing unnecessary gear stuff in-mission.

Params:
	0 - Clothes sets - ARRAY: [UNIFORM SETS,VEST SETS,BACKPACK SETS,HEADGEAR SETS, GOGGLE SETS]
	1 - Weapon sets (optional, default: "leave") - ARRAY:
*/
params [
	["_clothSets", "leave", ["",[]] ],
	["_weaponSets", "leave", ["",[]] ]
];

private _sets = [_clothSets,_weaponSets];
collect3DENHistory {
	{
		[_x,_sets] call ARTR_fnc_setIrregularGear;
		save3DENInventory [_x];
	} forEach get3DENSelected "object";
};
