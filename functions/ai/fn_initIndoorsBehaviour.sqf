if (isServer || player == headlessClient) then {
	{
		_x setUnitPos "UP";
		_x forceSpeed 0;
	} forEach (allUnits - playableUnits) select { side _x == west };
};
