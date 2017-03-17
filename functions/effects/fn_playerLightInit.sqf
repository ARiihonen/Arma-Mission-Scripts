params ["_unit"];
private _colour = [BLUE_COLOUR,GREEN_COLOUR] select (side _unit == resistance);
_unit setVariable ["light_colour", _colour, false];

private _light = "#lightpoint" createVehicleLocal (getPosWorld _unit);
_light lightAttachObject [_unit, [0,0,0]];
_unit setVariable ["light_object", _light, false];

_light setLightBrightness PLAYER_BRIGHTNESS;
_light setLightAmbient _colour;
_light setLightColor _colour;
_light setLightAttenuation PLAYER_ATTENUATION;

_light setLightUseFlare PLAYER_USEFLARE;
_light setLightFlareSize PLAYER_FLARESIZE;
_light setLightFlareMaxDistance PLAYER_FLAREMAX;

_unit addMPEventHandler [ "MPHit", { (_this select 0) spawn ARTR_fnc_hitEffect; } ];
_unit addMPEventHandler [ "MPKilled", { (_this select 0) spawn ARTR_fnc_killedEffect; } ];
