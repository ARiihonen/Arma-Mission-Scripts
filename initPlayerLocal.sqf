if ( !isNil "headlessClient" && { player == headlessClient} ) then
{
	waitUntil { missionNamespace getVariable ["ARTR_HCSET", false] };
	call ARTR_fnc_initIndoorsBehaviour;
};

startingPosEH = addMissionEventHandler [
    "mapSingleClick",
    {
        diag_log format ["%1", _this];

        params ["_units", "_pos", "_alt", "_shift"];

        if (time > 0 || player != leader group player) then
        {
            removeMissionEventHandler ["mapSingleClick", startingPosEH];
        } else {

            if (_alt && _shift && (_pos inArea "mrk_spawnOuter") && !(_pos inArea "mrk_spawnInner")) then
            {
                if ((missionNamespace getVariable ["startMarker" + groupID (group player), ""]) == "" ) then
                {
                    _startMarker = createMarker ["startPos"+groupID (group player), _pos];
                    _startMarker setMarkerShape "ICON";
                    _startMarker setMarkerType "mil_start";
                    _startMarker setMarkerColor "colorGUER";
                    _startMarker setMarkerText (groupID (group player) + " setup");
                    _startMarker setMarkerDir ( [_pos, markerPos "mrk_buildings"] call BIS_fnc_dirTo);

                    missionNamespace setVariable ["startMarker" + groupID (group player), _startMarker, true];

                } else {

                    _startMarker = missionNamespace getVariable ("startMarker" + groupID (group player));
                    _startMarker setMarkerPos _pos;
                    _startMarker setMarkerDir ( [_pos, markerPos "mrk_buildings"] call BIS_fnc_dirTo);
                };
            };
        };
    }
];