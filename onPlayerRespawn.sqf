//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
[player] call ARTR_fnc_modGear;

//teleport player to leader if he did JIP
if (didJIP) then {
	if (!(isNull objectParent (leader group player))) then {
		player moveInCargo (vehicle leader group player);
	} else {
		_pos = getPos (leader group player);
		_newPos = _pos vectorAdd [2,2,0];
		player setPos _pos;
	};
};

call ARTR_fnc_deathTimer;
