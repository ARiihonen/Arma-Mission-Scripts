if (isServer || (!isServer && !hasInterface)) then {
	waitUntil { missionNamespace getVariable ["ARTR_ai_setsSet", false] };

	private _list = [allUnits, _this] select (_this select 0 isEqualType objNull);
	private _skillSets = missionNamespace getVariable "ARTR_ai_skillSets";
	private _factionSkills = missionNamespace getVariable "ARTR_ai_factionSkills";
	private _unitSets = missionNamespace getVariable "ARTR_ai_unitSets";
	private _classSets = missionNamespace getVariable "ARTR_ai_classSets";

	{
		private _unit = _x;
		private _set_index = 3;

		private _override = false;
		{
			if (_unit == _x select 0) exitWith {
				_set_index = _x select 1;
				_override = true;
			};
		} forEach _unitSets;

		if (!_override) then {
			{
				if (typeOf _unit == _x select 0) exitWith {
					_set_index = _x select 1;
					_override = true;
				};
			} forEach _classSets;

			if (!_override) then {
				{
					if (faction _unit == _x select 0) exitWith {
						_set_index = _x select 1;
						_override = true;
					};
				} forEach _factionSkills;
			};
		};

		_unit setSkill 1;

		private _skill_set = _skillSets select _set_index;
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
