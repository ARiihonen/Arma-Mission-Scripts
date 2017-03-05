/*
Creates a local arealess trigger. Intended for use on the server for tracking mission status.

Params:
	0: trigger condition - STRING.
	1: trigger exec - STRING.

Return:
	0: trigger - OBJECT
*/
params [
	[ "_condition", "", [""]],
	[ "_exec", "", [""]]
];

_newTrigger = createTrigger ["EmptyDetector", [0,0,0], false];
_newTrigger setTriggerActivation ["NONE", "PRESENT", false];
_newTrigger setTriggerStatements [
	_condition,
	_exec,
	""
];

_newTrigger;
