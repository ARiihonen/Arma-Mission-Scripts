{
	missionNamespace setVariable [_x, 2];
} forEach [
	"ace_medical_medicSetting",
	"ace_medical_level",
	"ace_medical_enableUnconsciousnessAI"
];

{
	missionNamespace setVariable [_x, 1];
} forEach [
	"ace_medical_useCondition_PAK",
	"ace_medical_medicSetting_PAK",
	"ace_medical_playerDamageThreshold",
	"ace_medical_AIDamageThreshold",
	"ace_medical_enableFor",
	"ace_medical_bleedingCoefficient",
	"ace_medical_painCoefficient"
];

{
	missionNamespace setVariable [_x, 0];
} forEach [
	"ace_medical_enableRevive"
];

{
	missionNamespace setVariable [_x, -1];
} forEach [
	"ace_medical_useLocation_PAK",
	"ace_medical_consumeItem_PAK"
];

{
	missionNamespace setVariable [_x, true];
} forEach [
	"ace_medical_enableOverdosing",
	"ace_medical_enableAdvancedWounds",
	"ace_medical_enableScreams",
	"ace_medical_enableVehicleCrashes",
	"ace_medical_preventInstaDeath",
	"ace_medical_remoteControlledAI",
	"ace_medical_keepLocalSettingsSynced",
	"ace_medical_healHitPointAfterAdvBandage"
];

{
	missionNamespace setVariable [_x, false];
} forEach [
	"ace_medical_painIsOnlySuppressed"
];