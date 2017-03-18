//More info:
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject

//Add main diary subject
player createDiarySubject ["Diary", "Diary"];

_teamSuffix = if (side player == west) then { "Blu.txt"; } else { "Red.txt"; };

_intel = "Intel"+_teamSuffix;
_mission = "Mission"+_teamSuffix;
_situation = "Situation"+_teamSuffix;

_truckStart = ( (missionNamespace getVariable "trucks_start") / 60);
_uavEnd = ( (missionNamespace getVariable "uav_end") / 60);

//Add new diary pages with ARTR_fnc_briefingFile.
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
["Diary", "Intel", _intel,[_truckStart,_uavEnd]] call ARTR_fnc_briefingFile;
["Diary", "Mission",_mission,[_truckStart]] call ARTR_fnc_briefingFile;
["Diary", "Situation", _situation,[_truckStart]] call ARTR_fnc_briefingFile;
["Diary", "Background", "Background.txt"] call ARTR_fnc_briefingFile;

//Add diary subject and entries for gameplay logic
player createDiarySubject ["Info", "SCENARIO INFO"];

_extraUAVInfo = "";
if (missionNamespace getVariable ["extendedUAV",false]) then
{
	if (playersNumber east > 1) then
	{
		_extraUAVInfo = "The Extended UAV Info parameter was set: ";
	} else {
		_extraUAVInfo = "Since there is only one infiltrator, Extended UAV Info is on: ";
	};

	_extraUAVInfo = _extraUAVInfo + "The UAV has additional graphical information to mark tracked defender locations. It tracks visible defenders and marks both their locations and the locations where it lost vision on hidden defenders.";
};

["Info", "Mission Mechanics", "Mechanics.txt",[_truckStart,_uavEnd,_extraUAVInfo]] call ARTR_fnc_briefingFile;
if (addonTFAR) then
{
	["Info", "TFAR Hearing", "TFARHearing.txt"] call ARTR_fnc_briefingFile;
};
