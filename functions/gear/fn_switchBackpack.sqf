params [
	[ "_unit", player, [objNull] ],
	[ "_backpack", "", [""] ]
];

_ret = false;
if (_uniform != "") then {
	private _items = backpackItems _unit;
	removeBackpack _unit;
	_unit addBackpack _uniform;

	{
		_unit addItemToBackpack _x;
	} forEach _items;

	_ret = true;
};

_ret;
