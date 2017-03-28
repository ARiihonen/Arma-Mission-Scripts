missionNamespace setVariable ["ARTR_serverEnding", true, true];

//calculate which ending to show here, then remoteExec the ending on all clients
_boxes_tagged = { alive _x && _x getVariable ["tracked", false] } count boxes;
_boxes_destroyed = { !alive _x } count boxes;
_boxes_compromised = _boxes_tagged + _boxes_destroyed;
_boxes_fine = count boxes - _boxes_compromised;

_dead_infiltrators = { _x getVariable "ARTR_trueSide" == east && (!alive _x || _x getVariable ["ACE_isUnconscious", false]) } count allUnits;
_dead_defenders = missionNamespace getVariable ["murdered_defenders", 0];

_search = if (_boxes_destroyed * 2 < _dead_defenders) then { true; } else { false; };
if ( { side _x == west } count playableUnits == 0) then {
	_search = true;
};

diag_log format ["boxes tagged: %1, destroyed: %2, compromised: %3; dead infiltrators: %4, defenders: %5, search: %6", _boxes_tagged, _boxes_destroyed, _boxes_compromised, _dead_infiltrators, _dead_defenders, _search];

_score_blu = (_dead_infiltrators*50) - ( _boxes_compromised/(count boxes)*100 ) - ( _dead_defenders/({ side _x == west } count allPlayers) * 100 );
_score_blu = round(_score_blu);

_score_red = ( _boxes_tagged/(count boxes)*100 ) - (_dead_infiltrators*50) - ( _dead_defenders/({ side _x == west } count allPlayers) * 100 );
if (!canMove insertion) then { _score_red = _score_red - 50; };
_score_red = round(_score_red);

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

_endText = "SUPPLY BOX STATUS <br />Fine: " + str(_boxes_fine) + " Tagged: " + str(_boxes_tagged) + " Destroyed: " + str(_boxes_destroyed) + "<br /><br />PLAYER STATUS <br />Infiltrators killed: " + str(_dead_infiltrators) + " Defenders killed: " + str(_dead_defenders) + "<br /><br />SCORING <br />Infiltrators: " + str(_score_red) + "<br />Defenders: " + str(_score_blu);

missionNamespace setVariable ["ARTR_endStats",_endText,true];

_end_blu = if (_boxes_compromised < ((count boxes)/2)) then { "BlueVictory"; } else { "BlueLoss"; };
if (_boxes_compromised == 0) then { _end_blu = "BlueVictoryAll"; };

_end_red = if (!_search && _boxes_tagged >= ((count boxes)/2)) then { "RedVictory"; } else { if (_search) then { "RedLossSearch"; } else { "RedLossAmount" }; };
if (_boxes_tagged == count boxes) then { _end_red = "RedVictoryTotal"; };

if ( _end_blu find "Victory" >= 0 ) then {
	["ProtectTask", "SUCCEEDED", false] call BIS_fnc_taskSetState;
} else {
	["ProtectTask", "FAILED", false] call BIS_fnc_taskSetState;
};

if ( _end_red find "Victory" >= 0 ) then {
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

[_end_blu] remoteExecCall ["ARTR_fnc_clientEnding", west, true];
[_end_red] remoteExecCall ["ARTR_fnc_clientEnding", east, true];
