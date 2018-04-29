//Workaround fix to allow looting AI that have had their gear modified in 3den loadout editor.
if (isServer || (!isServer && !hasInterface)) then {
	{
		_x setUnitLoadout getUnitLoadout _x;
	} forEach (allUnits - playableUnits) select { side _x == west };
};
