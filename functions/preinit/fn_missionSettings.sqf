if (isServer || (!isServer && !hasInterface) ) then
{
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

	escalationAmount = {
		round (playersNumber west / 10);
	};
};
