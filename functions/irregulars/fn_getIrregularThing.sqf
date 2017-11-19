params [
	["_keywords", [], [[],""] ],
	["_setsArray", ARTR_irregularUniforms, [[]] ]
];

//Select a keyword from keywords, making sure it's a valid one
private _set = [];
_ret = "";

if (_keyWords isEqualType []) then {
	while {_set isEqualTo [] && count _keywords > 0} do
	{
		private _testKeyword = selectRandom _keywords;
		{
			if (_x select 0 == _testKeyword) then { _set = _x select 1; };
		} forEach _setsArray;

		_keywords deleteAt (_keywords find _testKeyword);
	};

	_ret = [(selectRandom _set),"leave"] select (count _set <= 0);
} else {

	if (_keywords == "leave" || _keywords == "remove") then {
		_ret = _keywords;
	} else {

		private _retSet = false;

		{
			if (_x select 0 == _keywords) exitWith { _ret = _x select 1; };
		} forEach _setsArray;
	};
};

_ret;
