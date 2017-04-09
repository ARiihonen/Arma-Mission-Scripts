//Spawn new wave when the queue runs out
trigger_wave = [
	"count spawnQueue <= 0 && (count (call activeGroups) <= 2)",
	"call ARTR_fnc_spawnWave; deleteVehicle thisTrigger;"
] call ARTR_fnc_emptyTrigger;
trigger_wave setTriggerTimeout [60,90,180,true];
