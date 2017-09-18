/*
This function returns a boolean after checking whether a function exists
Arguments:
	0: cfg file name. STRING.

Return: BOOL
*/
params [
	[ "_cfgName", "", [""]]
];

_return = false;
if isClass (configfile >> "CfgPatches" >> _cfgName) then { _return = true; };

_return;
