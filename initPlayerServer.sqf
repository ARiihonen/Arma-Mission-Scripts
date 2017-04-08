/*
Checking for Headless Client and making sure editor-spawned dudes are HC-owned
*/
if (!isNil "headlessClient") then
{
	if (_this select 0 == headlessClient) then
	{
		private _HCUnit = _this select 0;
		private _id = owner headlessCLient;

		missionNamespace setVariable ["ARTR_AIController", _HCUnit, true];
		missionNamespace setVariable ["ARTR_HCID", _id, true];

		if (!(missionNamespace getVariable ["ARTR_HCSET", false])) then
		{
			waitUntil { time > 0 };
			call ARTR_fnc_HCSetOwner;
		};
	};
};

//if player is pilot and the blackfish is piloted by AI, replace AI pilot with player

//Same for if heli pilot and ghosthawk
