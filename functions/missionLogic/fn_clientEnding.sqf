_ending = _this select 0;

//Separate ending conditions:

/*Different endings are set up in Description.ext in the cfgDebriefing class,
syntax for BIS_fnc_endMission is ["endingName", isVictory, fancyVisuals],
where endingName is the ending's class name,
isVictory a boolean value denoting if the ending was a victory or not,
and fancyVisuals a boolean that says whether to go straight to the
debriefing or to use the cool new ingame ending graphic*/

if (alive player) then {

	switch _ending do {
		case "Win": {
			["Win", true, true] call BIS_fnc_endMission;
		};

		default {
			["Lose", false, true] call BIS_fnc_endMission;
		};
	};

} else {
	["Dead", false, true] call BIS_fnc_endMission;
};
