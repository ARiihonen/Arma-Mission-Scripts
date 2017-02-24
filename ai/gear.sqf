#include "..\logic\gear.sqf"

//Get _this class and make sure it's all uppercase since BI classnames are super inconsistent
_class = typeOf _this;
_class = toUpper _class;

//Remove all gear. Remove if only adding items or swapping non-containers
//_this call caran_clearInventory;

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

//Define and assign non-standard gear here.

//Adding gear. 
[_this, _uniform, _vest, _backpack, _headwear] call caran_addClothing;
[_this, _items] call caran_addInventoryItems;
[_this, _link_items] call caran_addLinkedItems;
[_this, _item_weapons] call caran_addInventoryWeapons;
[_this, _primary_weapon, _primary_weapon_items, _primary_ammo_array] call caran_addPrimaryWeapon;
[_this, _secondary_weapon, _secondary_weapon_items, _secondary_ammo_array] call caran_addSecondaryWeapon;
[_this, _handgun, _handgun_items, _handgun_ammo_array] call caran_addHandgun;