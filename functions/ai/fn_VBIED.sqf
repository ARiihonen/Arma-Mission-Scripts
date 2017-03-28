params ["_vehicle"];

if (_vehicle getVariable ["canStillGoBoom", true]) then
{
		_vehicle setVariable ["canStillGoBoom", false, false];
	private _explosion = selectRandom ["R_80mm_HE", "Bo_GBU12_LGB"];
	createVehicle [_explosion, getPos _vehicle, [], 0, "NONE"];
};
