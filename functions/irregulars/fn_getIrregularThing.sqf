params [
	["_keywords", [], [[]] ],
	["_setsArray", ARTR_irregularUniforms, [[]] ]
];

//Select a keyword from keywords, making sure it's a valid one
private _set = [];

if (!(_keywords isEqualTo [])) then
{
	while {_set isEqualTo [] && count _keywords > 0} do
	{
		private _testKeyword = selectRandom _keywords;
		{
			if (_x select 0 == _testKeyword) then { _set = _x select 1 }
		} forEach _setsArray;

		_keywords deleteAt (_keywords find _testSet);
	};
};

_ret = [(selectRandom _set),"leave"] select (count _set <= 0);
_ret;
