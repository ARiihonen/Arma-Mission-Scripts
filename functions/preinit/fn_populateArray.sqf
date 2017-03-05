/*
Creates an array with a sequence of numbers as indices.

Arguments
0: Maximum value in array. NUMBER
1: (Optional) Minimum value in array. NUMBER, default: 1
*/

_maxValue = param [0, 1, [0]];
_minValue = param [1, 1, [0]];

//Check that maxValue and minValue are in the right order, flip if not
if (_maxValue < _minValue) then {
	_temp = _minValue;
	_minValue = _maxValue;
	_maxValue = _temp;
};

_populatedArray = [];
for '_i' from _minValue to _maxValue do {
	_populatedArray set [count _populatedArray, _i];
};

_populatedArray
