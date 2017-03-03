_unit = _this;

_backpack = "";

_backpackDudes = [
	"_LAT_",
//	"_AR_",
	"_A_",
	"_exp_",
	"medic",
	"engineer"
];

_giveBackpack = false;
{
	if ([_x, typeOf _unit] call BIS_fnc_inString) then {
		_giveBackpack = true;
	};
} forEach _backpackDudes;

if ( _giveBackpack ) then {

	_gearSets = _unit call ARTR_fnc_getIrregularGearSets;

	_backpackSets = [];
	if (typeName _gearSets == "BOOL") then {
		if (_gearSets) then {
			_backpackSets = ["assault","tactical"];
		};
	} else {
		_backpackSets = _gearSets select 4;
	};

	//Backpack sets
	_backpackTactical = ["B_TacticalPack_oli","B_TacticalPack_rgr","B_TacticalPack_blk"];
	_backpackKit = ["B_Kitbag_sgg","B_Kitbag_rgr","B_Kitbag_cbr"];
	_backpackField = ["B_FieldPack_oli","B_FieldPack_khk","B_FieldPack_cbr","B_FieldPack_blk"];
	_backpackCarryall = ["B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr"];
	_backpackAssault = ["B_AssaultPack_sgg","B_AssaultPack_khk","B_AssaultPack_rgr","B_AssaultPack_blk","B_AssaultPack_cbr"];

	_potentialBackpacks = [];
	{
		switch _x do {
			case "tactical": { _potentialBackpacks append _backpackTactical; };
			case "kitbag": { _potentialBackpacks append _backpackKit; };
			case "fieldpack": { _potentialBackpacks append _backpackField; };
			case "carryall": { _potentialBackpacks append _backpackCarryall; };
			case "assault": { _potentialBackpacks append _backpackAssault; };
		};
	} forEach _backpackSets;
	if (count _potentialBackpacks > 0) then {
		_backpack = selectRandom _potentialBackpacks;
	};
};

_backpack;
