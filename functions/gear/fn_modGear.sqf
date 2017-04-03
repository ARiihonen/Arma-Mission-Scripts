params [
	["_unit", player, [objNull]]
];

private _uniform = "";
private _vest = "";
private _helmet = "";
private _backpack = "";
private _weapon = [];
private _sidearm = [];
private _secondary = "";
private _items = [];
private	_backpackItems = [];
private _weaponItems = [];
private _linkItems = [];

private _replaceThings = false;

switch (missionNamespace getVariable ["gearSelection","default"]) do
{
	case "RHSUSF": {

		_replaceThings = true;

		_uniform = "rhs_uniform_cu_ucp";
		_vest = "rhsusf_iotv_ucp_Rifleman";
		_helmet = "rhsusf_ach_helmet_ucp";
		_weapon = ["rhs_weap_m4_carryhandle",["rhs_mag_30Rnd_556x45_M855A1_Stanag",8],["rhsusf_acc_compm4"]];

		_items = [["SmokeShell", 2], ["rhs_mag_m67", 2]];

		switch (typeOf _unit) do
		{
			case "B_Soldier_SL_F": {
				_vest = "rhsusf_iotv_ucp_Squadleader";
				_weapon = ["rhs_weap_m4a1_carryhandle_m203",["rhs_mag_30Rnd_556x45_Mk318_Stanag",6],["rhsusf_acc_anpeq15side_bk","rhsusf_acc_ACOG3"]];
				_helmet = "rhsusf_ach_helmet_headset_ucp";

				_items append [["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_red",1],["rhs_mag_M441_HE",4]];
				_weaponItems = ["Binocular"];
			};

			case "B_Soldier_TL_F": {
				_vest = "rhsusf_iotv_ucp_Teamleader";
				_weapon = ["rhs_weap_m4a1_carryhandle_m203",["rhs_mag_30Rnd_556x45_Mk318_Stanag",6],["rhsusf_acc_anpeq15side_bk","rhsusf_acc_ACOG3"]];
				_helmet = "rhsusf_ach_helmet_headset_ucp";

				_items append [["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_red",1],["rhs_mag_M441_HE",4]];

				if ( (groupID (group _unit)) == "Delta 2-5" || (groupID (group _unit)) == "Delta 2-6" ) then
				{
					_weaponItems pushBack "lerca_1200_black";
				};
			};

			case "B_soldier_M_F": {
				_weapon = ["rhs_weap_m16a4_pmag",["rhs_mag_30Rnd_556x45_Mk318_Stanag",8],["rhsusf_acc_ACOG3_USMC","rhsusf_acc_harris_bipod"]];

				_items append [["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_red",1]];
			};

			case "B_soldier_AR_F": {
				_vest = "rhsusf_iotv_ucp_SAW";
				_weapon = ["rhs_weap_m249_pip_S",["rhsusf_100Rnd_556x45_soft_pouch",2],["rhsusf_acc_ELCAN_ard"]];
			};

			case "B_soldier_AAR_F": {
				_backpack = "rhsusf_assault_eagleaiii_ucp_ar";
				_backpackItems = [["rhsusf_100Rnd_556x45_soft_pouch",4],["rhs_200rnd_556x45_T_SAW",1]];
			};

			case "B_Soldier_GL_F": {
				_vest = "rhsusf_iotv_ucp_Grenadier";
				_backpack = "rhsusf_falconii_gr";

				_weapon = ["rhs_weap_m4a1_carryhandle_m203",["rhs_mag_30Rnd_556x45_Mk318_Stanag",6],["rhsusf_acc_anpeq15side_bk","rhsusf_acc_compm4"]];
				_items append [["rhs_mag_M441_HE",4]];
			};

			case "B_soldier_LAT_F": {
				removeBackpack _unit;
				_secondary = "rhs_weap_M136";
			};

			case "B_medic_F": {
				_vest = "rhsusf_iotv_ucp_Medic";
				_backpack = "rhsusf_assault_eagleaiii_ucp_medic";
			};

			case "B_officer_F": {
				_vest = "rhsusf_iotv_ucp_Squadleader";
				_weapon = ["rhs_weap_m4a1_carryhandle",["rhs_mag_30Rnd_556x45_M855A1_Stanag",6],["rhsusf_acc_anpeq15side_bk","rhsusf_acc_ACOG2"]];
				_helmet = "rhsusf_ach_helmet_headset_ucp";

				_items append [["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_red",1]];
				_weaponItems = ["Binocular"];
			};

			case "B_support_Mort_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L16";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
				} else {
					_backpack = "rhs_M252_Gun_Bag";
				};
			};

			case "B_support_AMort_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L16_Tripod";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
				} else {
					_backpack = "rhs_M252_Bipod_Bag";
				};
			};

			case "B_support_MG_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L111A1";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
				} else {
					_backpack = "RHS_M2_Gun_Bag";
				};
			};

			case "B_support_AMG_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_Tripod";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
				} else {
					_backpack = "RHS_M2_Tripod_Bag";
				};
			};

			case "B_ghillie_ard_F": {
				_helmet = "rhsusf_ach_bare_wood";
				_weapon = ["rhs_weap_XM2010_wd",["rhsusf_5Rnd_300winmag_xm2010",15],["rhsusf_acc_LEUPOLDMK4_2","rhsusf_acc_harris_bipod"]];
				_sidearm = ["rhsusf_weap_m9",["rhsusf_mag_15Rnd_9x19_JHP",4],[]];

				_weaponItems = ["lerca_1200_black"];
			};

			case "B_spotter_F": {
				_helmet = "rhsusf_ach_bare_wood";
				_weapon = ["rhs_weap_m16a4_pmag",["rhs_mag_30Rnd_556x45_Mk318_Stanag",9],["rhsusf_acc_ACOG3_USMC","rhsusf_acc_harris_bipod"]];

				_items append [["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_red",1],["lerca_1200_black",1]];

				_weaponItems = ["Leupold_Mk4"];

			};

			case "B_Sharpshooter_F": {
				_helmet = "rhsusf_ach_bare_wood";
				_weapon = ["rhs_weap_m14ebrri",["rhsusf_20Rnd_762x51_m118_special_Mag",8],["rhsusf_acc_LEUPOLDMK4","rhsusf_acc_harris_bipod"]];
				_sidearm = ["rhsusf_weap_m9",["rhsusf_mag_15Rnd_9x19_JHP",4],[]];

				_weaponItems = ["lerca_1200_black"];
			};

			case "B_Helipilot_F": {
				_uniform = "rhs_uniform_cu_ucp";
				_vest = "rhsusf_iotv_ucp";
				_helmet = "rhsusf_hgu56p";

				_weapon = ["rhs_weap_m4_carryhandle",["rhs_mag_30Rnd_556x45_M855A1_Stanag",4],[]];
				_sidearm = ["rhsusf_weap_m9",["rhsusf_mag_15Rnd_9x19_JHP",2],[]];

				_items append [["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_red",1]];
			};

			case "B_Helicrew_F": {
				_uniform = "rhs_uniform_cu_ucp";
				_vest = "rhsusf_iotv_ucp";
				_helmet = "rhsusf_hgu56p_mask";

				_weapon = ["rhs_weap_m4_carryhandle",["rhs_mag_30Rnd_556x45_M855A1_Stanag",4],[]];
				_sidearm = ["rhsusf_weap_m9",["rhsusf_mag_15Rnd_9x19_JHP",2],[]];

				_items append [["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_red",1]];
			};
		};
	};

	case "RHSAFRF": {

		_replaceThings = true;

		_uniform = "rhs_uniform_vdv_emr";
		_helmet = "rhs_6b28";
		_vest = "rhs_6b23_digi_6sh92";

		_weapon = ["rhs_weap_ak74m",["rhs_30Rnd_545x39_7N10_AK",8],["rhs_acc_dtk"]];
		_items = [["rhs_mag_rdg2_white",1],["rhs_mag_rgd5",2]];

		switch (typeOf _unit) do
		{
			case "B_Soldier_SL_F": {
				_vest = "rhs_6b23_digi_6sh92_headset_mapcase";
				_helmet = "rhs_6b28_ess";

				_weapon = ["rhs_weap_ak74m",["rhs_30Rnd_545x39_7N10_AK",8],["rhs_acc_dtk","rhs_acc_pkas"]];
				_secondary = "rhs_weap_rpg26";

				_weaponItems = ["Binocular"];
			};

			case "B_Soldier_TL_F": {
				_vest = "rhs_6b23_digi_6sh92_radio";
				_helmet = "rhs_6b28_green_ess_bala";

				_weapon = ["rhs_weap_ak74m",["rhs_30Rnd_545x39_7N10_AK",8],["rhs_acc_dtk","rhs_acc_pkas"]];
				_secondary = "rhs_weap_rpg26";

				_weaponItems = ["rhs_pdu4"];

				if ( (groupID (group _unit)) == "Delta 2-5" || (groupID (group _unit)) == "Delta 2-6" ) then
				{
					_weaponItems pushBack "rhs_pdu4";
				};
			};

			case "B_soldier_M_F": {
				_vest = "rhs_6b23_digi_sniper";
				_helmet = "rhs_Booniehat_digi";

				_weapon = ["rhs_weap_svds",["rhs_10Rnd_762x54mmR_7N1",10],["rhs_acc_pso1m2"]];
			};

			case "B_soldier_AR_F": {
				_helmet = "rhs_6b28_green_ess";
				_weapon = ["rhs_weap_pkm",["rhs_100Rnd_762x54mmR",2],[]];
			};

			case "B_soldier_AAR_F": {
				_backpack = "rhs_sidorMG";
				_backpackItems = [["rhs_100Rnd_762x54mmR",4]];
			};

			case "B_Soldier_GL_F": {
				_vest = "rhs_6b23_digi_6sh92_vog";
				_helmet = "rhs_6b28_ess_bala";

				_weapon = ["rhs_weap_ak74m_gp25",["rhs_30Rnd_545x39_7N10_AK",6],["rhs_acc_dtk"]];
				_items append [["rhs_VOG25",4]];
			};

			case "B_soldier_LAT_F": {
				_backpack = "rhs_rpg";
				_secondary = "rhs_weap_rpg7";

				_backpackItems = [["rhs_rpg7_PG7VL_mag",4]];
			};

			case "B_medic_F": {
				_backpack = "rhs_assault_umbts_medic";
			};

			case "B_officer_F": {
				_vest = "rhs_6b23_digi_crewofficer";
				_helmet = "rhs_beret_vdv1";

				_sidearm = ["rhs_weap_makarov_pm",["rhs_mag_9x18_8_57N181S",4],[]];

				_weaponItems = ["Binocular"];
			};

			case "B_support_Mort_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L16";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
				} else {
					_backpack = "RHS_Podnos_Gun_Bag";
				};
			};

			case "B_support_AMort_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L16_Tripod";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
				} else {
					_backpack = "RHS_Podnos_Bipod_Bag";
				};
			};

			case "B_support_MG_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L111A1";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
				} else {
					_backpack = "RHS_Kord_Gun_Bag";
				};
			};

			case "B_support_AMG_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_Tripod";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
				} else {
					_backpack = "RHS_Kord_Tripod_Bag";
				};
			};

			case "B_ghillie_ard_F": {
				_uniform = "rhs_uniform_gorka_r_g";
				_vest = "rhs_6b23_digi_sniper";
				_helmet = "rhs_6b47_bala";

				_weapon = ["rhs_weap_svdp_npz",["rhs_10Rnd_762x54mmR_7N1",10],["rhs_acc_dh520x56"]];
				_sidearm = ["rhs_weap_pp2000_folded",["rhs_mag_9x19mm_7n21_20",2],[]];

				_weaponItems = ["rhs_pdu4"];
			};

			case "B_spotter_F": {
				_uniform = "rhs_uniform_gorka_r_g";
				_vest = "rhs_6b23_digi_sniper";
				_helmet = "rhs_6b47_bala";

				_weapon = ["rhs_weap_ak74m_2mag_camo",["rhs_30Rnd_545x39_AK",8],["rhs_acc_dtk","rhs_acc_1p29"]];

				_weaponItems = ["rhs_pdu4"];
			};

			case "B_Sharpshooter_F": {
				_uniform = "rhs_uniform_gorka_r_g";
				_vest = "rhs_6b23_digi_sniper";
				_helmet = "rhs_6b47_bala";

				_weapon = ["rhs_weap_svds",["rhs_10Rnd_762x54mmR_7N1",10],["rhs_acc_pso1m2"]];
				_sidearm = ["rhs_weap_pp2000_folded",["rhs_mag_9x19mm_7n21_20",2],[]];

				_weaponItems = ["rhs_pdu4"];
			};

			case "B_Helipilot_F": {
				_uniform = "rhs_uniform_df15";
				_vest = "";
				_headgear = "rhs_gssh18";

				_weapon = [];
				_sidearm = ["rhs_weap_makarov_pm",["rhs_mag_9x18_8_57N181S",2],[]];
			};

			case "B_Helicrew_F": {
				_uniform = "rhs_uniform_df15";
				_vest = "";
				_headgear = "rhs_gssh18";

				_weapon = [];
				_sidearm = ["rhs_weap_makarov_pm",["rhs_mag_9x18_8_57N181S",2],[]];
			};
		};
	};

	case "BAF": {
		_uniform = selectRandom ["UK3CB_BAF_U_CombatUniform_DPMT","UK3CB_BAF_U_CombatUniform_DPMT","UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve","UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve"];
		_vest = selectRandom ["UK3CB_BAF_V_Osprey_DPMT1","UK3CB_BAF_V_Osprey_DPMT2","UK3CB_BAF_V_Osprey_DPMT3","UK3CB_BAF_V_Osprey_DPMT4","UK3CB_BAF_V_Osprey_DPMT5","UK3CB_BAF_V_Osprey_DPMT6","UK3CB_BAF_V_Osprey_DPMT7","UK3CB_BAF_V_Osprey_DPMT8","UK3CB_BAF_V_Osprey_DPMT9"];
		_helmet = selectRandom ["UK3CB_BAF_H_Mk6_DPMT_A","UK3CB_BAF_H_Mk6_DPMT_B","UK3CB_BAF_H_Mk6_DPMT_C","UK3CB_BAF_H_Mk6_DPMT_D","UK3CB_BAF_H_Mk6_DPMT_E","UK3CB_BAF_H_Mk6_DPMT_F"];

		_weapon = ["UK3CB_BAF_L85A2_RIS_AFG",[["UK3CB_BAF_556_30Rnd",8]],["UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_Eotech"]];

		switch (typeOf _unit) do
		{
			case "B_Soldier_SL_F": {
				_weapon = ["UK3CB_BAF_L85A2_UGL",[["UK3CB_BAF_556_30Rnd",6],["UK3CB_BAF_1Rnd_HE_Grenade_Shell",4]],["UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_TA648"]];
			};

			case "B_Soldier_TL_F": {
				_weapon = ["UK3CB_BAF_L85A2_UGL",[["UK3CB_BAF_556_30Rnd",6],["UK3CB_BAF_1Rnd_HE_Grenade_Shell",4]],["UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_TA648"]];

				//Rangefinder (Mortar TL)
			};

			case "B_soldier_M_F": {
				_weapon = ["UK3CB_BAF_L86A3",[["UK3CB_BAF_556_30Rnd",8]],["UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_TA648"]];
			};

			case "B_soldier_AR_F": {
				_weapon = ["UK3CB_BAF_L110A1",[["UK3CB_BAF_556_200Rnd",2]],[]];
			};

			case "B_soldier_AAR_F": {
				_backpack = "UK3CB_BAF_B_Bergen_DPMT_Rifleman_A";
				_backpackItems = [["UK3CB_BAF_556_200Rnd",4]];
			};

			case "B_Soldier_GL_F": {
				_weapon = ["UK3CB_BAF_L85A2_UGL",[["UK3CB_BAF_556_30Rnd",6],["UK3CB_BAF_1Rnd_HE_Grenade_Shell",4],["1Rnd_Smoke_Grenade_shell",2],["1Rnd_SmokeRed_Grenade_shell",1],["1Rnd_SmokeBlue_Grenade_shell",1],["1Rnd_SmokeGreen_Grenade_shell",1]],["UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_Eotech"]];
			};

			case "B_soldier_LAT_F": {
				removeBackpack _unit;
				_secondary = "UK3CB_BAF_AT4_CS_AP_Launcher";
			};

			case "B_medic_F": {
				_backpack = "UK3CB_BAF_B_Bergen_DPMT_Rifleman_B";
			};

			case "B_officer_F": {
				_weaponItems = ["Binocular"];
			};

			case "B_support_Mort_F": {
				_secondary = "UK3CB_BAF_L16";
				_backpack = "UK3CB_BAF_B_Carryall_DPMT";
				_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
			};

			case "B_support_AMort_F": {
				_secondary = "UK3CB_BAF_L16_Tripod";
				_backpack = "UK3CB_BAF_B_Carryall_DPMT";
				_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
			};

			case "B_support_MG_F": {
				_secondary = "UK3CB_BAF_L111A1";
				_backpack = "UK3CB_BAF_B_Carryall_DPMT";
				_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
			};

			case "B_support_AMG_F": {
				_secondary = "UK3CB_BAF_Tripod";
				_backpack = "UK3CB_BAF_B_Carryall_DPMT";
				_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
			};

			case "B_ghillie_ard_F": {
				_weapon = ["UK3CB_BAF_L115A3",[["UK3CB_BAF_338_5Rnd",15]],["RKSL_optic_PMII_525"]];
				_sidearm = ["UK3CB_BAF_L131A1",[["UK3CB_BAF_9_17Rnd",2]],[]];
			};

			case "B_spotter_F": {
				_weapon = ["UK3CB_BAF_L86A3",[["UK3CB_BAF_556_30Rnd",8]],["UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_TA648"]];
			};

			case "B_Sharpshooter_F": {
				_weapon = ["UK3CB_BAF_L129A1_AFG",[["UK3CB_BAF_762_L42A1_20Rnd",8]],["RKSL_optic_PMII_312"]];
				_sidearm = ["UK3CB_BAF_L131A1",[["UK3CB_BAF_9_17Rnd",2]],[]];
			};

			case "B_Helipilot_F": {
				_uniform = "UK3CB_BAF_U_HeliPilotCoveralls_RN";
				_vest = "UK3CB_BAF_V_Pilot_DPMT";
				_helmet = "UK3CB_BAF_H_PilotHelmetHeli_A";

				_weapon = ["UK3CB_BAF_L22A2",[["UK3CB_BAF_556_30Rnd",2]],["UK3CB_BAF_SUSAT"]];
			};

			case "B_Helicrew_F": {
				_weapon = ["UK3CB_BAF_L22A2",[["UK3CB_BAF_556_30Rnd",2]],["UK3CB_BAF_SUSAT"]];
			};
		};
	};

	default {
		switch (typeOf _unit) do
		{
			case "B_support_Mort_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L16";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
				} else {
					_backpack = "B_Mortar_01_weapon_F";
				};
			};

			case "B_support_AMort_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L16_Tripod";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_1Rnd_81mm_Mo_Shells",3]];
				} else {
					_backpack = "B_Mortar_01_support_F";
				};
			};

			case "B_support_MG_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_L111A1";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
				} else {
					_backpack = "B_HMG_01_high_weapon_F";
				};
			};

			case "B_support_AMG_F": {
				if (missionNamespace getVariable ["staticConvert", false]) then
				{
					_secondary = "UK3CB_BAF_Tripod";
					_backpack = "B_Carryall_cbr";
					_backpackItems = [["UK3CB_BAF_127_100Rnd",1]];
				} else {
					_backpack = "B_HMG_01_support_high_F";
				};
			};
		};
	};
};

