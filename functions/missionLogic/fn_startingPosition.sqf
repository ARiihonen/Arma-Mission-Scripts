//Handle starting position
_position = [0,0,0];
_groupID = groupID (group player);


if ((missionNamespace getVariable ["startMarker" + groupID (group player), ""]) != "" ) then
{
    _position = markerPos (missionNamespace getVariable ("startMarker" + groupID (group player)));

} else {
    _alternateMarker = "startMarker" + (["Alpha", "Bravo"] select (groupID (group player) == "Alpha"));
    if ((missionNamespace getVariable [_alternateMarker, ""]) != "" ) then
    {
        _position = markerPos (missionNamespace getVariable "_alternateMarker");
    };
};

if (_position isEqualTo [0,0,0]) then
{
    hint "Starting position undefined. Starting at default position.";
    _position = getMarkerPos "respawn_guerrila";

    "respawn_guerrila" setMarkerTypeLocal "mil_start";
    "respawn_guerrila" setMarkerColor "ColorGUER";
    "respawn_guerrila" setMarkerText "Default start position";
    "respawn_guerrila" setMarkerDir (_position getDir (markerPos "mrk_buildings"));
};

//Offset position if group bravo
if (_groupID == "Bravo") then {
	_position = ( [ (_position select 0) + 10, (_position select 1) + 2.5, 0] );
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
_dirToTarget = _position getDir (markerPos "mrk_buildings");

//Place player on position
if ( !(_position isEqualTo getMarkerPos "respawn_guerrila") ) then {
	player setPos _position;
	player setDir _dirToTarget;
};