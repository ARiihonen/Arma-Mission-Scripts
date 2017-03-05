_unit = _this;

_gearArray = _unit call ARTR_fnc_getIrregularGear;

if (count _gearArray > 0) then {

	_uniform = _gearArray select 0;
	_vest = _gearArray select 1;
	_headWear = _gearArray select 2;
	_backpack = _gearArray select 3;
	_weaponArray = _gearArray select 4;
	_items = _gearArray select 5;
	_weaponItems = _gearArray select 6;
	_linkItems = _gearArray select 7;

	if (_uniform != "") then {
		[_unit,_uniform] call ARTR_fnc_replaceUniform;
	};

	if (_vest != "") then {
		[_unit,_vest] call ARTR_fnc_replaceVest;
	};

	if (count _headWear > 0) then {
		if (_headWear select 0 != "") then {
			removeHeadgear _unit;
			_unit addHeadgear (_headWear select 0);
		};

		if (_headWear select 1 != "") then {
			removeGoggles _unit;
			_unit addGoggles (_headWear select 1);
		};
	};

	if (_backpack != "") then {
		[_unit,_backpack] call ARTR_fnc_replaceBackpack;
	};

	{
		_unit addItem _x;
	} forEach _items;

	{
		_unit addWeapon _x;
	} forEach _weaponItems;

	{
		_unit linkItem _x;
	} forEach _linkItems;

	if (count _weaponArray > 0) then {

	};

	if (count _items > 0) then {

	};

	if (count _weaponItems > 0) then {

	};

	if (count _linkItems > 0) then {

	};
};
