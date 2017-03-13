_hash = [
	57,
	[false, false, false],
	{
		if ( isNull (attachedTo player) || (attachedTo player) getVariable ["ace_captives_escortedUnit",objNull] == player) then
		{
			[player,false] call ACE_captives_fnc_setHandcuffed;
		};
	}
] call CBA_fnc_addKeyHandler;
player setVariable ["uncuffKeyHandler",_hash,false];
