asr_ai3_main_enabled 		    = 1;    // All the other settings matter only if we have 1 here; set 0 to disable all scripted features
asr_ai3_main_radiorange 	    = 500;  // Maximum range for AI radios (warning: increasing this impacts game performance); AI groups share known enemy locations over radio (set to 0 to disable)
asr_ai3_main_seekcover 		    = 1;    // Set to 1 if AI should move to near cover in combat when they're exposed in the open, 0 to disable.
asr_ai3_main_usebuildings   	= 0.8;  // Chance the AI group members may enter nearby building positions (0 to 1 values, 0 will disable the feature)
asr_ai3_main_getinweapons 	    = 0.5;  // Chance the AI group will mount nearby static and vehicle weapons in combat (0 to 1 values, 0 will disable the feature)
asr_ai3_main_packNVG		    = 1;    // Automatically un-equip NVG during the day (store them in the vest/backpack) and re-equip when it gets dark
asr_ai3_main_disableAIPGfatigue = 1;    // Disables fatigue for AI units in player's group so they are able to keep up (0 - disabled, 1 - enabled)
asr_ai3_main_onteamswitch   	= 1;    // Teamswitch handler: makes unit switched into the group leader; prevents AI left in place from sending stupid orders (0 - disabled, 1 - enabled)
asr_ai3_main_copymystance   	= 1;    // When enabled AI will auto adjust to player stance changes (0 - disabled, 1 - enabled)
asr_ai3_main_debug 	    	    = 0;    // Log extra debugging info to RPT, create debug markers and hints (1-enabled, 0-disabled)


/*
	Units are classified into skill sets between 1 and 10
	By default, a lower level number means a better skilled unit
	Levels 8-10 are special:
	 - 8-9 are for pilots
	 - 10 is for trained snipers
*/

asr_ai3_main_sets = [ // for each level: skilltype, [<min value>, <random value added to min>]
	[	"general",[1.00,0.0],	"aiming",[1.00,0.0],	"spotting",[1.00,0.0]	],	// 0:  super-AI (only used for testing)
	[	"general",[0.90,0.1],	"aiming",[0.40,0.2],	"spotting",[0.40,0.1]	],	// 1:  sf 1
	[	"general",[0.85,0.1],	"aiming",[0.35,0.2],	"spotting",[0.35,0.1]	],	// 2:  sf 2 (recon units, divers and spotters)
	[	"general",[0.80,0.1],	"aiming",[0.30,0.2],	"spotting",[0.30,0.1]	],	// 3:  regular 1 (regular army leaders, marksmen)
	[	"general",[0.75,0.1],	"aiming",[0.25,0.2],	"spotting",[0.25,0.1]	],	// 4:  regular 2 (regulars)
	[	"general",[0.70,0.1],	"aiming",[0.20,0.2],	"spotting",[0.20,0.1]	],	// 5:  militia or trained insurgents, former regulars (insurgent leaders, marksmen)
	[	"general",[0.65,0.1],	"aiming",[0.15,0.2],	"spotting",[0.15,0.1]	],	// 6:  some military training (insurgents)
	[	"general",[0.60,0.1],	"aiming",[0.10,0.2],	"spotting",[0.10,0.1]	],	// 7:  no military training
	[	"general",[0.80,0.1],	"aiming",[0.25,0.2],	"spotting",[0.35,0.1]	],	// 8:  pilot 1 (regular)
	[	"general",[0.70,0.1],	"aiming",[0.20,0.2],	"spotting",[0.30,0.1]	],	// 9:  pilot 2 (insurgent)
	[	"general",[0.90,0.1],	"aiming",[0.70,0.3],	"spotting",[0.90,0.1]	]	// 10: sniper 
];

asr_ai3_main_levels_units = [
	[],	// 0:  super-AI (only used for testing)
	[],	// 1:  sf 1
	[],	// 2:  sf 2 (recon units, divers and spotters)
	[],	// 3:  regular 1 (regular army leaders, marksmen)
	[],	// 4:  regular 2 (regulars)
	[],	// 5:  militia or trained insurgents, former regulars (insurgent leaders, marksmen)
	[],	// 6:  civilians with some military training (insurgents)
	[],	// 7:  civilians without military training
	[],	// 8:  pilot 1 (regular)
	[],	// 9:  pilot 2 (insurgent)
	[]	// 10: sniper 
];

asr_ai3_main_factions = [ // default coefficient for unlisted factions is 1, meaning no change
["rhs_faction_socom",2],
["BLU_F",4],
["OPF_F",4],
["IND_F",4],
["rhs_faction_msv",4],
["rhs_faction_vdv",4],
["rhs_faction_vmf",1],
["rhs_faction_vv",4],
["rhs_faction_tv",4],
["rhs_faction_vpvo",4],
["rhs_faction_vvs",4],
["rhs_faction_vvs_c",4],
["rhs_faction_rva",4],
["rhs_faction_usarmy_wd",4],
["rhs_faction_usarmy_d",4],
["rhs_faction_usmc_wd",4],
["rhs_faction_usmc_d",4],
["rhs_faction_usaf",8],
["rhs_faction_usn",4],
["LOP_RACS",4],
["LOP_SLA",4],
["LOP_US",4],
["LOP_IA",4],
["LOP_CDF",4],
["BLU_G_F",5],
["OPF_G_F",5],
["IND_G_F",5],
["rhs_faction_insurgents",5],
["LOP_AM",5],
["LOP_ISTS",5],
["LOP_ChDKZ",5],
["LOP_AFR",5],
["CIV_F",7],
["LOP_TAK_Civ",7],
["LOP_AFR_Civ",7]
];

{
	publicVariable _x;
} forEach [ "asr_ai3_main_enabled", "asr_ai3_main_radiorange", "asr_ai3_main_seekcover", "asr_ai3_main_usebuildings", "asr_ai3_main_getinweapons", "asr_ai3_main_packNVG", "asr_ai3_main_disableAIPGfatigue", "asr_ai3_main_onteamswitch", "asr_ai3_main_copymystance", "asr_ai3_main_debug", "asr_ai3_main_sets", "asr_ai3_main_levels_units", "asr_ai3_main_factions" ];