/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//set respawn tickets to 0
[missionNamespace, 1] call BIS_fnc_respawnTickets;
[missionNamespace, -1] call BIS_fnc_respawnTickets;

//Task creating: [owner, task name/[task name, parent task name], [description, title, marker], destination, state, priority, shownotification, type, shared] call BIS_fnc_taskCreate;
//Updating tasks example: ["TaskName", "STATE", false] call BIS_fnc_taskSetState;
//Custom task update notification: ["NotificationName", ["Message"]] remoteExec ["BIS_fnc_showNotification", west, false];

//Handle mission ending here, call from serverside event handler or trigger
missioneEnding = {
	//calculate which ending to show here
	_end = "Lose";
	
	[_end,"end.sqf"] remoteExec ["BIS_fnc_execVM",0,false];
};

//Create trigger to handle ending if players dead
trigger_dead = createTrigger ['EmptyDetector', [0,0,0], false];
trigger_dead setTriggerActivation ['NONE', 'PRESENT', false];
trigger_dead setTriggerStatements [
	"count playableUnits == 0",
	"call missionEnding;",
	""
];

//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
serverInit = true;
publicVariable "serverInit";