diag_log format ["TAKING NEXT ENEMIES FROM QUEUE, ACTIVE GROUPS: %1", call activeGroups];

_spawnLoop = [] spawn {
	while { (count (call activeGroups) < call maxGroups) && count spawnQueue > 0 } do
	{
		private _element = (spawnQueue deleteAt (floor random count spawnQueue));
		_element remoteExecCall ["ARTR_fnc_infantryGroup", call ARTR_fnc_getAIController, false];
		diag_log format ["SPAWNING %1", _element];
		sleep 0.5;
	};
};

//Spawn new units when there are some in the queue and there aren't too many
tr_queue = [
	"(count (call activeGroups) < call maxGroups) && count spawnQueue > 0",
	"call ARTR_fnc_handleQueue; deleteVehicle thisTrigger;"
] call ARTR_fnc_emptyTrigger;
tr_queue setTriggerTimeout [5, 5, 5, true];
