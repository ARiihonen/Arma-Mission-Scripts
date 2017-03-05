//More info:
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject

//Add main diary subject
player createDiarySubject ["Diary", "Diary"];

private _signal = "";
if ( addonTFAR ) then { _signal = "SignalTFAR.txt"; };
if ( addonACRE ) then { _signal = "SignalACRE.txt"; };

//Add new diary pages with ARTR_fnc_briefingFile.
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
if ( addonTFAR || addonACRE ) then { ["Diary", "Signal", _signal] call ARTR_fnc_briefingFile; };
private _intel = ["Diary", "Intel", "Intel.txt"] call ARTR_fnc_briefingFile;
private _mission = ["Diary", "Mission", "Mission.txt"] call ARTR_fnc_briefingFile;
private _situation = ["Diary", "Situation", "Situation.txt"] call ARTR_fnc_briefingFile;
private _background = ["Diary", "Background", "Background.txt"] call ARTR_fnc_briefingFile;

if (addonTFAR) then
{
	//Add diary subject and entries for gameplay logic
	player createDiarySubject ["Info", "Scenario Info"];
	private _TFARHearing = ["Info", "Setup logic", "TFARHearing.txt"] call ARTR_fnc_briefingFile;
};
