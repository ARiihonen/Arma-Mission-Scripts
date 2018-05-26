if (isServer || (!isNil "headlessClient" && { player == headlessClient}) ) then {
	waitUntil { time > 0 };
	{
		_x setUnitPos "UP";
		_x forceSpeed 0;
	} forEach (allUnits - playableUnits) select { side _x == west };
};
