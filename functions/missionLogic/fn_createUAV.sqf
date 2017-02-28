private _pos = markerPos "uavTarget";
private _alt = 250;
private _rad = 150;
private _ang = 5;
private _dir = 1;

fakeUAV = "camera" camCreate [(markerPos "uavTarget" select 0), (markerPos "uavTarget" select 1), 400];

private _coords = [_pos, _rad, _ang] call BIS_fnc_relPos;
_coords set [2, _alt];

fakeUAV camPrepareTarget _pos;
fakeUAV camPreparePos _coords;
fakeUAV camPrepareFOV 0.700;
fakeUAV camCommitPrepared 0;

// Move camera in a circle
[_pos, _alt, _rad, _ang, _dir] spawn {
	private _pos = _this select 0;
	private _alt = _this select 1;
	private _rad = _this select 2;
	private _ang = _this select 3;
	private _dir = _this select 4;

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
