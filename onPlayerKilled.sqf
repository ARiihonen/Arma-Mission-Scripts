params ["_player","_killer"];

private _var = "last_pos_" + str(side player);

missionNamespace setVariable [_var, getPosWorld _player, true];
player setVariable ["hades",false];
