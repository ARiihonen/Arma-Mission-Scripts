params ["_oldVehicle","_newVehicle","_name"];

private _dir = getDir _oldVehicle;
private _pos = getPosWorld _oldVehicle;
_pos set [2,0];

deleteVehicle _oldVehicle;

call compile format ["%1 = _newVehicle createVehicle _pos;", _name];
call compile format ["%1 setDir _dir;", _name];
call compile format ["%1 setPos _pos;", _name];
