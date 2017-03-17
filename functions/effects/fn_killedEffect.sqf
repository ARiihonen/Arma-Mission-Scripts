params ["_old_body"];

private _light = _old_body getVariable "light_object";

_light setLightBrightness HIT_BRIGHTNESS;
_light setLightFlareSize HIT_FLARESIZE;
_light setLightFlareMaxDistance HIT_FLAREMAX;

for "_i" from 1 to 100 do
{
	_light setLightBrightness PLAYER_BRIGHTNESS-(_i*PLAYER_BRIGHTNESS/100);
	_light setLightFlareSize PLAYER_FLARESIZE-(_i*PLAYER_FLARESIZE/100);
	sleep 0.01;
};

deleteVehicle _light;
_old_body setPos [(-10 + (random 20)),(-10 + (random 20)), 2];
_old_body setDir (random 360);
