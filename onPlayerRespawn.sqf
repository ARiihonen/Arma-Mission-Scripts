//Runs on the client after server has initialised
waitUntil { missionNamespace getVariable["ARTR_serverInit", false] };

//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
if (!(player in (missionNamespace getVariable "authorizedPlayers"))) then {
	player setPos [0,0,0];
	player setDamage 1;
};

if (!alive player) then {
	["Initialize", [player, allGroups select {isPlayer (leader _x)}, true]] call BIS_fnc_EGSpectator;
};

switch (side player) do
{
	case east: {
		//Starting position marker
		_mark = createMarkerLocal ["start", getMarkerPos "redStart"];
		_mark setMarkerShapeLocal "ICON";
		_mark setMarkerTypeLocal "mil_start";
		_mark setMarkerColorLocal "colorBlue";

		//create camera
		call ARTR_fnc_initUAV;

		//trigger to set a marker to SDV position when disembarking
		tr_SDVPlaced = [
			"count crew insertion <= 0",
			"call ARTR_fnc_infilMarker;",
			""
		] call ARTR_fnc_emptyTrigger;

		player setVariable ["ARTR_profileName", profileName, true];
	};

	case west: {
		//Add EHs to handle defenders being killed by infiltrators
		player addEventHandler ["Hit", "_this call ARTR_fnc_defenderHit;"];
		player addEventHandler ["Killed", "_this call ARTR_fnc_defenderKilled;"];
	};
};

waitUntil { time > 0 };

[player] call ARTR_fnc_modGear;

player setVariable ["ARTR_trueSide", playerSide];
