//placeholder until the actual HC handling functionality is finished. Currently just runs general AI scripts on server
if ( isServer ) then {
	_aiInit = [] execVM "ai\init.sqf";
};