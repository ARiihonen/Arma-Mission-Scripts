params [
	[ "_unit", player, [objNull] ],
	[ "_vest", "", [""] ]
];

_ret = false;
if (_uniform != "") then {
	private _items = vestItems _unit;
	removeVest _unit;
	_unit addVest _uniform;

	{
		_unit addItemToVest _x;
	} forEach _items;

	_ret = true;
};

_ret;
