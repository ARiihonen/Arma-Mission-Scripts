//calculate which ending to show here, then remoteExec the ending on all clients
_boxes_tagged = { alive _x && _x getVariable ["tracked", false] } count boxes;
_boxes_destroyed = { !alive _x } count boxes;
_boxes_compromised = _boxes_tagged + _boxes_destroyed;

_dead_infiltrators = { side (group _x) == east && !alive _x } count allUnits;
_dead_defenders = missionNamespace getVariable ["murdered_defenders", 0];

_search = if (_boxes_destroyed * 2 < _dead_defenders) then { true; } else { false; };
if ( { side _x == west } count playableUnits == 0) then {
	_search = true;
};

diag_log format ["boxes tagged: %1, destroyed: %2, compromised: %3; dead infiltrators: %4, defenders: %5, search: %6", _boxes_tagged, _boxes_destroyed, _boxes_compromised, _dead_infiltrators, _dead_defenders, _search];

_score_blu = (_dead_infiltrators*50) - ( _boxes_compromised/(count boxes)*100 ) - ( _dead_defenders/( _dead_defenders + ({ side _x == west } count playableUnits) ) * 100 );

_score_red = ( _boxes_tagged/(count boxes)*100 ) - (_dead_infiltrators*50) - ( _dead_defenders/( _dead_defenders + ({ side _x == west } count playableUnits) ) * 100 );
if (!canMove insertion) then { _score_red = _score_red - 50; };

{
	_points = rating _x;
	_x addRating (_points*-1);
} forEach playableUnits;

{
	switch (side group _x) do {
		case west: { _x addRating _score_red; };
		case east: { _x addRating _score_blu; };
	};
} forEach allUnits;

_end_blu = if (_boxes_compromised < (boxes/2)) then { "BlueVictory"; } else { "BlueLoss"; };
if (_boxes_compromised == 0) then { _end_blu = "BlueVictoryAll"; };

_end_red = if (!_search && _boxes_tagged >= (boxes/2)) then { "RedVictory"; } else { if (_search) then { "RedLossSearch"; } else { "RedLossAmount" }; };
if (_boxes_tagged == count boxes) then { _end_red = "RedVictoryTotal"; };

if ( ["Victory", _end_blu] call BIS_fnc_inString ) then {
	["ProtectTask", "SUCCEEDED", false] call BIS_fnc_taskSetState;
} else {
	["ProtectTask", "FAILED", false] call BIS_fnc_taskSetState;
};

if ( ["Victory", _end_red] call BIS_fnc_inString ) then {
	["InfiltrateTask", "SUCCEEDED", false] call BIS_fnc_taskSetState;
} else {
	["InfiltrateTask", "FAILED", false] call BIS_fnc_taskSetState;
};

{
	if (alive _x) then {
		["ExfilTask", "SUCCEEDED", false] call BIS_fnc_taskSetState;
	} else {
		["ExfilTask", "FAILED", false] call BIS_fnc_taskSetState;
	};
} forEach (allUnits select { side _x == east } );

_end_blu remoteExecCall ["ARTR_fnc_clientEnding", west, true];
_end_red remoteExecCall ["ARTR_fnc_clientEnding", east, true];
