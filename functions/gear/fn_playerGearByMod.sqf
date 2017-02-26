_vanillaBasicGear = [
	["FirstAidKit", 2]
];
_vanillaMedicGear = [
	["FirstAidKit", 10],
	["Medikit",1]
];

_ACEBasicGear = [
	["ACE_fieldDressing", 6],
	["ACE_epinephrine", 2],
	["ACE_morphine", 2]
];
_ACEMedicGear = [
	["ACE_fieldDressing", 25],
	["ACE_epinephrine", 10],
	["ACE_morphine", 10],
	["ACE_bloodIV_500", 8]
];


if (player == leader (group player) && !("ItemGPS" in assignedItems player)) then
{
	player linkItem "ItemGPS";
};

if ("ace_attach" call ARTR_fnc_checkMod) then {
	player addItem "ACE_IR_Strobe_Item";
};

if ("ace_microdagr" call ARTR_fnc_checkMod && "ItemGPS" in (assignedItems player) ) then
{
	player unLinkItem "ItemGPS";
	player addItemToUniform "ACE_microDagr";
};

if ("ace_logistics_wirecutter" call ARTR_fnc_checkMod) then
{
	player addItemToUniform "ACE_wirecutter";
};

if ("ace_maptools" call ARTR_fnc_checkMod && (player == leader group player || ["_SL_", typeOf player] call BIS_fnc_inString || ["_TL_", typeOf player] call BIS_fnc_inString) ) then
{
	player addItemToUniform "ACE_MapTools";
};


_basicGear = [];
_medicGear = [];

if ("ace_medical" call ARTR_fnc_checkMod) then
{
	_basicGear = _ACEBasicGear;

	if (["medic", typeOf player] call BIS_fnc_inString ) then {
		_medicGear = _ACEMedicGear;
	};
} else {
	_basicGear = _vanillaBasicGear;

	if (["medic", typeOf player] call BIS_fnc_inString ) then {
		_medicGear = _vanillaMedicGear;
	};
};

{
	_item = _x select 0;
	_amount = _x select 1;

	for "_i" from 1 to _amount do {
		player addItemToUniform _item;
	};
} forEach _basicGear;

{
	_item = _x select 0;
	_amount = _x select 1;

	for "_i" from 1 to _amount do {
		player addItemToBackpack _item;
	};
} forEach _medicGear;