diag_log format ["UNIFORM: %1", _uniform];
diag_log format ["VEST: %1", _vest];
diag_log format ["helmet: %1", _helmet];
diag_log format ["backpack: %1", _backpack];
diag_log format ["weapon: %1", _weapon];
diag_log format ["sidearm: %1", _sidearm];
diag_log format ["secondary: %1", _secondary];

if (_replaceThings) then
{
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	if (_uniform != "") then { _unit forceAddUniform _uniform; };
	if (_vest != "") then { _unit addVest _vest; };
	if (_backpack != "") then { removeBackpack _unit; _unit addBackpack _backpack; };

	if (count _weapon != 0) then
	{
		private _primary = _weapon select 0;
		private _ammo = _weapon select 1 select 0;
		private _ammoCount = _weapon select 1 select 1;
		private _attachments = _weapon select 2;

		for "_i" from 1 to _ammoCount do { _unit addItemToVest _ammo; };
		_unit addWeapon _primary;
		_unit addItemToVest _ammo;
		{ _unit addPrimaryWeaponItem _x } forEach _attachments;
	};

	if (count _sidearm != 0) then
	{
		private _handgun = _sidearm select 0;
		private _ammo = _sidearm select 1 select 0;
		private _ammoCount = _sidearm select 1 select 1;
		private _attachments = _sidearm select 2;

		for "_i" from 1 to _ammoCount do { _unit addItemToVest _ammo; };
		_unit addWeapon _handgun;
		_unit addItemToVest _ammo;
		{ _unit addHandgunItem _x } forEach _attachments;
	};
} else {
	_unit removeMagazines "3Rnd_HE_Grenade_shell";
	[_unit,_uniform] call ARTR_fnc_switchUniform;
	[_unit,_vest] call ARTR_fnc_switchVest;
	[_unit,_backpack] call ARTR_fnc_switchBackpack;
	[_unit,_weapon] call ARTR_fnc_switchPrimaryWeapon;

	if (count _sidearm == 0) then { _sidearm = ["remove",["",0],[]]; };
	[_unit,_sidearm] call ARTR_fnc_switchHandgun;
};

