if (isServer) then
{
	_modeAtFirst = missionNamespace getVariable ["bis_reviveParam_mode",-100];
	diag_log format ["REVIVE MODE BEFORE CHANGING: %1", _modeAtFirst];

	if ("ace_medical" call ARTR_fnc_checkMod) then
	{
		missionNamespace setVariable["bis_reviveParam_mode",0,true];
	};
};
