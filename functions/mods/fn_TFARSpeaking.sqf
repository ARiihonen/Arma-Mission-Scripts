_unit = _this select 0;
_isSpeaking = _this select 1;

if (_isSpeaking && !((vehicle player) call TFAR_fnc_isVehicleIsolated) ) then
{
	private _maxDistance = _unit getVariable ["ARTR_TFARSpeakingRange", 20];
	private _affectedObjects = (_unit nearEntities ["Man", _maxDistance]) select { !isNil _x && alive _x && !(vehicle _x) call TFAR_fnc_isVehicleIsolated };

	diag_log format ["TFARSpeaking %1, maxDistance: %2", _unit, _maxDistance];
	{
		_distance = _unit distance _x;
		_revealAmount = 4*(exp(-3.69*(_distance/_maxDistance)));

		[_x,[_unit, _revealAmount]] remoteExecCall ["reveal", _x, false];
	} forEach _affectedObjects select { !(isNil _x) && !((vehicle _x) call TFAR_fnc_isVehicleIsolated) };
};
