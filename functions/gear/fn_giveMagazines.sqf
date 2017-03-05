params [
	["_unit", player, [objNull] ],
	["_magArray", ["",0], [[]] ]
];

//Give magazines
{
	_x params [
		["_mag", "", [""]],
		["_magCount", 0, [0]]
	];

	if (_mag != "") then
	{
		for "_i" from 1 to _magCount do { _unit addItemToVest _mag; };
	};
} forEach _magArray;
