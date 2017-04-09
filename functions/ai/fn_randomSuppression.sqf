
if (isServer || (!isServer && !hasInterface)) then
{
	tr_randSuppress = [
		"
			{ _x getVariable ['attacking', false] && (leader _x) inArea tr_suppressionZone && side _x == east } count allGroups > 0
		",
		"
			call ARTR_fnc_randomSuppression;
			call ARTR_fnc_suppressPositions;
			deleteVehicle thisTrigger;
		"
	] call ARTR_fnc_emptyTrigger;
	tr_randSuppress setTriggerTimeout [10,30,60,true];
};
