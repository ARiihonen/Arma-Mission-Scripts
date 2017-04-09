//Simulate mortar strikes without harming any players if possible
_fireLoop = _this spawn {
	params ["_syncTime"];
	private _startTime = _syncTime + random (20);
	waitUntil { serverTime >= _startTime };
	for "_i" from 1 to (6 + floor (random 7)) do
	{
		private _target = (markerPos "mrk_mortarCentre") vectorAdd [-200+random(400),-200+random(400),0];

		while { {side _x == east || isPlayer _x || typeOf _x == "B_CargoNet_01_ammo_F" } count (_target nearObjects 20) > 0 } do
		{
			_target = (markerPos "mrk_mortarCentre") vectorAdd [-200+random(400),-200+random(400),0];
		};

		_target set [2, 200];
		_mortar = createVehicle ["Sh_82mm_AMOS", _target, [], 0, "NONE"];
		_mortar setVelocity [0,0,-200];

		sleep 3 + random (6);
	};

	sleep 10 + random (10);

	for "_i" from 1 to (6 + floor (random 7)) do
	{
		private _target = selectRandom suppressionTargets;
		_target set [2, 500];
		_mortar = createVehicle ["Smoke_120mm_AMOS_White", _target, [], 5, "NONE"];
		_mortar setVelocity [0,0,-200];

		sleep 3 + random (6);
	};
};
