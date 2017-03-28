if (isServer) then
{
	switch ("GearPreference" call BIS_fnc_getParamValue) do
	{
		case 1: { if ("rhsusf_c_weapons" call ARTR_fnc_checkMod) then { missionNamespace setVariable ["gearSelection", "RHSUSF", true] }; };
		case 2: { if ("UK3CB_BAF_Weapons" call ARTR_fnc_checkMod && "UK3CB_BAF_Weapons" call ARTR_fnc_checkMod) then { missionNamespace setVariable ["gearSelection", "BAF"], true }; };
		case 3: { if ("rhs_c_weapons" call ARTR_fnc_checkMod) then { missionNamespace setVariable ["gearSelection", "RHSAFRF"], true }; };
	};

	if ("UK3CB_BAF_Weapons" call ARTR_fnc_checkMod && "StaticPreference" call BIS_fnc_getParamValue) then { missionNamespace setVariable ["staticConvert", true, true]; };

	infantryTiers = [
		[
			"O_G_Soldier_TL_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_TL_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_lite_F"
		],
		[
			"O_G_Soldier_TL_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_M_F",
			"O_G_Soldier_exp_F",
			"O_G_Soldier_A_F",
			"O_G_Soldier_TL_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_M_F",
			"O_G_Soldier_exp_F",
			"O_G_Soldier_A_F"
		],
		[
			"O_G_Soldier_SL_F",
			"O_G_Soldier_F",
			"O_G_Sharpshooter_F",
			"O_G_Soldier_LAT_F",
			"O_G_Soldier_AR_F",
			"O_G_Soldier_SL_F",
			"O_G_Soldier_F",
			"O_G_Sharpshooter_F",
			"O_G_Soldier_LAT_F",
			"O_G_Soldier_AR_F"
		]
	];

	vehicleSelection = [
		[
			"O_G_Offroad_01_armed_F"
		],
		[
			"C_Hatchback_01_F",
			"C_Offroad_01_F",
			"C_SUV_01_F",
			"I_G_Offroad_01_F"
		]
	];

	possibleVehicleSpawns = [
		"mrk_roadAttack_1",
		"mrk_roadAttack_2",
		"mrk_roadAttack_3",
		"mrk_roadAttack_4"
	];

	escalationAmount = {
		round (playersNumber west / 10);
	};

	maxGroups = {
		round (2.5*(playersNumber west / 10));
	};

	maxVehicles = {
		floor ((count attackGroups) / 3);
	};

	attackGroups = [];
	attackVehicles = [];

	groundVehicles = [];

	supplyBoxes = [];
	emptyBoxes = [];
};

if (isServer || (!isServer && !hasInterface)) then
{
	suppressionTargets = [];
};
