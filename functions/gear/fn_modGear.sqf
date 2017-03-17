params [
	["_unit", player, [objNull]]
];

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player addVest "V_PlateCarrier2_blk";

if ("WeaponParam" call BIS_fnc_getParamValue == 1) then
{
	private _tracer = if (side _unit == west) then { "30Rnd_556x45_Stanag_Tracer_Yellow"; } else { "30Rnd_556x45_Stanag_Tracer_Red"; };
	for "_i" from 1 to 2 do {player addItemToVest _tracer;};
	player addWeapon "arifle_Mk20C_plain_F";
	player addPrimaryWeaponItem "optic_Aco";
};

for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
player addWeapon "hgun_P07_F";


private _vanillaBasicGear = [
	["FirstAidKit", 2]
];
private _ACEBasicGear = [
	["ACE_fieldDressing", 6],
	["ACE_epinephrine", 2],
	["ACE_morphine", 2]
];
private _ACEAdvGear = [
	["ACE_fieldDressing", 6],
	["ACE_packingBandage", 6],
	["ACE_epinephrine", 2],
	["ACE_morphine", 2],
	["ACE_tourniquet", 2]
];

private _basicGear = [];
private _medicGear = [];

if ("ace_medical" call ARTR_fnc_checkMod) then
{
	_basicGear = [_ACEBasicGear,_ACEAdvGear] select (missionNamespace getVariable ["ace_medical_level",0] == 2);
} else {
	_basicGear = _vanillaBasicGear;
};

{
	_item = _x select 0;
	_amount = _x select 1;

	for "_i" from 1 to _amount do {
		_unit addItemToUniform _item;
	};
} forEach _basicGear;

//Earplugs
if (missionNamespace getVariable ["ace_hearing_enableCombatDeafness",false]) then
{
	_unit addItemToUniform "ACE_EarPlugs";
};
