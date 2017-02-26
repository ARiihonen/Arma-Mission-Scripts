diag_log format ["HCSETOWNER, ISSERVER: %1, AICONTROLLER: %2", isServer, typeName call ARTR_fnc_getAIController];
if (isServer && typeName call ARTR_fnc_getAIController == "OBJECT") then
{
	{
		_set = _x setGroupOwner (missionNamespace getVariable "ARTR_HCID");
		diag_log format ["SET GROUP OWNER FOR %1: %2", _x, _set];
	} forEach allGroups select {
		_ret = true;
		{
			if (isPlayer _x) then { _ret = false; };
		} forEach (units _x);
		_ret;
	};

	missionNamespace setVariable ["ARTR_HCSET", true, true];
};
