/*
Creates an array with random numbers from provided range

Arguments
0: Array from which to select
1: Minimum amount of indices in returned array. NUMBER
2: (Optional) Maximum amount of indexes in returned array. NUMBER, defaults: same as minimum
*/
_array = param [0,[],[[]],[]];
_min = param [1, 1, [0]];
_max = param [2, _min, [0]];

//Check that max and min are in the right order, flip if not, calculate difference
if (_max < _min) then {
	_temp = _max;
	_min = _max;
	_max = _temp;
};
_difference = _max - _min;

//Randomise size of returned array
_rand = floor (random (_difference+1));
_amount = _min + _rand;

//Until the array is of required size, remove element
while {count _array > _amount} do {
	_ind = _array select floor random count _array;
	_array = _array - [_ind];
};

//Remove any null-objects from array and return
_randArray = _array - [objNull];

_randArray
