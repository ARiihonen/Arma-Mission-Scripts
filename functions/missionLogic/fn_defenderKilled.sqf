_target = _this select 0;
_killer = _this select 1;

diag_log format ["%1 killed by %2", _target, _killer];

if (_killer == _target && !isNull (_target getVariable "last_hit") ) then {
	_killer = _target getVariable "last_hit";
};

diag_log format ["Real killer: %1", _killer];

diag_log format ["Murdered defenders before killer check: %1", missionNamespace getVariable ["murdered_defenders", 0]];
if (side (group _killer) == east) then {
	_murders = missionNamespace getVariable ["murdered_defenders", 0];
	_murders = _murders + 1;
	missionNamespace setVariable ["murdered_defenders", _murders, true];

	if (! (missionNamespace getVariable ["maskTaskGiven",false]) ) then { remoteExecCall ["ARTR_fnc_maskRaid",2]; };
};
diag_log format ["Murdered defenders after killer check: %1", missionNamespace getVariable ["murdered_defenders", 0]];
