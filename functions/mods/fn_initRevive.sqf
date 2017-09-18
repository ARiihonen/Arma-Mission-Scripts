if (isServer) then
{
	if ("ace_medical" call ARTR_fnc_checkMod) then
	{
		missionNamespace setVariable["bis_reviveParam_mode",0,true];
	};
};
