//this bit is for all AI scripts you want to run at mission start. Maybe you want to spawn in dudes or something.

//set ai gear
{
	if (!isPlayer _x) then {
		_x execVM "ai\gear.sqf";
	};
} forEach allUnits;

//set ai skills
_thing = execVM "ai\skills.sqf";

waitUntil { scriptDone _thing };
[(allUnits - playableUnits)] call ai_setSkills;