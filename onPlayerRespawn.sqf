//Runs on the client after server has initialised
waitUntil { missionNamespace getVariable["ARTR_serverInit", false] };

//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
if (!(player in (missionNamespace getVariable "authorizedPlayers"))) then {
	player setPos [0,0,0];
	player setDamage 1;
};

if (!alive player) then {
	["Initialize", [player, allGroups select {isPlayer (leader _x)}, true]] call BIS_fnc_EGSpectator;
};
