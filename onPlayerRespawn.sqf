//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
call ARTR_fnc_playerGearByMod;

//teleport player to leader if he did JIP
if (didJIP) then {
	if (!(isNull objectParent (leader group player))) then {
		player moveInCargo (vehicle leader group player);
	} else {
		_pos = getPos (leader group player);
		_pos set [0, _pos select 0 + 2];
		_pos set [1, _pos select 1 + 2];
		player setPos _pos;
	};
};
