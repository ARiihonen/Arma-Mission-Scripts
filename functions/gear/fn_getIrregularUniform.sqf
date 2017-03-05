_unit = _this;

_gearSets = _unit call ARTR_fnc_getIrregularGearSets;

_uniformSets = [];
_uniform = "";
if (typeName _gearSets == "BOOL") then {
	if (_gearSets) then {
		_uniformSets = ["guerrilla"];
	};
} else {
	_uniformSets = _gearSets select 0;
};

diag_log format ["IRREGULAR UNIFORM SETS: %1, GEAR SETS: %2", _uniformSets, _gearSets];

//Uniform sets definition
_uniformsGuerrilla = ["U_BG_Guerilla2_3","U_BG_Guerrilla_6_1","U_BG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_1"];
_uniformsParamilitary = ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_2_F"];
_uniformsBandit = ["U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_4_F"];
_uniformsCivilian = ["U_C_Man_casual_1_F","U_C_Man_casual_3_F","U_C_Man_casual_2_F"];
_uniformsCivilianShorts = ["U_C_Man_casual_5_F","U_C_Man_casual_4_F","U_C_Man_casual_6_F","U_C_Poloshirt_tricolour","U_C_Poloshirt_stripped","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Poloshirt_burgundy","U_C_Poloshirt_blue"];
_uniformsCivilianSports = ["U_C_man_sport_2_F","U_C_man_sport_3_F","U_C_man_sport_1_F"];

//Build a list of potential uniforms and select a random one
_potentialUniforms = [];
{
	switch _x do {
		case "guerrilla": { _potentialUniforms append _uniformsGuerrilla; };
		case "paramilitary": { _potentialUniforms append _uniformsParamilitary; };
		case "bandit": { _potentialUniforms append _uniformsBandit; };
		case "civilian": { _potentialUniforms append _uniformsCivilian; };
		case "civilian_shorts": { _potentialUniforms append _uniformsCivilianShorts; };
		case "civilian_sports": { _potentialUniforms append _uniformsCivilianSports; };
	};
} forEach _uniformSets;
if (count _potentialUniforms > 0) then {
	_uniform = selectRandom _potentialUniforms;
};

_uniform;
