//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
call ARTR_fnc_startingPosition;
[player] call ARTR_fnc_modGear;
call ARTR_fnc_nvGoggles;

if ("ace_medical" call ARTR_fnc_checkMod) then { call ARTR_fnc_aceDeath; };