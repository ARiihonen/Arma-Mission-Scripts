//Init sets of AI skill: general/aiming/spotting, format: [skill,random deviation]
ai_skill_sets = [
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

//Faction default skill sets (["faction",skillset])
ai_faction_skills = [
	["BLU_F",3],
	["OPF_F",3],
	["IND_F",4],
	["BLU_G_F",5],
	["OPF_G_F",5],
	["IND_G_F",5],
	["CIV_F",7]
];

//Per-unit exceptions to faction skill ([unit,skillset])
ai_unit_sets = [
	
];

//Per-class exceptions to faction skill ([class,skillset])
ai_class_sets = [
	
];

//function for setting all AI skills
ai_setSkills = {
	_list = _this select 0;
	
	{
		_unit = _x;
		_set_index = 3;
		
		_override = false;
		{
			if (_unit == _x select 0) exitWith {
				_set_index = _x select 1;
				_override = true;
			};
		} forEach ai_unit_sets;
		
		if (!_override) then {
			{
				if (typeOf _unit == _x select 0) exitWith {
					_set_index = _x select 1;
					_override = true;
				};
			} forEach ai_class_sets;
			
			if (!_override) then {
				{
					if (faction _unit == _x select 0) exitWith {
						_set_index = _x select 1;
						_override = true;
					};
				} forEach ai_faction_skills;
			};
		};
		
		_unit setSkill 1;
		
		_skill_set = ai_skill_sets select _set_index;
		{
			_main = _x select 0;
			_offset = _x select 1;
			
			_skills = [];
			switch _forEachIndex do {
				case 0: { _skills = ["courage","commanding","general","reloadSpeed"]; }; //general
				case 1: { _skills = ["aimingAccuracy","aimingShake","aimingSpeed"]; }; //aiming
				case 2: { _skills = ["spotDistance","spotTime"]; }; //spotting
			};
			
			{
				_skill_type = _x;
				_total = _main - _offset + random (_offset*2);
				_unit setSkill [_skill_type,_total];
			} forEach _skills;
		} forEach _skill_set;
	} forEach _list;
};