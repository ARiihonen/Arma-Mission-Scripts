_ace_settings = [ 
	/*Medical settings*/ 
	["ace_medical_level", 2], /*Medical level (2 = advanced)*/
	["ace_medical_medicSetting", 2], /*Medic info (2 = advanced)*/
	["ace_medical_allowLitterCreation", true], /*Allow litter*/
	["ace_medical_litterCleanUpDelay", 1800], /*Time before litter is removed (seconds)*/
	["ace_medical_enableScreams", true], /*Enable screams*/
	["ace_medical_playerDamageThreshold", 1], /*Player damage to kill*/
	["ace_medical_AIDamageThreshold", 1],  /*AI damage to kill*/
	["ace_medical_enableUnconsciousnessAI", 0], /*AI unconsciousness (0 = disabled, others: 50/50, enabled)*/
	["ace_medical_remoteControlledAI", true], /*Treat remote AI as AI, not player*/
	["ace_medical_preventInstaDeath", true], /*Prevent instant death*/
	["ace_medical_bleedingCoefficient", 1], /*Bleeding coefficient*/
	["ace_medical_painCoefficient", 1], /*Pain coefficient*/
	["ace_medical_keepLocalSettingsSynced", true], /*Sync (keep true)*/
	
	/*Advanced medical settings*/
	["ace_medical_enableFor", 0], /*enable for players/players and AI (players: 0)*/
	["ace_medical_enableAdvancedWounds", false], /*Wounds opening*/
	["ace_medical_enableVehicleCrashes", true], /*Vehicle crashes*/
	["ace_medical_medicSetting_PAK", 1], /*Who can use PAK (1 = medic onlt, 2 = doctor only, (0 = anyone??) )*/
	["ace_medical_consumeItem_PAK", -1], /*Remove PAK on use (-1 = no)*/
	["ace_medical_useCondition_PAK", 1], /*Condition at which PAK can be used ( 1 = stable, other: anytime )*/
	["ace_medical_useLocation_PAK", -1], /*PAK use location (-1 = anywhere, 1 = medical vehicle)*/
	["ace_medical_medicSetting_SurgicalKit", 2], /*Who can use Surgical Kit (1 = medic onlt, 2 = doctor only, (0 = anyone??) )*/
	["ace_medical_consumeItem_SurgicalKit", -1], /*Remove surgical kit on use (-1 = no)*/
	["ace_medical_useLocation_SurgicalKit", 1], /*Surgical kit use location (1 = medical vehicle)*/
	["ace_medical_useCondition_SurgicalKit", 1], /*Condition at which surgical kit can be used ( 1 = stable)*/
	["ace_medical_healHitPointAfterAdvBandage", true], /*Heal hitpoints when full bandaged*/
	["ace_medical_painIsOnlySuppressed", false], /*only suppress pain*/
	
	/*Medical menu*/
	["ace_medical_menu_allow", 1], /*1 = allow anywhere*/
	["ace_medical_menu_maxRange", 3], /*max range*/
	
	/*Revive*/
	["ace_medical_enableRevive", 0], /*Enable (0 = disable, others: players, players&AI)*/
	["ace_medical_maxReviveTime", 120], /*Max time*/
	["ace_medical_amountOfReviveLives", -1], /*amount of lives (-1 to disable)*/
	
	/*Blu force tracking*/
	["ace_map_BFT_Enabled", true], /*Enable*/
	["ace_map_BFT_Interval", 1], /*Interval*/
	["ace_map_BFT_HideAiGroups", false], /*Show AI groups*/

	/*Map*/
	["ace_map_mapIllumination", true], /*Illumination*/
	["ace_map_mapGlow", true], /*glow from external sources*/
	["ace_map_mapShake", false], /*Shake*/
	["ace_map_mapLimitZoom", false], /*Limit zoom*/
	["ace_map_mapShowCursorCoordinates", false], /*Show cursor coordinates*/
	["ace_map_DefaultChannel", -1], /*Set default marker channel at start (-1 = no)*/

	/*Map gestures*/
	["ace_map_gestures_enabled", true], /*Enable*/
	["ace_map_gestures_maxRange", 7], /*Max range (metres)*/
	["ace_map_gestures_interval", 0.03], /*Interval (seconds)*/
	
	/*Pointing*/
	["ace_finger_enabled", true], /*Enable (bool)*/
	["ace_finger_maxRange", 4], /*Max range in metres*/

	/*Vehicle locks*/
	["ace_vehiclelock_DefaultLockpickStrength", 10], /*Lockpick time in seconds*/
	["ace_vehiclelock_LockVehicleInventory", true], /*lock locked vehicle inventory*/
	["ace_vehiclelock_VehicleStartingLockState", -1], /*-1 = as is*/

	/*View distance*/
	["ace_viewdistance_enabled", true], /*enable*/
	["ace_viewdistance_limitViewDistance", 10000], /*limit max view distance*/

	/*Weather*/
	["ace_weather_enableServerController", true], /*Server propagation*/
	["ace_weather_useACEWeather", true], /*Use ACE weather*/
	["ace_weather_syncRain", true], /*Sync rain*/
	["ace_weather_syncWind", true], /*Sync wind*/
	["ace_weather_syncMisc", true], /*Sync others*/
	["ace_weather_serverUpdateInterval", 60], /*Update interval (seconds)*/

	/*Captives*/
	["ace_captives_allowHandcuffOwnSide", true], /*Can handcuff own side*/
	["ace_captives_allowSurrender", true], /*Allow surrendering*/
	["ace_captives_requireSurrender", -1], /*Require surrender (-1 = false, others: surrendering only or surrendering || no weapon)*/

	/*Explosives*/
	["ace_explosives_RequireSpecialist", false], /*Require specialist*/
	["ace_explosives_PunishNonSpecialists", true], /*Punish non-specialists*/
	["ace_explosives_ExplodeOnDefuse", true], /*Some explosives blow up on defuse*/

	/*Deafness*/
	["ace_hearing_EnableCombatDeafness", false], /*Enable combat deafness*/
	["ace_hearing_enabledForZeusUnits", false], /*Enable for Zeus units*/
	["ace_hearing_autoAddEarplugsToUnits", false], /*Add earplugs*/
	
	/*Wind deflection*/
	["ace_winddeflection_enabled", true], /*Enable wind deflection*/
	["ace_winddeflection_vehicleEnabled", true], /*Also for vehicles*/
	["ace_winddeflection_simulationInterval", 0.05], /*Simulation interval (s)*/
	["ace_winddeflection_simulationRadius", 3000], /*Simulation radius (m)*/
	
	/*Adv. ballistics */
	["ace_advanced_ballistics_enabled", true], /*Enable */
	["ace_advanced_ballistics_simulateForSnipers", true], /*Simulate for non-local snipers*/
	["ace_advanced_ballistics_simulateForGroupMembers", false], /*Simulate for non-local group members*/
	["ace_advanced_ballistics_simulateForEveryone", false], /*Simulate for all non-local*/
	["ace_advanced_ballistics_disabledInFullAutoMode", true], /*Disable when in full auto*/
	["ace_advanced_ballistics_ammoTemperatureEnabled", true], /*Temperature affects ballistics*/
	["ace_advanced_ballistics_barrelLengthInfluenceEnabled", true], /*Barrel length affects ballistics*/
	["ace_advanced_ballistics_bulletTraceEnabled", true], /*Bullet trails on high powered rifles*/
	["ace_advanced_ballistics_simulationInterval", 0], /*Simulation interval*/
	["ace_advanced_ballistics_simulationRadius", 3000], /*Simulation radius*/
	
	/*Mortar*/
	["ace_mk6mortar_airResistanceEnabled", true], /*enable air resistance*/
	["ace_mk6mortar_allowComputerRangefinder", false], /*Allow targeting computer*/
	["ace_mk6mortar_allowCompass", true], /*Allow compass*/
	
	/*Misc*/
	["ace_interaction_EnableTeamManagement", true], /*Enable team management*/
	["ace_microdagr_MapDataAvailable", 1], /*MicroDAGR map fill: 1 = topographical + roads others: disable, full*/
	["ace_nightvision_disableNVGsWithSights", true], /*Disable NVGs with sights*/
	["ace_sitting_enable", true] /*Enable sitting*/
];

/*Set all settings*/
{
	missionNamespace setVariable _x;
} forEach _ace_settings;