params ["_monolith","_colour"];

private _position = (getPosWorld _monolith) vectorAdd [0,0,ENVL_HEIGHT];

_new_light = "#lightpoint" createVehicleLocal _position;
_new_light setLightBrightness ENVL_BRIGHTNESS;
_new_light setLightAmbient _colour;
_new_light setLightColor _colour;
_new_light setLightAttenuation ENVL_ATTENUATION;

_new_light setLightUseFlare ENVL_USEFLARE;
_new_light setLightFlareSize ENVL_FLARESIZE;
_new_light setLightFlareMaxDistance ENVL_FLAREMAX;
