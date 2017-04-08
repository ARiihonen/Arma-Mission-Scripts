titleText ["", "BLACK FADED", 60];

private _permission_name = format ["respawn_permission_%1", side player];
if (missionNamespace getVariable [_permission_name, false] || time < 10) then {

	if ( [player, 0] call BIS_fnc_respawnTickets == -1 ) then {
		[player, 1] call BIS_fnc_respawnTickets;
		[player, -1] call BIS_fnc_respawnTickets;
	};

	[player] call ARTR_fnc_modGear;

	//Light effects
	player remoteExecCall ["ARTR_fnc_playerLightInit",0,true];

	//Disable fatigue, add infinite ammo
	player enableFatigue false;
	player addEventHandler ["Take", { _this call ARTR_fnc_infiniteAmmo; } ];

	call ARTR_fnc_setPlayerPosition;
} else {
	player setPos [-15+(random 30),-15+(random 30),2];
	player setDamage 1;
};

titleText ["", "BLACK IN", 0.5];
