//calculate which ending to show here, then remoteExec the ending on all clients
_boxes_tagged = { alive _x && _x getVariable ["tracked", false] } count boxes;
_boxes_destroyed = { !alive _x } count boxes;
_boxes_compromised = _boxes_tagged + _boxes_destroyed;
_boxes_fine = count boxes - _boxes_compromised;

_dead_infiltrators = { side (group _x) == east && !alive _x } count allUnits;
_dead_defenders = missionNamespace getVariable ["murdered_defenders", 0];

missionNamespace setVariable ["ARTR_boxesFine",str(_boxes_fine),true];
missionNamespace setVariable ["ARTR_boxesDead",str(_boxes_destroyed),true];
missionNamespace setVariable ["ARTR_boxesTagged",str(_boxes_tagged),true];
missionNamespace setVariable ["ARTR_deadDefenders",str(_dead_defenders),true];
missionNamespace setVariable ["ARTR_deadInfiltrators",str(_dead_infiltrators),true];

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

missionNamespace setVariable ["ARTR_pointsOPFOR",_score_red,true];
missionNamespace setVariable ["ARTR_pointsBLUFOR",_score_blu,true];

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
