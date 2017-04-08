/*
Set incrementing, array-format conditions of existence on all selected objects in Eden. Shows the final added value in both system chat and diag_log to help preinit setup.

Params:
	0: Variable name of the condition array. STRING
	1: (Optional) Counter start position. INT
*/

params[
	["_varName","presenceArray",[""]],
	["_counter",0,[0]]
];

collect3DENHistory {
	{
		_counter = _counter + 1;
		private _oldCondition = (_x get3DENAttribute "presenceCondition") select 0;
		private _newCondition = str(_counter) + " in " + _varName;
		private _finalCondition = [(_oldCondition + " && " + _newCondition),_newCondition] select (_oldCondition == "true");
		_x set3DENAttribute ["presenceCondition",_finalCondition];
	} forEach get3DENSelected "object";
};

systemChat ("Conditions set for " +  _varName + ", last value: " + (str _counter));
diag_log ("Conditions set for " +  _varName + ", last value: " + (str _counter));
copyToClipboard str _counter;
