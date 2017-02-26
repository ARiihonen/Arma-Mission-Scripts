_unit = _this select 0;
_distance = _this select 1;

diag_log format ["%1 VOLUME CHANGE, DISTANCE %2", _unit, _distance];
_unit setVariable ["ARTR_TFARSpeakingRange", _distance];
