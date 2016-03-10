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

//Adding gear. 
[player, _uniform, _vest, _backpack, _headwear] call caran_addClothing;
[player, _items] call caran_addInventoryItems;
[player, _link_items] call caran_addLinkedItems;
[player, _item_weapons] call caran_addInventoryWeapons;
[player, _primary_weapon, _primary_weapon_items, _primary_ammo_array] call caran_addPrimaryWeapon;
[player, _secondary_weapon, _secondary_weapon_items, _secondary_ammo_array] call caran_addSecondaryWeapon;
[player, _handgun, _handgun_items, _handgun_ammo_array] call caran_addHandgun;