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
	["ACE_fieldDressing", 4],
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
	["ACE_fieldDressing", 4],
	["ACE_packingBandage", 4],
	["ACE_epinephrine", 2],
	["ACE_morphine", 2],
	["ACE_tourniquet", 1]
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

//GPS
if (_unit == leader (group _unit) && !("ItemGPS" in assignedItems _unit)) then
{
	_unit linkItem "ItemGPS";
};
if ("ace_microdagr" call ARTR_fnc_checkMod && "ItemGPS" in (assignedItems _unit) ) then
{
	_unit unLinkItem "ItemGPS";
	_unit addItemToUniform "ACE_microDagr";
};

//ACE Rangefinders
if ("ace_vector" call ARTR_fnc_checkMod && "Rangefinder" in (assignedItems _unit)) then
{
	_unit addWeapon "ACE_Vector";
};

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

//ACE Sniper gear
if ((typeOf _unit) find "ghillie" >= 0 || (typeOf _unit) find "spotter" >= 0 || (typeOf _unit) find "Sharpshooter" >= 0 ) then
{
	if ("ace_atragmx" call ARTR_fnc_checkMod) then
	{
		_unit addItemToUniform "ACE_ATragMX";
	};

	if ("ace_kestrel4500" call ARTR_fnc_checkMod) then
	{
		_unit addItemToUniform "ACE_Kestrel4500";
	};

	if ("ace_dagr" call ARTR_fnc_checkMod) then
	{
		_unit addItemToUniform "ACE_DAGR";
	};

	if ("ace_rangecard" call ARTR_fnc_checkMod) then
	{
		_unit addItemToUniform "ACE_RangeCard";
	};
};
