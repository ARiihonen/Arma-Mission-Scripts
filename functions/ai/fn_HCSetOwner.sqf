if (isServer && typeName call ARTR_fnc_getAIController == "OBJECT") then
{
	{
		_set = _x setGroupOwner (missionNamespace getVariable "ARTR_HCID");
	} forEach allGroups select {
		_ret = true;
		{
			if (isPlayer _x) then { _ret = false; };
		} forEach (units _x);
		_ret;
	};
	missionNamespace setVariable ["ARTR_HCSET", true, true];
};
