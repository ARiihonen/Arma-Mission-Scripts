/*
Creates a local arealess trigger. Intended for use on the server for tracking mission status.

Params:
	0: trigger condition - STRING.
	1: trigger exec - STRING.

Return:
	0: trigger - OBJECT
*/

_condition = _this param [0,"",[""]];
_exec = _this param [1,"",[""]];

_newTrigger = createTrigger ["EmptyDetector", [0,0,0], false];
_newTrigger setTriggerActivation ["NONE", "PRESENT", false];
_newTrigger setTriggerStatements [
	_condition,
	_exec,
	""
];

_newTrigger
