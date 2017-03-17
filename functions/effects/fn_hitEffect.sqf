params ["_unit"];

private _light = _unit getVariable "light_object";
_light setLightBrightness HIT_BRIGHTNESS;
_light setLightFlareSize HIT_FLARESIZE;
_light setLightFlareMaxDistance HIT_FLAREMAX;

sleep 0.2;

_light setLightBrightness PLAYER_BRIGHTNESS;
_light setLightFlareSize PLAYER_FLARESIZE;
_light setLightFlareMaxDistance PLAYER_FLAREMAX;
