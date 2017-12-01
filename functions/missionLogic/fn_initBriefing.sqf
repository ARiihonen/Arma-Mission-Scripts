//More info:
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject

private _missionTarget = "";
private _locationName = "";
switch (groupID (group player)) do
{
    case "Balavu": { _missionTarget = "in <marker name = 'mrk_balavu'>the town of Balavu</marker>"; _locationName = "balavu"; };
    case "Lijnhaven": { _missionTarget = "in <marker name = 'mrk_lijnhaven'>central Lijnhaven</marker>"; _locationName = "lijnhaven"; };
    case "Bluepearl": { _missionTarget = "on <marker name = 'mrk_bluepearl'>the outskirts of Blue Pearl</marker>"; _locationName = "bluepearl"; };
    case "Roadhouse": { _missionTarget = "at <marker name = 'mrk_roadhouse'>the Roadhouse</marker>"; _locationName = "roadhouse"; };
};

//Add main diary subject
player createDiarySubject ["Diary", "Diary"];

//Add new diary pages with ARTR_fnc_briefingFile.
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
["Diary", "Signal", "SignalTFAR.txt"] call ARTR_fnc_briefingFile;
["Diary", "Intel", "Intel.txt",[_locationName]] call ARTR_fnc_briefingFile;
["Diary", "Mission", "Mission.txt",[_missionTarget]] call ARTR_fnc_briefingFile;
["Diary", "Situation", "Situation.txt"] call ARTR_fnc_briefingFile;

//Add diary subject and entries for gameplay logic
player createDiarySubject ["Info", "MISSION MECHANICS"];

["Info", "Reinforcement logic", "Reinforcements.txt"] call ARTR_fnc_briefingFile;
["Info", "Setup logic", "Setup.txt", [_locationName]] call ARTR_fnc_briefingFile;
["Info", "Evidence logic", "Evidence.txt"] call ARTR_fnc_briefingFile;