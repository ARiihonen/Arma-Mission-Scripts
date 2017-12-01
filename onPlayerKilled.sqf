params ["_oldUnit", "_killer", "_respawn", "respawnDelay"];

//Terminate possible already started default spectator, restart with good parameters
["Terminate"] call BIS_fnc_EGSpectator;
[
    "Initialize",
    [resistance],
    false
] call BIS_fnc_EGSpectator;