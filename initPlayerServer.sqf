_unit = _this select 0;

/*
Checking for Headless Client and making sure editor-spawned dudes are HC-owned
*/
diag_log format ["IPS: %1", _unit];
if (!isNil "headlessClient") then
{
	if (_unit == headlessClient) then
	{
		_HCUnit = _unit;
		_id = owner headlessCLient;

		diag_log format ["HCUnit: %1, ID: %2", _HCUnit, _id];
		missionNamespace setVariable ["ARTR_AIController", _HCUnit, true];
		missionNamespace setVariable ["ARTR_HCID", _id, true];

		if (!(missionNamespace getVariable ["ARTR_HCSET", false]) && BIS_fnc_init) then
		{
			call ARTR_fnc_HCSetOwner;
		};
	};
};
