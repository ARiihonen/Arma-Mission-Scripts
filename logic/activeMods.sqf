caran_initModList = {
	
	_modStrings = _this;
	
	caran_modList = [];
	{
		if (count _modStrings > 0) then {
			_addon = toLower _x;
			
			{
				_modString = toLower _x;
				
				if ([_modString, _addon] call BIS_fnc_inString) then {
					caran_modList set [count caran_modList, _addon];
					_modStrings = _modStrings - [_modString];
				};
			} forEach _modStrings;
		};
		
	} forEach activatedAddons;
	
	publicVariable "caran_modList";
	
	true
};

caran_checkMod = {
	
	_modString = param[0,"",[""]];
	_modString = toLower _modString;
	
	ret = false;
	{
		_addon = toLower _x;
		
		if ([_modString, _addon] call BIS_fnc_inString) then {
			ret = true;
		};
	} forEach caran_modList;
	
	ret
};