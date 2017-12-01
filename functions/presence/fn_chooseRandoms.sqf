/*
Creates an array with random numbers from provided range

Arguments
0: Array from which to select
1: Minimum amount of indices in returned array. NUMBER
2: (Optional) Maximum amount of indexes in returned array. NUMBER, defaults: same as minimum
*/
params [
	[ "_array", [], [[]] ],
	[ "_min", 1, [0] ],
	[ "_max", _min, [0] ]
];
_retArray = +_array;

//Randomise size of returned array
private _amount = [_max, _min] call ARTR_fnc_randInt;

//Until the array is of required size, remove element
while {count _retArray > _amount} do {
	_retArray = _retArray - [selectRandom _retArray];
};

//Remove any null-objects from array and return
_retArray = _retArray - [objNull];

_retArray
