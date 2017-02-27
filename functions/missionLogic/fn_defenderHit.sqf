_target = _this select 0;
_source = _this select 1;

diag_log format ["%1 hit by %2", _target, _source];

if (_source != player) then {
	_target setVariable ["last_hit", _source];
};
