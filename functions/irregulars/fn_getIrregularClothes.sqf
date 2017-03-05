params [
	[ "_collection", "leave", [""]]
];

private _uniformSets = "leave";
private _vestSets = "leave";
private _backpackSets = "leave";
private _headgearSets = "leave";
private _goggleSets = "leave";

switch (_collection) do
{
	case "leave": {};
	case "remove":
	{
		_uniformSets = "remove";
		_vestSets = "remove";
		_backpackSets = "remove";
		_headgearSets = "remove";
		_goggleSets = "remove";
	};
	default
	{
		private _sets = ([_collection,ARTR_irregularClothCollections] call ARTR_fnc_getIrregularThing);

		_uniformSets = _sets select 0;
		_vestSets = _sets select 1;
		_headgearSets = _sets select 2;
		_goggleSets = _sets select 3;
		_backpackSets = _sets select 4;
	};
};

_gearArray = [];
{
	_gearArray pushBack ([_x select 0, _x select 1] call ARTR_fnc_getIrregularThing);
} forEach [
	[_uniformSets,ARTR_irregularUniforms],
	[_vestSets,ARTR_irregularVests],
	[_backpackSets,ARTR_irregularBackpacks],
	[_headgearSets,ARTR_irregularHeadgear],
	[_goggleSets,ARTR_irregularGoggles]
];

_gearArray;
