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
private _skipEH = (findDisplay 46) displayAddEventHandler [
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
TRACKER_ICON = "\A3\ui_f\data\map\markers\military\objective_CA.paa";
TRACKER_COLOUR = [0, 1, 0, 0.85];
TRACKER_COLOURD = [1, 0, 0, 0.85];
TRACKER_TEXT = "ONLINE";
TRACKER_TEXTD = "CONTACT LOST";
ARTR_UAVDisplay = addMissionEventHandler [
	"Draw3D",
	"
		{
			drawIcon3D [TRACKER_ICON, [TRACKER_COLOURD,TRACKER_COLOUR] select (alive _x), visiblePosition _x, 0.5, 0.5, 0, [TRACKER_TEXTD,TRACKER_TEXT] select (alive _x), 0, 0.025, 'TahomaB'];
		} forEach (boxes select {_x getVariable ['tracked', false]});
	"
];

//If extended UAV is on, add that too
if (missionNamespace getVariable ["ExtendedUAV", false]) then
{
	UNITTRACK_ICON = "\A3\ui_f\data\map\markers\military\warning_CA.paa";
	UNITTRACK_COLOUR = [0.5,0,0,0.5];
	UNITTRACK_COLOURL = [0.85,0.85,0,0.5];
	UNITTRACK_TEXT = "";

	ARTR_ExtendedUAVDisplay = addMissionEventHandler [
		"Draw3D",
		"
			{
				drawIcon3D [
					UNITTRACK_ICON,
					[UNITTRACK_COLOURL,UNITTRACK_COLOUR] select (_x getVariable ['tracked', false]),
					[_x getVariable ['lastPos',[0,0,0]],getPosWorld _x] select (_x getVariable ['tracked', false]),
					0.2,
					0.2,
					0,
					[format ['LASTPOS +%1s', time - (_x getVariable ['trackLost',0])],UNITTRACK_TEXT] select (_x getVariable ['tracked', false]),
					0,
					0.025,
					'TahomaB'
				];
			} forEach (allPlayers select {_x getVariable 'ARTR_trueSide' == west});

			{
				drawIcon3D [
					'\A3\ui_f\data\map\markers\nato\o_recon.paa',
					[0,0.3,0.6,1],
					visiblePosition _x,
					0.2,
					0.2,
					0,
					'الجني' + (_x getVariable ['ARTR_profileName']),
					0,
					0.025,
					'TahomaB'
				];
			} forEach (allPlayers select { _x getVariable 'ARTR_trueSide' == east});
		"
	];
};

// Display instructions
private _layerTitlecard = "BIS_layerTitlecard" call BIS_fnc_rscLayer;
_layerTitlecard cutRsc ["RscDynamicText", "PLAIN"];

private _dispText = uiNamespace getVariable "BIS_dynamicText";
private _uavText = _dispText displayCtrl 9999;

_uavText ctrlSetPosition [
	0 * safeZoneW + safeZoneX,
	0.8 * safeZoneH + safeZoneY,
	safeZoneW,
	safeZoneH
];

// Determine appropriate key highlight colour
private _keyColor = format [
	"<t color = '%1'>",
	(["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML
];

private _skipText = format ["<t size = '0.75'> Press %1 [SPACE] </t> to close</t>", _keyColor];

_uavText ctrlSetStructuredText parseText _skipText;
_uavText ctrlSetFade 1;
_uavText ctrlCommit 0;

_uavText ctrlSetFade 0;
_uavText ctrlCommit 1;

// Trigger detects when player skips out, then removes HUD, postprocess effects, terminates camera
waitUntil { !(player getVariable ["uav", false]) || !alive player || missionNamespace getVariable ["uav_done", false]};

_uavText ctrlSetFade 1;
_uavText ctrlCommit 0;

removeMissionEventHandler ["Draw3D", ARTR_UAVDisplay];
if (missionNamespace getVariable ["ExtendedUAV", false]) then { removeMissionEventHandler ["Draw3D", ARTR_ExtendedUAVDisplay]; };
ppEffectDestroy ARTR_UAVPP;
ctrlDelete _uavText;
fakeUAV cameraEffect ["TERMINATE", "BACK"];
