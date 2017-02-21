//More info:
//https://community.bistudio.com/wiki/createDiaryRecord
//https://community.bistudio.com/wiki/createDiarySubject

//Add main diary subject
player createDiarySubject ["Diary", "Diary"];

_signal = "";
if ( addonTFAR ) then { _signal = "SignalTFAR.txt"; };
if ( addonACRE ) then { _signal = "SignalACRE.txt"; };

_buildingText = if (count buildings > 1) then
{
	"two <marker name = 'mrk_buildingOne'>large</marker> <marker name = 'mrk_buildingTwo'>buildings</marker>";
} else {
	if (1 in buildings) then {
		"<marker name = 'mrk_buildingOne'>one large building</marker>";
	} else {
		"<marker name = 'mrk_buildingTwo'>one large building</marker>";
	};
};

_enemySquadsText = str( [({ side _x == west } count allUnits) / 8, 0] call BIS_fnc_cutDecimals );

_wirecutterText = "";
if ("ace_logistics_wirecutter" call ARTR_fnc_checkMod) then { _wireCutterText = " Your team is also equipped with wire cutters to make your own entrance if you prefer." };

//Add new diary pages with ARTR_fnc_briefingFile.
//If including variables, add them as a list to the end of the parameters list: ["ExampleSubject", "ExampleName", "ExampleFile", [ExampleParams]]
if ( addonTFAR || addonACRE ) then { ["Diary", "Signal", _signal] call ARTR_fnc_briefingFile; };
_intel = ["Diary", "Intel", "Intel.txt",[_buildingText,_enemySquadsText,_wireCutterText]] call ARTR_fnc_briefingFile;
_mission = ["Diary", "Mission", "Mission.txt"] call ARTR_fnc_briefingFile;
_situation = ["Diary", "Situation", "Situation.txt"] call ARTR_fnc_briefingFile;
_background = ["Diary", "Background", "Background.txt"] call ARTR_fnc_briefingFile;

//Add diary subject and entries for gameplay logic not in-universe
player createDiarySubject ["Info", "Scenario Info"];
_startPos = ["Info", "Setup logic", "StartPosition.txt"] call ARTR_fnc_briefingFile;
