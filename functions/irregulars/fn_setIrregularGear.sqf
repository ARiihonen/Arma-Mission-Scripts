params ["_unit"];

removeAllWeapons _unit;
removeAllItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

private _primaryWeapon = ["arifle_AKM_F",["30Rnd_762x39_Mag_F",6]];
private _primaryWeaponItems = [];
private _secondaryWeapon = [];
private _clothes = "ScrubGuerrillas";

switch (typeOf _unit) do
{
	case "O_G_Soldier_M_F": {
		_clothes = "MediumGuerrillas";

		_primaryWeapon = selectRandom [
			["srifle_DMR_06_camo_F",["20Rnd_762x51_Mag",6]],
			["srifle_DMR_06_olive_F",["20Rnd_762x51_Mag",6]]
		];

		_primaryWeaponItems = ["optic_MRCO"];
	};

	case "O_G_Soldier_exp_F": {
		_Clothes = "MediumGuerrillasBackpack";
		_secondaryWeapon = ["launch_RPG7_F","RPG7_F"];
	};

	case "O_G_Soldier_A_F": {
		_clothes = "MediumGuerrillas";

		_primaryWeapon = ["LMG_Mk200_F",["200Rnd_65x39_cased_Box",2]];
	};

	case "O_G_Soldier_SL_F": {
		_clothes = "HeavyGuerrillas";

		_primaryWeapon = ["arifle_AK12_F",["30Rnd_762x39_Mag_F",6]];
		_primaryWeaponItems = ["optic_ERCO_blk_F"];
	};

	case "O_G_Soldier_F": {
		_clothes = "HeavyGuerrillas";

		_primaryWeapon = ["arifle_AK12_F",["30Rnd_762x39_Mag_F",6]];
		_primaryWeaponItems = ["optic_ACO_grn"];
	};

	case "O_G_Sharpshooter_F": {
		_clothes = "HeavyGuerrillas";

		_primaryWeapon = ["srifle_DMR_03_F",["20Rnd_762x51_Mag",6]];
		_primaryWeaponItems = ["optic_SOS","bipod_02_F_blk"];
	};

	case "O_G_Soldier_LAT_F": {
		_clothes = "HeavyGuerrillasBackpack";

		_primaryWeapon = ["arifle_AK12_F",["30Rnd_762x39_Mag_F",6]];
		_primaryWeaponItems = ["optic_ACO_grn"];

		_secondaryWeapon = ["launch_RPG32_F","RPG32_HE_F"];
	};

	case "O_G_Soldier_AR_F": {
		_clothes = "HeavyGuerrillasBackpack";

		_primaryWeapon = ["LMG_Zafir_F",["150Rnd_762x54_Box",1]];
		_primaryWeaponItems = ["optic_MRCO"];

		_secondaryWeapon = ["LMG_Zafir_F","150Rnd_762x54_Box"];
	};
};

[_unit,_clothes] call ARTR_fnc_setIrregularClothes;

private _weapon = _primaryWeapon select 0;
private _ammo = _primaryWeapon select 1 select 0;
private _ammoCount = _primaryWeapon select 1 select 1;

for "_i" from 1 to _ammoCount do { _unit addItemToVest _ammo};
_unit addWeapon _weapon;

{
	_unit addPrimaryWeaponItem _x;
} forEach _primaryWeaponItems;

if (count _secondaryWeapon > 0) then
{
	for "_i" from 1 to 3 do { _unit addItemToBackpack (_secondaryWeapon select 1)};
	_unit addWeapon (_secondaryWeapon select 0);
};
