params [
	["_unit", player, [objNull]]
];

//If MNP Uniforms and param is right: _units are finnish and get: AK-12 OR (if NIArms AKs): RK-62, if RHS: ESS goggles, glock17

//Check for MNP Uniforms, give MNP Finnish uniforms if they are there
if ("MNP_MIXR_Config" call ARTR_fnc_checkMod && ("GearPreference" call BIS_fnc_getParamValue == 1) ) then
{
	[_unit,(selectRandom ["MNP_CombatUniform_Fin_A","MNP_CombatUniform_Fin_B"])] call ARTR_fnc_replaceUniform;
	[_unit,(selectRandom ["MNP_Vest_FIN_1","MNP_Vest_FIN_2"])] call ARTR_fnc_replaceVest;
	_unit addHeadgear "MNP_Helmet_FIN_T";

	//Remove primary weapon and its magazines, since it is going to be changed
	{ _unit removeMagazines _x; } forEach (primaryWeaponMagazine _unit);
	_unit removeWeapon (primaryWeapon _unit);

	//Check for mods that might be used
	_rhsRUS = "rhs_c_weapons" call ARTR_fnc_checkMod;
	_rhsUS = "rhsusf_c_weapons" call ARTR_fnc_checkMod;
	_hlcAK = "hlcweapons_aks" call ARTR_fnc_checkMod;

	_weaponAdded = false;

	//Check for marksman, give RHS SVD if exists, DMR if not
	if (typeOf _unit find "_M_" >= 0) then
	{
		_weaponAdded = true;

		if (_rhsRUS) then
		{
			for "_i" from 1 to 8 do { _unit addItemToVest "rhs_10Rnd_762x54mmR_7N1"; };
			_unit addWeapon "rhs_weap_svds";
			_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
		} else {
			for "_i" from 1 to 8 do { _unit addItemToVest "20Rnd_762x51_Mag"; };
			_unit addWeapon "srifle_DMR_03_khaki_F";
			_unit addPrimaryWeaponItem "optic_DMS";
		};
	};

	//Check for autorifleman, give RHS PKM if exists, otherwise give Zafir
	if (typeOf _unit find "_AR_" >= 0) then
	{

		_weaponAdded = true;

		if (_rhsRUS) then
		{
			for "_i" from 1 to 2 do { _unit addItemToVest "rhs_100Rnd_762x54mmR_green"; };
			_unit addWeapon "rhs_weap_pkm";
		} else {
			for "_i" from 1 to 2 do { _unit addItemToVest "150Rnd_762x54_Box_Tracer"; };
			_unit addWeapon "LMG_Zafir_F";
		};
	};

	//If NIArms AKS are on, add RK62, otherwise add BI AK12
	if (!_weaponAdded) then {
		if (_hlcAK) then
		{
			for "_i" from 1 to 8 do { _unit addItemToVest "hlc_30Rnd_762x39_b_ak"; };
			_unit addWeapon "hlc_rifle_RK62";
		} else {
			for "_i" from 1 to 8 do { _unit addItemToVest "30Rnd_762x39_Mag_F"; };
			_unit addWeapon "arifle_AK12_F";

			if (typeOf _unit find "_SL_" >= 0 || typeOf _unit find "_TL_" >= 0) then
			{
				_unit addPrimaryWeaponItem "optic_MRCO";
			} else {
				_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
			};
		};
	};

	//If RHS USF is on, add RHS ESS and Glock17, else just give default pistol
	if (_rhsUS) then
	{
		//Switch to RHS ESS
		_unit addGoggles "rhs_ess_black";

		//Remove default handgun
		{ _unit removeMagazines _x; } forEach (handgunMagazine _unit);
		_unit removeWeapon (handgunWeapon _unit);

		//Switch to RHS Glock17
		for "_i" from 1 to 2 do { _unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP"; };
		_unit addWeapon "rhsusf_weap_glock17g4";
	};

	//Check for autorifleman, give backpack w/ PKM ammo if exists, otherwise w/ Zafir ammo
	if (typeOf _unit find "_A_" >= 0) then
	{
		_unit addBackpack "B_Kitbag_rgr";

		if (_rhsRUS) then
		{
			for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
		} else {
			for "_i" from 1 to 3 do {_unit addItemToBackpack "150Rnd_762x54_Box_Tracer";};
		};
	};
};

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


if (_unit == leader (group _unit) && !("ItemGPS" in assignedItems _unit)) then
{
	_unit linkItem "ItemGPS";
};

if ("ace_microdagr" call ARTR_fnc_checkMod && "ItemGPS" in (assignedItems _unit) ) then
{
	_unit unLinkItem "ItemGPS";
	_unit addItemToUniform "ACE_microDagr";
};

if ("ace_maptools" call ARTR_fnc_checkMod && (_unit == leader group _unit || ["_SL_", typeOf _unit] call BIS_fnc_inString || ["_TL_", typeOf _unit] call BIS_fnc_inString) ) then
{
	_unit addItemToUniform "ACE_MapTools";
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

//Earplugs
if (missionNamespace getVariable ["ace_hearing_enableCombatDeafness",false]) then
{
	_unit addItemToUniform "ACE_EarPlugs";
};
