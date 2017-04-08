if (alive target) then
{
	_surrender = [] spawn {
		waitUntil { isNull objectParent target };
		[target, true] call ACE_captives_fnc_setSurrendered;
	};
};
