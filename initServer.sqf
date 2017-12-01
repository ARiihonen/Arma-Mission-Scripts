/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//Add tasks to all groups
[group_balavu, "tsk_balavu", ["Remove all evidence from the area, eliminate all gendarmerie who might have seen it, and make sure they aren't carrying any on their persons.", "Eradicate Evidence", ""], "mrk_balavu", true, 1, false, "target", false] call BIS_fnc_taskCreate;

[group_lijnhaven, "tsk_lijnhaven", ["Remove all evidence from the area, eliminate all gendarmerie who might have seen it, and make sure they aren't carrying any on their persons.", "Eradicate Evidence", ""], "mrk_lijnhaven", true, 1, false, "target", false] call BIS_fnc_taskCreate;

[group_roadhouse, "tsk_roadhouse", ["Remove all evidence from the area, eliminate all gendarmerie who might have seen it, and make sure they aren't carrying any on their persons.", "Eradicate Evidence", ""], "mrk_roadhouse", true, 1, false, "target", false] call BIS_fnc_taskCreate;

[group_bluepearl, "tsk_bluepearl", ["Remove all evidence from the area, eliminate all gendarmerie who might have seen it, and make sure they aren't carrying any on their persons.", "Eradicate Evidence", ""], "mrk_roadhouse", true, 1, false, "target", false] call BIS_fnc_taskCreate;


//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable ["ARTR_serverInit", true, true];
