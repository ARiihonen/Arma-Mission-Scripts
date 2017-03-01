_unit = _this select 0;
_vest = _this select 1;

_items = vestItems _unit;
removeVest _unit;
_unit addVest _vest;

{
	_unit addItemToVest _x;
} forEach _items;
