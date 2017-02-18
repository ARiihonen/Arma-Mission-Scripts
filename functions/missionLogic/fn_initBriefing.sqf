//More info:
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject

//Add main diary subject
player createDiarySubject ["Diary", "Diary"];

_signal = "";
if ( addonTFAR ) then {	_signal = "SignalTFAR.txt"; };
if ( addonACRE ) then { _signal = "SignalACRE.txt"; };

//Add new diary pages with ARTR_fnc_briefingFile.
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
if ( addonTFAR || addonACRE ) then { ["Diary", "Signal", _signal] call ARTR_fnc_briefingFile; };
_intel = ["Diary", "Intel", "Intel.txt"] call ARTR_fnc_briefingFile;
_mission = ["Diary", "Mission", "Mission.txt"] call ARTR_fnc_briefingFile;
_situation = ["Diary", "Situation", "Situation.txt"] call ARTR_fnc_briefingFile;
_background = ["Diary", "Background", "Background.txt"] call ARTR_fnc_briefingFile;
