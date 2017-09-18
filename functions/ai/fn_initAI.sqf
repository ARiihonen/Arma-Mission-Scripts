if ( (isServer && isNil "headlessClient") || (!isServer && !hasInterface) ) then
{
	{
		_x setCaptive true;
		_x disableAI "TARGET";
		_x disableAI "AUTOTARGET";
		_x disableAI "CHECKVISIBLE";
		_x disableAI "AUTOCOMBAT";
		_x disableAI "COVER";
	} forEach (crew transportHelo);

	transportHelo flyInHeightASL [20, 20, 20];
};
