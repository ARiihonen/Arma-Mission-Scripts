if ( !isNil "headlessClient" && { player == headlessClient} ) then
{
	waitUntil { missionNamespace getVariable ["ARTR_HCSET", false] };
	call ARTR_fnc_initIndoorsBehaviour;
};
