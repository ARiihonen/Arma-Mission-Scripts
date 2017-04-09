//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
waitUntil {!isNull player};

["Terminate"] call BIS_fnc_EGSpectator;

if (player getVariable ["initialSpawn", true]) then
{
	[player] call ARTR_fnc_modGear;
	player setVariable ["initialSpawn", false, false];
	[player,[missionNamespace, "modGear"]] call BIS_fnc_saveInventory;
} else {
	[player,[missionNamespace, "modGear"]] call BIS_fnc_loadInventory;

	//Fade from black for respawn
	0 fadeSound 0;
	0 fadeMusic 0;
	nul = [] spawn {
		5 fadeSound 1;
		5 fadeMusic 1;

		titleCut ["", "BLACK IN", 5];
	};
};


if ((groupID (group player)) find "3-" >= 0) then
{
	if (player getVariable ["Pilot", false]) then
	{
		player setPos (markerPos "mrk_pilotRes");
	} else {
		player setVariable ["Pilot",true,true];
	};

} else {
	if (!isNil {missionNamespace getVariable ["respawnTruck",nil]}) then
	{
		player moveInCargo (missionNamespace getVariable "respawnTruck");
	};
};
