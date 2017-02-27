//More info:
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject

//Add main diary subject
player createDiarySubject ["Diary", "Diary"];

_teamSuffix = if (side player == west) then { "Blu.txt"; } else { "Red.txt"; };

_signal = "";
if ( addonTFAR ) then { _signal = "SignalTFAR.txt"; };
if ( addonACRE ) then { _signal = "SignalACRE.txt"; };

_signal = _signal+_teamSuffix;
_intel = "Intel"+_teamSuffix;
_mission = "Mission"+_teamSuffix;
_situation = "Situation"+_teamSuffix;
_background = "Background"+_teamSuffix;

//Add new diary pages with ARTR_fnc_briefingFile.
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
if ( addonTFAR || addonACRE ) then { ["Diary", "Signal", _signal] call ARTR_fnc_briefingFile; };
["Diary", "Intel", _intel] call ARTR_fnc_briefingFile;
["Diary", "Mission", _mission] call ARTR_fnc_briefingFile;
["Diary", "Situation", _situation] call ARTR_fnc_briefingFile;
["Diary", "Background", _background] call ARTR_fnc_briefingFile;

//Add diary subject and entries for gameplay logic
player createDiarySubject ["Info", "Scenario Info"];
["Info", "Mission Mechanics", "Mechanics.txt"] call ARTR_fnc_briefingFile;
if (addonTFAR) then
{
	["Info", "Setup logic", "TFARHearing.txt"] call ARTR_fnc_briefingFile;
};
