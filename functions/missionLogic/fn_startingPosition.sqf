//Handle starting position
_position = [0,0,0];
_groupID = groupID (group player);

//build list of markers within applicable zone with "start" present:
_infil_markers = [];
{
	if ( ["start", markerText _x] call BIS_fnc_inString ) then {
		if ( (getMarkerPos _x) inArea "mrk_spawnOuter" && !( (getMarkerPos _x) inArea "mrk_spawnInner") ) then {
			_infil_markers set [count _infil_markers, _x];
		};
	};
} forEach allMapMarkers;

//If group name present in some infil marker, choose it:
_group_markers = [];
{
	if ( [_groupID, markerText _x] call BIS_fnc_inString ) then {
		_group_markers set [count _group_markers, _x];
	};
} forEach _infil_markers;

//If there are infil markers and group markers, select group marker. If no group markers, select infil marker. If neither, select default position.
_text = "";
if (count _infil_markers > 0) then {

	if ( count _group_markers > 0) then {
		_position = getMarkerPos (_group_markers select 0);
		(_group_markers select 0) setMarkerTypeLocal "mil_start";
		(_group_markers select 0) setMarkerColorLocal "ColorWEST";
		(_group_markers select 0) setMarkerDirLocal (_position getDir (markerPos "mrk_buildings"));

		if (count _group_markers > 1) then {
			_text = "Multiple markers with group ID and 'start' found. Selecting first.";
		};

	} else {
		_position = getMarkerPos (_infil_markers select 0);
		(_infil_markers select 0) setMarkerTypeLocal "mil_start";
		(_infil_markers select 0) setMarkerColorLocal "ColorWEST";
		(_infil_markers select 0) setMarkerDirLocal (_position getDir (markerPos "mrk_buildings"));

		if (count _infil_markers > 1) then {
			_text = "Multiple markers with 'start' found. Selecting first.";
		};
	};

} else {
	_text = "No applicable markers found. Selecting default starting position.";
	_position = getMarkerPos "respawn_guerrila";

	"respawn_guerrila" setMarkerTypeLocal "mil_start";
	"respawn_guerrila" setMarkerColor "ColorWEST";
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

hint _text;

/*
//Fade back
titleText ["", "BLACK IN", 5];
if (_text != "") then {
	hint _text;
};
*/
