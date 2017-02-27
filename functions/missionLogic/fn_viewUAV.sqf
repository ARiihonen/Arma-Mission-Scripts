// Apply post-process effects
ARTR_UAVPP = ppEffectCreate ["colorCorrections", 1999];
ARTR_UAVPP ppEffectEnable true;
ARTR_UAVPP ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.8, 0.8, 0.8, 0.65], [1, 1, 1, 1.0]];
ARTR_UAVPP ppEffectCommit 0;

//set view effects
showCinemaBorder false;
true setCamUseTI 0;

fakeUAV cameraEffect ["internal", "BACK"];
cameraEffectEnableHud true;

//set player variable
player setVariable ["uav", true, false];

//disable serialization and add keydown event handler for exiting from the camera
disableSerialization;
private ["_skipEH"];
_skipEH = (findDisplay 46) displayAddEventHandler [
	"KeyDown",
	format [
		"
			if (_this select 1 == 57) then {
				([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', uiNamespace getVariable 'skipEH'];

				playSound ['click', true];

				activateKey '%1';
				player setVariable ['uav', false, false];
			};
		"
	]
];
uiNamespace setVariable ["skipEH", _skipEH];

//create HUD markers
ARTR_UAVDisplay = addMissionEventHandler [
	"Draw3D",
	"
		{
			if (_x getVariable ['tracked', false]) then {
				_icon = '\A3\ui_f\data\map\markers\military\objective_CA.paa';
				_pos = visiblePosition _x;
				_colour = [0, 1, 0, 0.5];
				_text = 'ONLINE';

				if (!alive _x) then {
					_colour = [1, 0, 0, 0.5];
					_text = 'CONTACT LOST';
				};

				drawIcon3D [_icon, _colour , _pos , 0.5, 0.5, 0, _text, 0, 0.025, 'TahomaB'];
			};
		} forEach boxes;
	"
];

// Display instructions
private ["_layerTitlecard"];
_layerTitlecard = "BIS_layerTitlecard" call BIS_fnc_rscLayer;
_layerTitlecard cutRsc ["RscDynamicText", "PLAIN"];

private ["_dispText", "ARTR_UAVText"];
_dispText = uiNamespace getVariable "BIS_dynamicText";
ARTR_UAVText = _dispText displayCtrl 9999;

ARTR_UAVText ctrlSetPosition [
	0 * safeZoneW + safeZoneX,
	0.8 * safeZoneH + safeZoneY,
	safeZoneW,
	safeZoneH
];

// Determine appropriate key highlight colour
private ["_keyColor"];
_keyColor = format [
	"<t color = '%1'>",
	(["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML
];

private ["_skipText"];
_skipText = format ["<t size = '0.75'> Press %1 [SPACE] </t> to close</t>", _keyColor];

ARTR_UAVText ctrlSetStructuredText parseText _skipText;
ARTR_UAVText ctrlSetFade 1;
ARTR_UAVText ctrlCommit 0;

ARTR_UAVText ctrlSetFade 0;
ARTR_UAVText ctrlCommit 1;

// Trigger detects when player skips out, then removes HUD, postprocess effects, terminates camera
trg_exitUAV = [
	"!(player getVariable ['uav', false]) || !alive player",
	"ARTR_UAVText ctrlSetFade 1;
	ARTR_UAVText ctrlCommit 0;

	removeMissionEventHandler ['Draw3D', ARTR_UAVDisplay];
	ppEffectDestroy ARTR_UAVPP;
	fakeUAV cameraEffect ['TERMINATE', 'BACK'];"
] call ARTR_fnc_emptyTrigger;
