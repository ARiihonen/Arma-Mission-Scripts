caran_clearInventory = {
	_unit = param [0, objNull, [objNull]];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
};

caran_addThing = {
	_unit = param [0, objNull, [objNull]];
	_thing = param [1, "", [""]];
	_type = param [2, "", [""]];
	_force = if (_type == "Uniform") then { "force"; } else { ""; };
	
	if (_thing != "" && _type != "") then {
		call compile format ["remove%1 _unit;", _type];
		call compile format ["_unit %3add%1 '%2';", _type, _thing, _force];
	};
};

caran_addUniform = {
	_unit = param [0, objNull, [objNull]];
	_container = param [1, "", [""]];
	
	[_unit, _container, "Uniform"] call caran_addThing;
};

caran_addVest = {
	_unit = param [0, objNull, [objNull]];
	_container = param [1, "", [""]];
	
	[_unit, _container, "Vest"] call caran_addThing;
};

caran_addBackpack = {
	_unit = param [0, objNull, [objNull]];
	_container = param [1, "", [""]];
	
	[_unit, _container, "Backpack"] call caran_addThing;
};

caran_addHeadwear = {
	_unit = param [0, objNull, [objNull]];
	_headwear = param [1, ["",""], [], [2]];
	
	_headgear = _headwear param [0, "", [""]];
	_goggles = _headwear param [1, "", [""]];
	
	[_unit, _headgear, "Headgear"] call caran_addThing;
	[_unit, _goggles, "Goggles"] call caran_addThing;
};

caran_addClothing = {
	_unit = param [0, objNull, [objNull]];
	_uniform = param [1, "", [""]];
	_vest = param [2, "", [""]];
	_backpack = param [3, "", [""]];
	_headwear = param [4, ["",""], [[]], [2]];
	
	[_unit, _uniform] call caran_addUniform;
	[_unit, _vest] call caran_addVest;
	[_unit, _backpack] call caran_addBackpack;
	[_unit, _headwear] call caran_addHeadwear;
};

caran_addInventoryItem = {
	_unit = param [0, objNull, [objNull]];
	_item = param [1, "", [""]];
	_quantity = param [2, 0, [0]];
	_container = param [3, "Uniform", [""]];
	
	for '_i' from 1 to _quantity do {
		if (_item != "") then {
			call compile format ["_unit addItemTo%2 '%1';", _item, _container];
		};
	};
};

caran_addInventoryItems = {
	_unit = param [0, objNull, [objNull]];
	_items = param [1, [["", 0, "Uniform"]], [[]], []];
	
	if (count _items > 0) then {
		{
			_newArray = [_unit] + _x;
			_newArray call caran_addInventoryItem;
		} forEach _items;
	};
};

caran_addLinkedItems = {
	_unit = param [0, objNull, [objNull]];
	_item = param [1, "", ["", []], []];
	
	if (typeName _item == "STRING") then {
		if (_item != "") then {
			_unit linkItem _item;
		};
	} else {
		{
			if (_x != "") then {
				_unit linkItem _x;
			};
		} forEach _item
	};
};

caran_addInventoryWeapons = {
	_unit = param [0, objNull, [objNull]];
	_item = param [1, "", ["",[]], []];
	
	if (typeName _item == "STRING") then {
		if (_item != "") then {
			call compile format ["_unit addWeapon '%1';", _item];
		};
	} else {
		{
			if (_x != "") then {
				call compile format ["_unit addWeapon '%1';", _x]; 
			};
		} forEach _item;
	};
};

caran_addWeaponItems = {
	_unit = param [0, objNull, [objNull]];
	_weaponType = param [1, "PrimaryWeapon", [""]];
	_item = param [2, "", ["",[]], []];
	
	if (typeName _item == "STRING") then {
		if (_item != "") then {
			call compile format ["_unit add%1Item '%2';", _weaponType, _item];
		};
	} else {
		{
			if (_x != "") then {
				call compile format ["_unit add%1Item '%2';", _weaponType, _x]; 
			};
		} forEach _item;
	};
};

caran_addWeapon = {
	_unit = param [0, objNull, [objNull]];
	_weapon = param [1, "", [""]];
	_items = param [2, [], [[], ""], []];
	_ammo_array = param [3, [], [[]], []];
	_type = param [4, "PrimaryWeapon", [""]];
	
	_ammo = "";
	_ammo_amount = 0;
	_ammo_location = "";
	if (count _ammo_array == 3) then {
		_ammo = _ammo_array select 0;
		_ammo_amount = _ammo_array select 1;
		_ammo_location = _ammo_array select 2;
		[_unit, _ammo, 1, _ammo_location] call caran_addInventoryItem;
	};
	
	if (_weapon != "") then {
		_unit addWeapon _weapon;
	};
	
	if (typeName _items == "STRING") then {
		if (_items != "") then {
			[_unit, _type, _items] call caran_addWeaponItems;
		};
	} else {
		if (count _items > 0) then {
			[_unit, _type, _items] call caran_addWeaponItems;
		};
	};
	
	if (count _ammo_array == 3) then {
		[_unit, _ammo, _ammo_amount, _ammo_location] call caran_addInventoryItem;
	};
};

caran_addPrimaryWeapon = {
	_array = _this;
	_type = ["PrimaryWeapon"];
	
	_array append _type;
	_array call caran_addWeapon;
};

caran_addSecondaryWeapon = {
	_array = _this;
	_type = ["SecondaryWeapon"];
	
	_array append _type;
	_array call caran_addWeapon;
};

caran_addHandgun = {
	_array = _this;
	_type = ["Handgun"];
	
	_array append _type;
	_array call caran_addWeapon;
};