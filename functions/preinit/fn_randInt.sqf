/*
Chooses a random integer from provided range

Arguments
0: Maximum number acceptable. NUMBER
1: (Optional) Minimum number acceptable. NUMBER, default: 1

Return: NUMBER
*/

//init and check variables
_max = param [0, 1, [0]];
_min = param [1, 1, [0]];

//check difference, flip numbers if given in wrong order
if (_max < _min) then {
	_temp = _min;
	_min = _max;
	_max = _temp;
};
_difference = _max - _min;

//Select random number fitting provided parameters and return
_rand = _min + floor(random (_difference + 1));

_rand
