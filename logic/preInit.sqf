caran_randInt = {
	/*
	Chooses a random integer from provided range

	Arguments
	0: Maximum number acceptable. NUMBER
	1: (Optional) Minimum number acceptable. NUMBER, default: 1
	
	Return: NUMBER
	*/
	
	//init and check variables
	_args = [_this] param [0, [1,1], [], [1,2]];
	
	_max = param [0, 1, [0]];
	_min = param [1, 1, [0]];
	
	//check difference, flip numbers if given in wrong order
	_difference = _max - _min;
	if (_difference < 0) then {
		_temp = _min;
		_min = _max;
		_max = _temp;
		_difference = _max - _min;
	};
	
	//Select random number fitting provided parameters and return
	rand = _min + floor(random (_difference + 1));
	
	rand
};

caran_populateArray = {
	/*
	Creates an array with a sequence of numbers as indexes.

	Arguments
	0: Maximum value in array. NUMBER 
	1: (Optional) Minimum value in array. NUMBER, default: 1
	*/
	
	_maxValue = param [0, 1, [0]];
	_minValue = param [1, 1, [0]];
	
	//Check that maxValue and minValue are in the right order, flip if not
	if (_maxValue - _minValue < 0) then {
		_temp = _minValue;
		_minValue = _maxValue;
		_maxValue = _temp;
	};
	
	populatedArray = [];
	for '_i' from _minValue to _maxValue do {
		populatedArray set [count populatedArray, _i];
	};
	
	populatedArray
};

caran_chooseRandoms = {
	/*
	Creates an array with random numbers from provided range

	Arguments
	0: Array from which to select
	1: Minimum amount of indexes in returned array. NUMBER
	2: (Optional) Maximum amount of indexes in returned array. NUMBER, defaults: same as minimum 
	*/
	
	_array = param [0,[],[[]],[]];
	_min = param [1, 1, [0]];
	_max = param [2, _min, [0]];
	
	//Check that max and min are in the right order, flip if not
	_difference = _max - _min;
	if (_difference < 0) then {
		_temp = _max;
		_min = _max;
		_max = _temp;
		_difference = _max - _min;
	};
	
	//Randomise size of returned array
	_rand = floor (random (_difference+1));
	_amount = _min + _rand;
	
	//Until the array is of required size, remove element
	while {count _array > _amount} do {
		_ind = _array select floor random count _array;
		_array = _array - [_ind];
	};
	
	//Remove any null-objects from array and return
	randArray = _array - [objNull];
	
	randArray
};

caran_presenceArray = {
	/*
	Creates an array with random numbers from provided range

	Arguments
	0: Maximum value in array. NUMBER 
	1: Minimum amount of indexes in returned array. NUMBER
	2: (Optional) Maximum amount of indexes in returned array. NUMBER, defaults: same as minimum 
	3: (Optional) Minimum value in array. NUMBER, default: 1
	*/
	
	//Check and assign parameters
	_args = [_this] param [0, [1,0], [], [2,3,4]];
	
	_maxValue = param [0, 1, [0]];
	_min = param [1, 0, [0]];
	_max = param [2, _min, [0]];
	_minValue = param [3, 1, [0]];

	//Fill array with all potential values
	presenceArray = [_maxValue, _minValue] call caran_populateArray;
	
	//Pick randoms
	presenceArray = [presenceArray, _min, _max] call caran_chooseRandoms;

	presenceArray
};