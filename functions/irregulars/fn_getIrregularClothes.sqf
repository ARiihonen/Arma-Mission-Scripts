params [
	[ "_set", "leave", ["",[]], [1,2,3,4]]
];

private _setArray = [[_set,_set,_set,_set],_set] select (_set isEqualType []);

_setArray params [
	["_uniformSets", "leave", ["",[]]],
	["_vestSets", "leave", ["",[]]],
	["_headwearSets", "leave", ["",[]]],
	["_backpackSets", "leave", ["",[]]]
];

_gearArray = [];

{
	_gearArray pushBack [_x select 0, _x select 1] call ARTR_fnc_getIrregularThing;
} forEach [
	[_uniformSets,ARTR_irregularUniforms],
	[_vestSets,ARTR_irregularVests],
	[_backpackSets,ARTR_irregularBackpacks],
	[_headgearSets,ARTR_irregularHeadgear],
	[_goggleSets,ARTR_irregularGoggles]
];

_gearArray;
