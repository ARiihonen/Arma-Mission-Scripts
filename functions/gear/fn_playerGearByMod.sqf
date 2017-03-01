//If MNP Uniforms: players are finnish and get: AK-12 OR (if NIArms AKs): RK-62, if RHS: ESS goggles, glock17

//Check for MNP Uniforms, give MNP Finnish uniforms if they are there
if ("MNP_MIXR_Config" call ARTR_fnc_checkMod) then
{
	[player,(selectRandom ["MNP_CombatUniform_Fin_A","MNP_CombatUniform_Fin_B"])] call ARTR_fnc_replaceUniform;
	[player,(selectRandom ["MNP_Vest_FIN_1","MNP_Vest_FIN_2"])] call ARTR_fnc_replaceVest;

	//Remove primary weapon and its magazines, since it is going to be changed
	player removeMagazines (primaryWeaponMagazine player);
	player removeWeapon (primaryWeapon player);

	//Check for mods that might be used
	_rhsRUS = "rhs_c_weapons" call ARTR_fnc_checkMod;
	_rhsUS = "rhsusf_c_weapons" call ARTR_fnc_checkMod;
	_hlcAK = "hlcweapons_aks" call ARTR_fnc_checkMod;

	//If NIArms AKS are on, add RK62, otherwise add BI AK12
	if (_hlcAK) then
	{
		for "_i" from 1 to 8 do { player addItemToUniform "hlc_30Rnd_762x39_b_ak"; };
		player addWeapon "hlc_rifle_RK62";
	} else {
		for "_i" from 1 to 8 do { player addItemToUniform "30Rnd_762x39_Mag_F"; };
		player addWeapon "arifle_AK12_F";

		if (typeOf player find "_SL_" >= 0 || typeOf player find "_TL_" >= 0) then
		{
			player addPrimaryWeaponItem "optic_MRCO";
		} else {
			player addPrimaryWeaponItem "optic_Holosight_blk_F";
		};
	};

	//If RHS USF is on, add RHS ESS and Glock17, else just give default pistol
	if (_rhsUS) then
	{
		//Switch to RHS ESS
		player addGoggles "rhs_ess_black";

		//Remove default handgun
		player removeMagazines (handgunMagazine player);
		player removeWeapon (handgunWeapon player);

		//Switch to RHS Glock17
		for "_i" from 1 to 2 do { player addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP"; };
		player addWeapon "rhsusf_weap_glock17g4";
	};

	//Check for marksman, give RHS SVD if exists, DMR if not
	if (typeOf player find "_M_" >= 0) then
	{
		if (_rhsRUS) then
		{
			for "_i" from 1 to 8 do { player addItemToUniform "rhs_10Rnd_762x54mmR_7N1"; };
			player addWeapon "rhs_weap_svds";
			player addPrimaryWeaponItem "rhs_acc_pso1m2";
		} else {
			for "_i" from 1 to 8 do { player addItemToVest "20Rnd_762x51_Mag"; };
			player addWeapon "srifle_DMR_03_khaki_F";
			player addPrimaryWeaponItem "optic_DMS";
		};
	};

	//Check for autorifleman, give RHS PKM if exists, otherwise give Zafir
	if (typeOf player find "_AR_" >= 0) then
	{
		if (_rhsRUS) then
		{
			for "_i" from 1 to 2 do { player addItemToVest "rhs_100Rnd_762x54mmR_green"; };
			player addWeapon "rhs_weap_pkm";
		} else {
			for "_i" from 1 to 2 do { player addItemToVest "150Rnd_762x54_Box_Tracer"; };
			player addWeapon "LMG_Zafir_F";
		};
	};

	//Check for autorifleman, give backpack w/ PKM ammo if exists, otherwise w/ Zafir ammo
	if (typeOf player find "_A_" >= 0) then
	{
		player addBackpack "B_Kitbag_rgr";

		if (_rhsRUS) then
		{
			for "_i" from 1 to 3 do {player addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
		} else {
			for "_i" from 1 to 3 do {player addItemToBackpack "150Rnd_762x54_Box_Tracer";};
		};
	};
};

//Medical gear setting
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

//GPS for leaders
if (player == leader (group player) && !("ItemGPS" in assignedItems player)) then
{
	player linkItem "ItemGPS";
};

//Switch GPS to ACE MicroDAGR if ACE is on
if ("ace_microdagr" call ARTR_fnc_checkMod && "ItemGPS" in (assignedItems player) ) then
{
	player unLinkItem "ItemGPS";
	player addItemToUniform "ACE_microDagr";
};

//ACE map tools for leaders if present
if ("ace_maptools" call ARTR_fnc_checkMod && (player == leader group player || ["_SL_", typeOf player] call BIS_fnc_inString || ["_TL_", typeOf player] call BIS_fnc_inString) ) then
{
	player addItemToUniform "ACE_MapTools";
};

//ACE medical gear adding
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
