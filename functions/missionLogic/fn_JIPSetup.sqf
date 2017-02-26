/*
Sets respawn tickets to 0 to initialise Join In Progress with no respawn.
*/

if (isServer) then {
	[missionNamespace, 1] call BIS_fnc_respawnTickets;
	[missionNamespace, -1] call BIS_fnc_respawnTickets;
};
