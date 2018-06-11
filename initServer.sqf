/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//set weather
0 setFog [0.5, 0.2, 12];
(1.5*60*60) setFog [0,0,0];

//set Overwatch name if MNP then Ukko else Overwatch
if ( "mnp_" call ARTR_fnc_checkMod ) then {
	(group ukko) setGroupIDGlobal ["Ukko"];
} else {
	(group ukko) setGroupIDGlobal ["Overwatch"];
};

//Give first clear task
[west, "ClearTask", ["Clear the island of any remaining guerrillas", "Clear Island", "Clear"], "marker_island", "assigned", 1, false, "attack", false] call BIS_fnc_taskCreate;

//Call server ending if all players are dead
trigger_dead = ["{ alive _x } count playableUnits <= 0", "call ARTR_fnc_serverEnding;"] call ARTR_fnc_emptyTrigger;
trigger_dead setTriggerTimeout [5, 5, 5, true];

//Create trigger to advance phase when island cleared
trigger_island = [
	"( { triggerActivated _x } count [ trigger_islandCleared, trigger_islandSouth_1, trigger_islandSouth_2, trigger_islandSouth_3, trigger_islandNorth_1, trigger_islandNorth_2, trigger_islandNorth_3] >= 7) && (missionNamespace getVariable ['mission_phase',0] == 0)",
	"[1] call ARTR_fnc_advancePhase;"
] call ARTR_fnc_emptyTrigger;
trigger_island setTriggerTimeout [10, 15, 20, false];

//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
missionNamespace setVariable["ARTR_serverInit", true, true];
