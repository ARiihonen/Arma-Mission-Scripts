#include "..\logic\gear.sqf"

//Get player class and make sure it's all uppercase since BI classnames are super inconsistent
_class = typeOf player;
_class = toUpper _class;

//Remove all gear. Remove if only adding items or swapping non-containers
//player call caran_clearInventory;

//Define default gear types. Leave as is if no change from default unit required (or remove both from here and from calls at the end of this file)
_uniform = "";
_vest = "";
_backpack = "";
_headwear = ["",""];

_items = [];
_link_items = [];
_item_weapons = [];

_primary_weapon = "";
_primary_weapon_items = [];
_primary_ammo_array = [];

_secondary_weapon = "";
_secondary_weapon_items = [];
_secondary_ammo_array = [];

_handgun = "";
_handgun_items = [];
_handgun_ammo_array = [];

//Medical. ACE if active, vanilla if not
if ( "ace_" call caran_checkMod ) then {
	{ _items pushback [_x, 4, "Uniform"]; } forEach ["ACE_morphine", "ACE_epinephrine"];
	{ _items pushback [_x, 8, "Uniform"]; } forEach ["ACE_elasticBandage", "ACE_packingBandage"];
	_items pushback ["ACE_tourniquet", 1, "Uniform"];
	_items pushback ["ACE_MapTools", 1, "Uniform"];
} else {
	_items pushback ["FirstAidKit", 2, "Uniform"];
};

if ( ["MEDIC", _class] call BIS_fnc_inString ) then {
	_backpack = "B_AssaultPack_blk";
	
	if ( "ace_" call caran_checkMod ) then {
		_items set [ count _items, ["ACE_personalAidKit", 1, "Backpack"]];
		_items set [ count _items, ["ACE_bloodIV", 2, "Backpack"]];
		_items set [ count _items, ["ACE_bloodIV_500", 4, "Backpack"]];
		_items set [ count _items, ["ACE_tourniquet", 5, "Backpack"]];
		{ _items set [count _items, [_x, 10, "Backpack"]]; } forEach ["ACE_morphine", "ACE_epinephrine", "ACE_atropine"];
		{ _items set [count _items, [_x, 25, "Backpack"]]; } forEach ["ACE_packingBandage", "ACE_elasticBandage"];
	} else {
		_items set [ count _items, ["Medikit", 1, "Backpack"]];
		_items set [ count _items, ["FirstAidKit", 10, "Backpack"]];
	};
};

//Adding gear. 
[player, _uniform, _vest, _backpack, _headwear] call caran_addClothing;
[player, _items] call caran_addInventoryItems;
[player, _link_items] call caran_addLinkedItems;
[player, _item_weapons] call caran_addInventoryWeapons;
[player, _primary_weapon, _primary_weapon_items, _primary_ammo_array] call caran_addPrimaryWeapon;
[player, _secondary_weapon, _secondary_weapon_items, _secondary_ammo_array] call caran_addSecondaryWeapon;
[player, _handgun, _handgun_items, _handgun_ammo_array] call caran_addHandgun;