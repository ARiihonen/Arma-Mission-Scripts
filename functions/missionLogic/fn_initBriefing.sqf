//More info:
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject

//Add main diary subject
player createDiarySubject ["Diary", "Diary"];

_signal = "";
if ( addonTFAR ) then { _signal = "SignalTFAR.txt"; };
if ( addonACRE ) then { _signal = "SignalACRE.txt"; };

_nationality = if ("MNP_MIXR_Config" call ARTR_fnc_checkMod) then
{
	"Finnish-Estonian Jaeger Company";
} else {
	"Infantry Company";
};

//Add new diary pages with ARTR_fnc_briefingFile.
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
if ( addonTFAR || addonACRE ) then { ["Diary", "Signal", _signal] call ARTR_fnc_briefingFile; };
["Diary", "Intel", "Intel.txt"] call ARTR_fnc_briefingFile;
["Diary", "Mission", "Mission.txt"] call ARTR_fnc_briefingFile;
["Diary", "Situation", "Situation.txt",[_nationality]] call ARTR_fnc_briefingFile;
["Diary", "Background", "Background.txt"] call ARTR_fnc_briefingFile;

//Add diary subject and entries for gameplay logic
player createDiarySubject ["Info", "SCENARIO INFO"];
["Info","Report cleared", "Clearing.txt"] call ARTR_fnc_briefingFile;
if (addonTFAR) then
{
	["Info", "Setup logic", "TFARHearing.txt"] call ARTR_fnc_briefingFile;
};