if (_helmet != "") then { _unit addHeadGear _helmet; };
if (_secondary != "") then { _unit addWeapon _secondary; };

if (typeOf _unit == "B_Soldier_F" && "task_force_radio" call ARTR_fnc_checkMod) then
{
	_unit addBackpack TF_defaultWestBackpack;
};

{
	for "_i" from 1 to (_x select 1) do { _unit addItemToVest (_x select 0); };
} forEach _items;
{
	for "_i" from 1 to (_x select 1) do { _unit addItemToBackpack (_x select 0); };
} forEach _backpackItems;
{ _unit addWeapon _x; } forEach _weaponItems;
{ _unit linkItem _x; } forEach _linkItems;


private _vanillaBasicGear = [
	["FirstAidKit", 2]
];
private _vanillaMedicGear = [
	["FirstAidKit", 10],
	["Medikit",1]
];
private _vanillaDoctorGear = [
	["FirstAidKit", 20],
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
private _ACEDoctorGear = [
	["ACE_fieldDressing", 40],
	["ACE_epinephrine", 20],
	["ACE_morphine", 20],
	["ACE_bloodIV", 4],
	["ACE_bloodIV_500", 4]
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
private _aceAdvDoctorGear = [
	["ACE_fieldDressing", 15],
	["ACE_packingBandage", 15],
	["ACE_elasticBandage", 15],
	["ACE_quikclot", 15],
	["ACE_epinephrine", 10],
	["ACE_morphine", 10],
	["ACE_atropine", 10],
	["ACE_tourniquet", 5],
	["ACE_bloodIV", 4],
	["ACE_bloodIV_500", 4],
	["ACE_personalAidKit", 5],
	["ACE_surgicalKit", 5]
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

if ("ace_mk6Mortar" call ARTR_fnc_checkMod && ((groupID (group _unit)) find "mortar" >= 0)) then
{
	_unit addItemToUniform "ACE_RangeTable_82mm";
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

		if ( (groupID (group _unit)) == "Delta 2") then
		{
			_medicGear = [_ACEDoctorGear,_aceAdvDoctorGear] select (missionNamespace getVariable ["ace_medical_level",0] == 2);
		} else {
			_medicGear = [_ACEMedicGear,_ACEAdvMedicGear] select (missionNamespace getVariable ["ace_medical_level",0] == 2);
		};

	};
} else {
	_basicGear = _vanillaBasicGear;

	if (["medic", typeOf _unit] call BIS_fnc_inString ) then {
		_medicGear = [_vanillaMedicGear,_vanillaDoctorGear] select ( (groupID (group _unit)) == "Delta 2" );
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

	if ("ace_tripod" call ARTR_fnc_checkMod) then
	{
		if (_unit canAdd "ACE_Tripod") then
		{
			_unit addItem "ACE_Tripod";
		} else {
			switch (missionNamespace getVariable ["gearSelection", "default"]) do
			{
				case "RHSUSF": { _unit addBackpack "rhsusf_falconii"; };
				case "RHSAFRF": { _unit addBackpack "rhs_sidor"; };
				case "BAF": { _unit addBackpack "UK3CB_BAF_B_Kitbag_DPMT"; };
				default { _unit addBackpack "B_AssaultPack_rgr"; };
			};
			_unit addItemToBackpack "ACE_Tripod";
		};
	};
};

if ("ace_trenches" call ARTR_fnc_checkMod && !(typeOf _unit find "ghillie" >= 0 || typeOf _unit find "spotter" >= 0 || typeOf _unit find "heli" >= 0)) then
{
	_unit addItemToUniform "ACE_EntrenchingTool";
};

if (dayTime > 17 || dayTime < 8) then
{
	switch (missionNamespace getVariable ["gearSelection", "default"]) do
	{
		case "RHSUSF": { _unit linkItem "rhsusf_ANPVS_14"; };
		case "RHSAFRF": { _unit linkItem "rhs_1PN138"; };
		case "BAF": { _unit linkItem "UK3CB_BAF_HMNVS"; };
		default { _unit linkItem "NVGoggles"; };
	};
};

missionNamespace setVariable ["artr_gearAdded", true, false];
