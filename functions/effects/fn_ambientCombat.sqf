
if (isServer) then {
	_effectsLoop = [] spawn
	{
		_soundList = ["A3\Sounds_F\environment\ambient\battlefield\Battlefield_Firefight1.wss",
		              "A3\Sounds_F\environment\ambient\battlefield\Battlefield_Firefight2.wss",
		              "A3\Sounds_F\environment\ambient\battlefield\Battlefield_Firefight3.wss",
		              "A3\Sounds_F\environment\ambient\battlefield\Battlefield_Firefight4.wss" ];

		waitUntil { time > 0 };

		while { true } do
		{
			_position = getMarkerPos (selectRandom ["mrk_ac_1","mrk_ac_2","mrk_ac_3","mrk_ac_4","mrk_ac_5","mrk_ac_6","mrk_ac_7"]);
			playSound3D [selectRandom _soundList, objNull, false, _position, 1+(random 9), 1, 0];
			hint format ["Sound %1", _position];
		    sleep (2 + (random 8));
		};
	};
};
