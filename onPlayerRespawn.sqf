//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
waitUntil {!isNull player};

call ARTR_fnc_irregularGearSets;

[player, "scrubGuerrillas"] call ARTR_fnc_setIrregularClothes;
[player] call ARTR_fnc_modGear;

//Handle starting position
private _position = [0,0,0];
private _groupID = groupID (group player);
private _markerPostfix = toLower (groupID (group player));

if ((missionNamespace getVariable ["startMarker" + groupID (group player), ""]) != "" ) then
{
    _position = markerPos (missionNamespace getVariable ("startMarker" + groupID (group player)));
};

if (_position isEqualTo [0,0,0]) then
{
    hint "Starting position undefined. Starting at default position.";
    _position = getMarkerPos ("mrk_defaultStart_" + _markerPostfix);

    ("mrk_defaultStart_" + _markerPostfix) setMarkerAlphaLocal 1;
    ("mrk_defaultStart_" + _markerPostfix) setMarkerTypeLocal "mil_start";
    ("mrk_defaultStart_" + _markerPostfix) setMarkerColorLocal "ColorGUER";
    ("mrk_defaultStart_" + _markerPostfix) setMarkerTextLocal "Default start position";
    ("mrk_defaultStart_" + _markerPostfix) setMarkerDirLocal (_position getDir (markerPos ("mrk_" + _markerPostfix)));
};

//Offset position by group number
_num = 0;
{
	if (player == _x) then {
		_num = _forEachIndex;
	};
} forEach (units group player);
_position = ( [ (_position select 0) + (2.5*_num), _position select 1, 0] );

//Get direction to target buildings
_dirToTarget = _position getDir (markerPos ("mrk_" + _markerPostfix));

//Place player on position
if ( !(_position isEqualTo getMarkerPos ("mrk_defaultStart_" + _markerPostfix)) ) then {
	player setPos _position;
	player setDir _dirToTarget;
};

//Remove global/team/command comms
0 enableChannel false;
1 enableChannel false;
2 enableChannel false;