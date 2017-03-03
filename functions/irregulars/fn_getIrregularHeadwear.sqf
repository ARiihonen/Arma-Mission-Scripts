_unit = _this;

_gearSets = _unit call ARTR_fnc_getIrregularGearSets;

_headgearSets = [];
_goggleSets = [];
_headgear = "";
_goggles = "";
if (typeName _gearSets == "BOOL") then {
	if (_gearSets) then {
		_headgearSets = ["shemag","bandanna","beanie"];
		_goggleSets = ["balaclava","bandanna","shades"];
	};
} else {
	_headgearSets = _gearSets select 2;
	_goggleSets = _gearSets select 3;
};


//Headgear sets
_headgearBandanna = ["H_Bandanna_camo","H_Bandanna_sand","H_Bandanna_sgg","H_Bandanna_mcamo","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_cbr"];
_headgearBeanie = ["H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_cbr","H_Watchcap_blk"];
_headgearBoonie = ["H_Booniehat_tan","H_Booniehat_oli","H_Booniehat_khk"];
_headgearCap = ["H_Cap_tan","H_Cap_red","H_Cap_oli","H_Cap_grn","H_Cap_blu","H_Cap_blk"];
_headgearHat = ["H_Hat_tan","H_Hat_grey","H_Hat_checker","H_Hat_camo","H_Hat_brown","H_Hat_blue"];
_headgearHelmet = ["H_HelmetB_snakeskin","H_HelmetB_sand","H_HelmetB_grass","H_HelmetB_desert","H_HelmetB_black","H_HelmetB"];
_headgearECH = ["H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB"];
_headgearICH = ["H_HelmetB_light_snakeskin","H_HelmetB_light_sand","H_HelmetB_light_grass","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light"];
_headgearMilCap = ["H_MilCap_dgtl","H_MilCap_tna_F","H_MilCap_mcamo","H_MilCap_ocamo","H_MilCap_gry"];
_headgearShemagh = ["H_ShemagOpen_khk","H_ShemagOpen_tan","H_Shemag_olive"];

//Goggle sets
_goggleBalaclava = ["G_Balaclava_oli","G_Balaclava_blk"];
_goggleBandanna = ["G_Bandanna_tan","G_Bandanna_sport","G_Bandanna_shades","G_Bandanna_oli","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk"];
_goggleShades = ["G_Shades_Red","G_Shades_Green","G_Shades_Blue","G_Shades_Black"];
_goggleShadesSport = ["G_Sport_Greenblack","G_Sport_Blackred","G_Sport_Checkered","G_Sport_BlackWhite","G_Sport_Blackyellow","G_Sport_Red"];

_potentialHeadgear = [];
{
	switch _x do {
		case "bandanna": { _potentialHeadgear append _headgearBandanna; };
		case "beanie": { _potentialHeadgear append _headgearBeanie; };
		case "boonie": { _potentialHeadgear append _headgearBoonie; };
		case "cap": { _potentialHeadgear append _headgearCap; };
		case "hat": { _potentialHeadgear append _headgearHat; };
		case "helmet": { _potentialHeadgear append _headgearHelmet; };
		case "ech": { _potentialHeadgear append _headgearECH; };
		case "ich": { _potentialHeadgear append _headgearICH; };
		case "milcap": { _potentialHeadgear append _headgearMilCap; };
		case "shemagh": { _potentialHeadgear append _headgearShemagh; };
	};
} forEach _headgearSets;
if (count _potentialHeadgear > 0) then {
	_headgear = if (random 1 > 0.5) then { ""; } else { selectRandom _potentialHeadgear; };
};

_potentialGoggles = [];
{
	switch _x do {
		case "balaclava": { _potentialGoggles append _goggleBalaclava; };
		case "bandanna": { _potentialGoggles append _goggleBandanna; };
		case "shades": { _potentialGoggles append _goggleShades; };
		case "shades_sport": { _potentialGoggles append _goggleShadesSport; };
	};
} forEach _goggleSets;
if (count _potentialGoggles > 0) then {
	_goggles = if (random 1 > 0.5) then { ""; } else { selectRandom _potentialGoggles; };
};

//Make sure headwear doesn't clash (shemags do not go with goggles, balaclavas do not go with any headwear that is not a helmet)
if (["shemag", _headgear] call BIS_fnc_inString || ( ["balaclava", _goggles] call BIS_fnc_inString && !(["helmet", _headgear] call BIS_fnc_inString) ) ) then {
	if (random 1 > 0.5) then {
		_headgear = "";
	} else {
		_goggles = "";
	};
};

_headWear = [_headgear,_goggles];

_headWear;
