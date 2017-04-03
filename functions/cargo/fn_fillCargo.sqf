params ["_box","_type"];

private _inventoryContents = [];
_backpackContents = [
	"B_Mortar_01_weapon_F",
	"B_Mortar_01_support_F",
	"B_HMG_01_high_weapon_F",
	"B_HMG_01_weapon_F",
	"B_HMG_01_support_high_F",
	"B_HMG_01_support_F",
	"rhs_M252_Gun_Bag",
	"rhs_M252_Bipod_Bag",
	"RHS_Podnos_Gun_Bag",
	"RHS_Podnos_Bipod_Bag",
	"RHS_M2_Gun_Bag",
	"RHS_M2_Tripod_Bag",
	"RHS_Kord_Gun_Bag",
	"RHS_Kord_Tripod_Bag"
];

switch (_type) do
{
	case "Mortar":
	{
		if (missionNamespace getVariable ["staticConvert", false]) then
		{
			_inventoryContents = [
				"UK3CB_BAF_L16",
				"UK3CB_BAF_L16_Tripod",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
				"UK3CB_BAF_1Rnd_81mm_Mo_Shells"
			];
		} else {
			switch (missionNamespace getVariable ["gearSelection", "default"]) do
			{
				case "RHSUSF": {
					_inventoryContents = [
						"rhs_M252_Gun_Bag",
						"rhs_M252_Bipod_Bag"
					];
				};

				case "RHSAFRF": {
					_inventoryContents = [
						"RHS_Podnos_Gun_Bag",
						"RHS_Podnos_Bipod_Bag"
					];
				};

				case "BAF": {
					_inventoryContents = [
						"UK3CB_BAF_L16",
						"UK3CB_BAF_L16_Tripod",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells",
						"UK3CB_BAF_1Rnd_81mm_Mo_Shells"
					];
				};

				default {
					_inventoryContents = [
						"B_Mortar_01_weapon_F",
						"B_Mortar_01_support_F"
					];
				};
			};
		};
	};

	case "HMG":
	{
		if (missionNamespace getVariable ["staticConvert", false]) then
		{
			_inventoryContents = [
				"UK3CB_BAF_L111A1",
				"UK3CB_BAF_Tripod",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd",
				"UK3CB_BAF_127_100Rnd"
			];
		} else {
			switch (missionNamespace getVariable ["gearSelection", "default"]) do
			{
				case "RHSUSF": {
					_inventoryContents = [
						"RHS_M2_Gun_Bag",
						"RHS_M2_Tripod_Bag"
					];
				};

				case "RHSAFRF": {
					_inventoryContents = [
						"RHS_Kord_Gun_Bag",
						"RHS_Kord_Tripod_Bag"
					];
				};

				case "BAF": {
					_inventoryContents = [
						"UK3CB_BAF_L111A1",
						"UK3CB_BAF_Tripod",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd",
						"UK3CB_BAF_127_100Rnd"
					];
				};

				default {
					_inventoryContents = [
						"B_HMG_01_high_weapon_F",
						"B_HMG_01_weapon_F",
						"B_HMG_01_support_high_F",
						"B_HMG_01_support_F"
					];
				};
			};
		};
	};

	case "Explosives":
	{
		_inventoryContents = [
			"MineDetector",
			"ToolKit",
			"APERSBoundingMine_Range_Mag",
			"APERSBoundingMine_Range_Mag",
			"APERSBoundingMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSTripMine_Wire_Mag",
			"APERSTripMine_Wire_Mag",
			"APERSTripMine_Wire_Mag",
			"ATMine_Range_Mag",
			"ATMine_Range_Mag",
			"ATMine_Range_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"SLAMDirectionalMine_Wire_Mag",
			"SLAMDirectionalMine_Wire_Mag",
			"SLAMDirectionalMine_Wire_Mag",
			"SatchelCharge_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"HandGrenade",
			"HandGrenade",
			"HandGrenade",
			"HandGrenade",
			"MiniGrenade",
			"MiniGrenade",
			"MiniGrenade",
			"MiniGrenade",
			"SmokeShellBlue",
			"SmokeShellBlue",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"SmokeShellOrange",
			"SmokeShellOrange",
			"SmokeShellPurple",
			"SmokeShellPurple",
			"SmokeShellRed",
			"SmokeShellRed",
			"SmokeShellYellow",
			"SmokeShellYellow",
			"SmokeShell",
			"SmokeShell"
		];

		if ("ace_explosives" call ARTR_fnc_checkMod) then
		{
			_inventoryContents append [
				"ACE_Clacker",
				"ACE_M26_Clacker",
				"ACE_DefusalKit"
			];
		};
	};

	case "Launchers":
	{
		switch (missionNamespace getVariable ["gearSelection", "default"]) do
		{
			case "RHSUSF": {
				_inventoryContents = [
					"rhs_weap_M136",
					"rhs_weap_M136_hedp",
					"rhs_weap_M136_hp",
					"rhs_weap_m72a7"
				];
			};

			case "RHSAFRF": {
				_inventoryContents = [
					"rhs_weap_rpg26",
					"rhs_weap_rshg2",
					"rhs_weap_rpg7",
					"rhs_rpg7_PG7V_mag",
					"rhs_rpg7_PG7V_mag",
					"rhs_rpg7_PG7VL_mag",
					"rhs_rpg7_PG7VL_mag",
					"rhs_rpg7_OG7V_mag",
					"rhs_rpg7_OG7V_mag"
				];
			};

			case "BAF": {
				_inventoryContents = [
					"UK3CB_BAF_AT4_CS_AP_Launcher",
					"UK3CB_BAF_AT4_CS_AT_Launcher"
				];
			};

			default {
				_inventoryContents = [
					"launch_NLAW_F",
					"NLAW_F",
					"NLAW_F",
					"NLAW_F",
					"NLAW_F",
					"NLAW_F"
				];
			};
		};
	};

	case "Medical":
	{
		if ("ace_medical" call ARTR_fnc_checkMod) then
		{
			_inventoryContents = [
				"ACE_fieldDressing",
				"ACE_packingBandage",
				"ACE_elasticBandage",
				"ACE_quikclot",
				"ACE_tourniquet",
				"ACE_fieldDressing",
				"ACE_packingBandage",
				"ACE_elasticBandage",
				"ACE_quikclot",
				"ACE_tourniquet",
				"ACE_fieldDressing",
				"ACE_packingBandage",
				"ACE_elasticBandage",
				"ACE_quikclot",
				"ACE_tourniquet",
				"ACE_epinephrine",
				"ACE_morphine",
				"ACE_atropine",
				"ACE_epinephrine",
				"ACE_morphine",
				"ACE_atropine",
				"ACE_bloodIV_500",
				"ACE_bloodIV"
			];
		} else {
			_inventoryContents = [
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"FirstAidKit",
				"Medikit"
			];
		};
	};

	case "Ammo":
	{
		switch (missionNamespace getVariable ["gearSelection", "default"]) do
		{
			case "RHSUSF": {
				_inventoryContents = [
					"rhs_mag_30Rnd_556x45_M855A1_Stanag",
					"rhs_mag_30Rnd_556x45_M855A1_Stanag",
					"rhs_mag_30Rnd_556x45_Mk318_Stanag",
					"rhs_mag_30Rnd_556x45_Mk318_Stanag",
					"rhsusf_100Rnd_556x45_soft_pouch",
					"rhsusf_100Rnd_556x45_soft_pouch",
					"rhs_mag_M441_HE",
					"rhsusf_5Rnd_300winmag_xm2010",
					"rhsusf_5Rnd_300winmag_xm2010",
					"rhsusf_mag_15Rnd_9x19_JHP"
				];
			};

			case "RHSAFRF": {
				_inventoryContents = [
					"rhs_30Rnd_545x39_7N10_AK",
					"rhs_30Rnd_545x39_7N10_AK",
					"rhs_30Rnd_545x39_7N10_AK",
					"rhs_10Rnd_762x54mmR_7N1",
					"rhs_10Rnd_762x54mmR_7N1",
					"rhs_VOG25",
					"rhs_VOG25",
					"rhs_100Rnd_762x54mmR",
					"rhs_mag_9x18_8_57N181S"
				];
			};

			case "BAF": {
				_inventoryContents = [
					"UK3CB_BAF_556_30Rnd",
					"UK3CB_BAF_556_30Rnd",
					"UK3CB_BAF_556_30Rnd",
					"UK3CB_BAF_338_5Rnd",
					"UK3CB_BAF_338_5Rnd",
					"UK3CB_BAF_762_L42A1_20Rnd",
					"UK3CB_BAF_762_L42A1_20Rnd",
					"UK3CB_BAF_1Rnd_HE_Grenade_Shell",
					"UK3CB_BAF_1Rnd_HE_Grenade_Shell",
					"1Rnd_Smoke_Grenade_shell",
					"1Rnd_Smoke_Grenade_shell",
					"1Rnd_SmokeRed_Grenade_shell",
					"1Rnd_SmokeRed_Grenade_shell",
					"1Rnd_SmokeBlue_Grenade_shell",
					"1Rnd_SmokeBlue_Grenade_shell",
					"1Rnd_SmokeGreen_Grenade_shell",
					"1Rnd_SmokeGreen_Grenade_shell",
					"UK3CB_BAF_9_17Rnd",
					"UK3CB_BAF_556_200Rnd"
				];
			};

			default {
				_inventoryContents = [
					"30Rnd_65x39_caseless_mag",
					"30Rnd_65x39_caseless_mag",
					"30Rnd_65x39_caseless_mag",
					"100Rnd_65x39_caseless_mag_Tracer",
					"100Rnd_65x39_caseless_mag_Tracer",
					"7Rnd_408_Mag",
					"7Rnd_408_Mag",
					"3Rnd_HE_Grenade_shell",
					"1Rnd_Smoke_Grenade_shell",
					"1Rnd_Smoke_Grenade_shell",
					"16Rnd_9x21_Mag",
					"11Rnd_45ACP_Mag"
				];
			};
		};
	};
};

private _index = 0;

while { _box canAdd (_inventoryContents select _index) } do
{
	private _item = _inventoryContents select _index;

	if (_item in _backpackContents) then
	{
		_box addBackpackCargoGlobal [_item, 1];
	} else {
		_box addItemCargoGlobal [_item, 1];
	};


	if (_index == (count _inventoryContents - 1)) then
	{
		_index = 0;
	} else {
		_index = _index + 1;
	};
};
