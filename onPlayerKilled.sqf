private _var = ["last_pos_west","last_pos_guer"] select (side player == resistance);

missionNamespace setVariable [_var, getPos (_this select 0), true];
player setVariable ["hades",false];
