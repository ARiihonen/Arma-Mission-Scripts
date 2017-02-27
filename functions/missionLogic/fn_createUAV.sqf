private ["_pos", "_txt", "_alt", "_rad", "_ang", "_dir"];
_pos = markerPos "uavTarget";
_alt = 250;
_rad = 150;
_ang = 5;
_dir = 1;

fakeUAV = "camera" camCreate [(markerPos "uavTarget" select 0), (markerPos "uavTarget" select 1), 400];

private ["_coords"];
_coords = [_pos, _rad, _ang] call BIS_fnc_relPos;
_coords set [2, _alt];

fakeUAV camPrepareTarget _pos;
fakeUAV camPreparePos _coords;
fakeUAV camPrepareFOV 0.700;
fakeUAV camCommitPrepared 0;

// Move camera in a circle
[_pos, _alt, _rad, _ang, _dir] spawn {
private ["_pos", "_alt", "_rad", "_ang", "_dir"];
	_pos = _this select 0;
	_alt = _this select 1;
	_rad = _this select 2;
	_ang = _this select 3;
	_dir = _this select 4;

	while {true} do {
		_ang = _ang - 0.5;

		private ["_coords"];
		_coords = [_pos, _rad, if (_dir == 0) then {_ang} else {_ang * -1}] call BIS_fnc_relPos;
		_coords set [2, _alt];

		fakeUAV camPreparePos _coords;
		fakeUAV camCommitPrepared 0.2;

		waitUntil {camCommitted fakeUAV };

		fakeUAV camPreparePos _coords;
		fakeUAV camCommitPrepared 0;
	};
};
