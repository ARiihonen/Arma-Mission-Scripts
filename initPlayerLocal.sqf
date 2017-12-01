//Adding hold-actions to destroy evidence
private _evidence = [];
private _targets = [];

switch (groupID (group player)) do
{
    case "Balavu": { _evidence = evidenceBalavu; };
    case "Lijnhaven": { _evidence = evidenceLijnhaven; };
    case "Bluepearl": { _evidence = evidenceBluepearl; };
    case "Roadhouse": { _evidence = evidenceRoadhouse; };
};

{
    [
        _x,
        "Destroy evidence",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
        "_target distance _this < 1.5",
        "_target distance _this < 1.5",
        {},
        {},
        {
            _target = param [0];

            _target setVariable ["evidenceDestroyed", true, true];
            if (typeOf _target == "Land_File1_F") then { _target setPos [0,0,0]; };

            ["EvidenceDestroyed",[]] call BIS_fnc_showNotification;
        },
        {},
        [],
        10,
        10,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
} forEach _evidence;

//Reveal the correct markers
private _suffix = toLower (groupID (group player));
{
    (_x + _suffix) setMarkerAlphaLocal 1;
} forEach [
    "mrk_spawnInner_",
    "mrk_spawnOuter_",
    "mrk_obj01_",
    "mrk_obj02_",
    "mrk_obj03_"
];

//Starting position logic
startingPosEH = addMissionEventHandler [
    "mapSingleClick",
    {
        params ["_units", "_pos", "_alt", "_shift"];

        private _markerPostfix = toLower (groupID (group player));
        diag_log format ["%1", _markerPostFix];

        if (time > 0 || player != leader group player) then
        {
            removeMissionEventHandler ["mapSingleClick", startingPosEH];
        } else {

            if (_alt && !(surfaceIsWater _pos) && (_pos inArea ("mrk_spawnOuter_" + _markerPostfix)) && !(_pos inArea ("mrk_spawnInner_" + _markerPostfix) )) then
            {
                if ((missionNamespace getVariable ["startMarker" + groupID (group player), ""]) == "" ) then
                {
                    _startMarker = createMarker ["startPos"+groupID (group player), _pos];
                    _startMarker setMarkerShape "ICON";
                    _startMarker setMarkerType "mil_start";
                    _startMarker setMarkerColor "colorGUER";
                    _startMarker setMarkerText (groupID (group player) + " setup");
                    _startMarker setMarkerDir ( [_pos, markerPos ("mrk_" + _markerPostfix)] call BIS_fnc_dirTo);

                    missionNamespace setVariable ["startMarker" + groupID (group player), _startMarker, true];

                } else {

                    _startMarker = missionNamespace getVariable ("startMarker" + groupID (group player));
                    _startMarker setMarkerPos _pos;
                    _startMarker setMarkerDir ( [_pos, markerPos ("mrk_" + _markerPostfix)] call BIS_fnc_dirTo);
                };
            };
        };
    }
];