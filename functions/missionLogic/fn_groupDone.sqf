//Runs when a player's group is done with their task and can just hang out and spectate the other teams

//Sit the player down for fun
player action ["sitDown", player];

//Start spectator
[
    "Initialize",
    [
        player
    ]
] call BIS_fnc_EGSpectator;