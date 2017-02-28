if (time > 1*60 && alive player) then {
	player setPos [0,0,0];
	player setDamage 1;
};

if (!alive player) then {
	["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
};
