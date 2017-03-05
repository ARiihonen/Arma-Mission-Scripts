if (isServer && (call ARTR_fnc_getAIController isEqualType 2) || player == headlessClient ) then {
	_units = _this;

	{
		_newGroup = createGroup west;
		[_x] joinSilent _newGroup;
	} forEach _this;
};
