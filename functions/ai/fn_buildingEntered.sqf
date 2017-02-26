if (isServer) then {
	_units = _this;

	{
		_newGroup = createGroup west;
		[_x] joinSilent _newGroup;
	} forEach _this;
};
