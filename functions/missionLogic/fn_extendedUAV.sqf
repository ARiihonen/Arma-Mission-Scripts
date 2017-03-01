if (isServer && {playersNumber east <= 1 || "Extended diver info" call BIS_fnc_getParamValue == 1} ) then
{
	call ARTR_fnc_createUAV;

	missionNamespace setVariable ["ExtendedUAV", true, true];

	_trackerLoop = [] spawn
	{
		while { missionNamespace getVariable ['uav_done', false] } do
		{
			{
				if ( !(lineIntersects [getPos _x, getPos fakeUAV,_x]) ) then
				{
					if ( !(_x getVariable ["tracked", false]) ) then
					{
						_x setVariable ["tracked",true,true];
					};
					_x setVariable ["lastPos", visiblePosition _x, true];
				} else {
					if (_x getVariable ["tracked", false]) then
					{
						_x setVariable ["tracked",false,true];
						_x setVariable ["trackLost",time,true];
					};
				};

				sleep 0.5;
			} forEach (allPlayers select { side _x == west });
		};
	};
};
