/*
Randomise gear for irregular soldiers in Eden, so you don't need to waste resources in changing unnecessary gear stuff in-mission.

Params: none
*/
collect3DENHistory {
	{
		_x call ARTR_fnc_addIrregularGear;
		save3DENInventory [_x];
	} forEach get3DENSelected "object";
};
