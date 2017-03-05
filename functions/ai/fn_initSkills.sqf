if (isServer) then {

	//Init sets of AI skill: general/aiming/spotting, format: [skill,random deviation]
	_ai_skill_sets = [
		[ [1.00,0.00],[1.00,0.00],[1.00,0.00] ], // 00: Super
		[ [0.90,0.02],[0.50,0.01],[0.50,0.01] ], // 01: Tier 1
		[ [0.85,0.03],[0.40,0.02],[0.40,0.02] ], // 02: Real Good
		[ [0.80,0.03],[0.30,0.03],[0.30,0.05] ], // 03: Pro
		[ [0.75,0.03],[0.25,0.03],[0.25,0.03] ], // 04: Semi pro
		[ [0.70,0.05],[0.20,0.05],[0.20,0.05] ], // 05: Irregular
		[ [0.60,0.10],[0.10,0.10],[0.10,0.10] ], // 06: Scrub
		[ [0.50,0.15],[0.05,0.15],[0.05,0.15] ], // 07: Civvie
		[ [0.90,0.05],[0.25,0.05],[0.50,0.05] ], // 08: Pilot
		[ [0.70,0.10],[0.20,0.10],[0.40,0.10] ], // 09: Irregular pilot
		[ [0.90,0.05],[0.70,0.05],[0.90,0.05] ]  // 10: Sniper
	];
	missionNamespace setVariable ["ARTR_ai_skillSets", _ai_skill_sets];

	//Faction default skill sets (["faction",skillset])
	_ai_faction_skills = [
		["BLU_F",3],
		["OPF_F",3],
		["IND_F",4],
		["BLU_G_F",5],
		["OPF_G_F",5],
		["IND_G_F",5],
		["CIV_F",7]
	];
	missionNamespace setVariable ["ARTR_ai_factionSkills", _ai_faction_skills];

	//Per-unit exceptions to faction skill ([unit,skillset])
	_ai_unit_sets = [

	];
	missionNamespace setVariable ["ARTR_ai_unitSets", _ai_unit_sets];

	//Per-class exceptions to faction skill ([class,skillset])
	_ai_class_sets = [

	];
	missionNamespace setVariable ["ARTR_ai_classSets", _ai_class_sets];

	missionNamespace setVariable ["ARTR_ai_setsSet", true];
};
