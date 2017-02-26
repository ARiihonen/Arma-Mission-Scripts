/*
Set incrementing, array-format conditions of existence on all selected objects in Eden. Shows the final added value in both system chat and diag_log to help preinit setup.

Params:
	0: Variable name of the condition array. STRING
	1: (Optional) Counter start position. INT
*/

_var_name = _this param [0,"presenceArray",[""]];
_counter = _this param [1,0,[0]];

collect3DENHistory {
	{
		_counter = _counter + 1;
		_x set3DENAttribute ["presenceCondition", format ["%1 in %2", _counter, _var_name]];
	} forEach get3DENSelected "object";
};

systemChat (_var_name + " last value: " + (str _counter));
diag_log ("Conditions set for " +  _var_name + ", last value: " + (str _counter));
