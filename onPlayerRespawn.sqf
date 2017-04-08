//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
waitUntil {!isNull player};

[player] call ARTR_fnc_modGear;

//actions for calling for LZ in helicopter if AI pilot

//And for calling for LZ when not in helicopter and AI pilot

//Action for orbit control (smaller, bigger, higher, lower) if in Blackfish and AI pilot


//Action for intel and for money
_docsAction = [
	"act_getDocs",
	"Take Documents",
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",
	{
		params ["_target","_player","_actionParams"];
		_player setVariable ["hasDocuments", true, true];
	},
	{
		params ["_target","_player","_actionParams"];
		[_player,_target] call ACE_common_fnc_canInteractWith;
	}
] call ace_interact_menu_fnc_createAction;
[
	documentObject,
	0,
	["ACE_MainActions"],
	_docsAction
] call ace_interact_menu_fnc_addActionToObject;

_moneyAction = [
	"act_getMoney",
	"Steal Money",
	"",
	{
		params ["_target","_player","_actionParams"];
		_player setVariable ["hasMoney", true, true];
		deleteVehicle _target;
	},
	{
		params ["_target","_player","_actionParams"];
		[_player,_target] call ACE_common_fnc_canInteractWith;
	}
] call ace_interact_menu_fnc_createAction;
[
	moneyStack,
	0,
	["ACE_MainActions"],
	_moneyAction
] call ace_interact_menu_fnc_addActionToObject;
