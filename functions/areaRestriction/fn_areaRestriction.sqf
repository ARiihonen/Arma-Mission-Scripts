if (!(player getVariable ["hades", false])) then {
	private _belong = 1 cutText ["YOU DO NOT BELONG HERE", "WHITE OUT", 0.1, true];
	sleep 0.5;
	1 cutFadeOut 1;

	sleep 1;

	private _back = 1 cutText ["TURN BACK", "WHITE OUT", 0.1, true];
	sleep 0.5;
	1 cutFadeOut 1;

	sleep 5;
};

if (alive player && !(player inArea trigger_area || player inArea trigger_bluearea || player inArea trigger_greenarea || player inArea trigger_purgatory) ) then {
	[] spawn ARTR_fnc_areaViolated;
};
