//More info: 
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject
#include "functions.sqf";
#include "..\logic\activeMods.sqf";

//Adds briefing file
player createDiarySubject ["Diary", "Diary"];

_signal = if ( "task_force_radio" call caran_checkMod ) then { "SignalTFAR.txt"; } else {""; };
if ( "acre_" call caran_checkMod ) then { _signal = "SignalACRE.txt"; };

//Add new diary pages with caran_briefingFile. 
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
if ( "task_force_radio" call caran_checkMod || "acre_" call caran_checkMod ) then {
	["Diary", "Signal", _signal] call caran_briefingFile;
};
_intel = ["Diary", "Intel", "Intel.txt"] call caran_briefingFile;
_mission = ["Diary", "Mission", "Mission.txt"] call caran_briefingFile;
_situation = ["Diary", "Situation", "Situation.txt"] call caran_briefingFile;