params [
	["_unit", player, [objNull]]
];


private _vanillaBasicGear = [
	["FirstAidKit", 2]
];
private _vanillaMedicGear = [
	["FirstAidKit", 10],
	["Medikit",1]
];

private _ACEBasicGear = [
	["ACE_fieldDressing", 6],
	["ACE_epinephrine", 2],
	["ACE_morphine", 2]
];
private _ACEMedicGear = [
	["ACE_fieldDressing", 25],
	["ACE_epinephrine", 10],
	["ACE_morphine", 10],
	["ACE_bloodIV_500", 8]
];

private _ACEAdvGear = [
	["ACE_fieldDressing", 6],
	["ACE_packingBandage", 6],
	["ACE_epinephrine", 2],
	["ACE_morphine", 2],
	["ACE_tourniquet", 2]
];
private _ACEAdvMedicGear = [
	["ACE_fieldDressing", 15],
	["ACE_packingBandage", 15],
	["ACE_elasticBandage", 15],
	["ACE_quikclot", 15],
	["ACE_epinephrine", 10],
	["ACE_morphine", 10],
	["ACE_atropine", 10],
	["ACE_tourniquet", 5],
	["ACE_bloodIV_500", 8]
];
//Map tools
if ("ace_maptools" call ARTR_fnc_checkMod && (_unit == leader group _unit || ["_SL_", typeOf _unit] call BIS_fnc_inString || ["_TL_", typeOf _unit] call BIS_fnc_inString) ) then
{
	_unit addItemToUniform "ACE_MapTools";
};

//Earplugs
if (missionNamespace getVariable ["ace_hearing_enableCombatDeafness",false]) then
{
	_unit addItemToUniform "ACE_EarPlugs";
};

private _basicGear = [];
private _medicGear = [];

if ("ace_medical" call ARTR_fnc_checkMod) then
{
	_basicGear = [_ACEBasicGear,_ACEAdvGear] select (missionNamespace getVariable ["ace_medical_level",0] == 2);

	if (["medic", typeOf _unit] call BIS_fnc_inString ) then {

		_medicGear = [_ACEMedicGear,_ACEAdvMedicGear] select (missionNamespace getVariable ["ace_medical_level",0] == 2);
	};
} else {
	_basicGear = _vanillaBasicGear;

	if (["medic", typeOf _unit] call BIS_fnc_inString ) then {
		_medicGear = _vanillaMedicGear;
	};
};

{
	_item = _x select 0;
	_amount = _x select 1;

	for "_i" from 1 to _amount do {
		_unit addItemToUniform _item;
	};
} forEach _basicGear;

{
	_item = _x select 0;
	_amount = _x select 1;

	for "_i" from 1 to _amount do {
		_unit addItemToBackpack _item;
	};
} forEach _medicGear;