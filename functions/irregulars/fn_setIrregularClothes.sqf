params [
	["_unit", player, [objNull]],
	["_collection", "leave", [""] ]
];

private _clothArray = _collection call ARTR_fnc_getIrregularClothes;

_clothArray params [
	[ "_uniform", "leave", [""] ],
	[ "_vest", "leave", [""] ],
	[ "_backpack", "leave", [""] ],
	[ "_headgear", "leave", [""] ],
	[ "_goggles", "leave", [""] ]
];

switch (_uniform) do
{
	case "remove": { removeUniform _unit; };
	case "leave": {};
	default { [_unit,_uniform] call ARTR_fnc_switchUniform; };
};

switch (_vest) do
{
	case "remove": { removeUniform _unit; };
	case "leave": {};
	default { [_unit,_vest] call ARTR_fnc_switchVest; };
};

switch (_backpack) do
{
	case "remove": { removeUniform _unit; };
	case "leave": {};
	default { [_unit,_backpack] call ARTR_fnc_switchBackpack; };
};

if (_headgear != "leave") then {
	_headgear = [_headgear,"remove"] select (random 1 > 0.5);
};
switch (_headgear) do
{
	case "remove": { removeHeadgear _unit; };
	case "leave": {};
	default { _unit addHeadgear _headgear; };
};

if (_goggles != "leave") then {
	_goggles = [_goggles,"remove"] select (random 1 > 0.5);
};
switch (_goggles) do
{
	case "remove": { removeGoggles _unit; };
	case "leave": {};
	default { _unit addGoggles _goggles; };
};

if (( ((goggles _unit) find "Balaclava" >= 0 ) && ((headgear _unit) find "Helmet" >= 0 )) || ((headgear _unit) find "Shemag" >= 0 )) then
{
	if (random 1 > 0.5) then { removeGoggles _unit; } else { removeHeadgear _unit };
};
