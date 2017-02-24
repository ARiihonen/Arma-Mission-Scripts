_var_name = _this;
_counter = 0;

collect3DENHistory {
	{
		_counter = _counter + 1;
		_x set3DENAttribute ["presenceCondition", format ["%1 in %2", _counter, _var_name]];
	} forEach get3DENSelected "object";
};

systemChat (_var_name + " last value: " + (str _counter));