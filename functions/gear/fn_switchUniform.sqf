params [
	[ "_unit", player, [objNull] ],
	[ "_uniform", "", [""] ]
];

_ret = false;
if (_uniform != "") then {
	private _items = uniformItems _unit;
	removeUniform _unit;
	_unit forceAddUniform _uniform;

	{
		_unit addItemToUniform _x;
	} forEach _items;

	_ret = true;
};

_ret;
