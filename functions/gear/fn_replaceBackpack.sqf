_unit = _this select 0;
_backpack = _this select 1;

_items = backpackItems _unit;
removeBackpack _unit;
_unit addBackpack _backpack;

{
	_unit addItemToBackpack _x;
} forEach _items;
