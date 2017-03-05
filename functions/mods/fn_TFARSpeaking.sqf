params [
	["_unit", player, [objNull]],
	["_isSpeaking", true, [true]]
];

if (_isSpeaking && alive _unit && !(player getVariable ['ACE_isUnconscious', false]) !((vehicle _unit) call TFAR_fnc_isVehicleIsolated) ) then
{
	private _maxDistance = _unit getVariable ["ARTR_TFARSpeakingRange", 20];
	private _affectedObjects = (_unit nearEntities ["Man", _maxDistance]) select { alive _x && !(vehicle _x) call TFAR_fnc_isVehicleIsolated };

	{
		private _distance = _unit distance _x;
		private _revealAmount = 4*(exp(-3.69*(_distance/_maxDistance)));

		[_x,[_unit, _revealAmount]] remoteExecCall ["reveal", _x, false];
	} forEach _affectedObjects select { !isNil _x };
};
