_unit = _this select 0;
_uniform = _this select 1;

_items = uniformItems _unit;
removeUniform _unit;
_unit forceAddUniform _uniform;

{
	_unit addItemToUniform _x;
} forEach _items;
