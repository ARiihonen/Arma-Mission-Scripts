//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
if (time > 1*60 && alive player) then {
	player setPos [0,0,0];
	player setDamage 1;
};

if (!alive player) then {
	["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
};
