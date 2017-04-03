if (!canMove cargoHelo) then
{
	private _heloType = typeOf cargoHelo;
	private _pos = markerPos "mrk_cargoRes";
	private _dir = markerDir "mrk_cargoRes";

	cargoHelo = _heloType createVehicle _pos;
	cargoHelo setDir _dir;
	cargoHelo setPos _pos;
};

if (!canMove littleBird) then
{
	private _heloType = typeOf littleBird;
	private _pos = markerPos "mrk_littleRes";
	private _dir = markerDir "mrk_littleRes";

	littleBird = _heloType createVehicle _pos;
	littleBird setDir _dir;
	littleBird setPos _pos;
};

{
	[_x,1,true] call BIS_fnc_respawnTickets;
} forEach (allPlayers select { !alive _x && _x getVariable ["Pilot",false] });
