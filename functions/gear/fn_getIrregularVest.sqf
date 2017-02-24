_unit = _this;

_gearSets = _unit call ARTR_fnc_getIrregularGearSets;

_vestSets = [];
_vest = "";
if (typeName _gearSets == "BOOL") then {
	if (_gearSets) then {
		_vestSets = ["bandolier","tacvest"];
	};
} else {
	_vestSets = _gearSets select 1;
};

//Vest sets definition
_vestsPlateCarrier = ["V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_rgr","V_PlateCarrier2_blk","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_blk"];
_vestsChestRig = ["V_Chestrig_oli","V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk"];
_vestsChestRigTactical = ["V_TacChestrig_oli_F","V_TacChestrig_grn_F","V_TacChestrig_cbr_F"];
_vestsBandolier = ["V_BandollierB_oli","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk"];
_vestsTacVest = ["V_TacVest_oli","V_TacVest_khk","V_TacVest_camo","V_TacVest_brn","V_TacVest_blk"];


//Build list of all potential vests and select a random one
_potentialVests = [];
{
	switch _x do {
		case "platecarrier": { _potentialVests append _vestsPlateCarrier; };
		case "chestrig": { _potentialVests append _vestsChestRig; };
		case "chestrig_tactical": { _potentialVests append _vestsChestRigTactical; };
		case "bandolier": { _potentialVests append _vestsBandolier; };
		case "tacvest": { _potentialVests append _vestsTacVest; };
	};
} forEach _vestSets;
if (count _potentialVests > 0) then {
	_vest = selectRandom _potentialVests;
};

_vest;
