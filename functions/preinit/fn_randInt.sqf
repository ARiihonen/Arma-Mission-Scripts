/*
Chooses a random integer from provided range

Arguments
0: Maximum number acceptable. NUMBER
1: (Optional) Minimum number acceptable. NUMBER, default: 1

Return: NUMBER
*/

params [
	["_max", 1, [0] ],
	["_min", 1, [0] ]
];

//check difference, flip numbers if given in wrong order
if (_max < _min) then {
	private _temp = _min;
	_min = _max;
	_max = _temp;
};
private _difference = _max - _min;

//Select random number fitting provided parameters and return
_rand = _min + floor(random (_difference + 1));

_rand
