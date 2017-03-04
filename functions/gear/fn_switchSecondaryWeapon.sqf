params [
	["_unit", player, [objNull]],
	["_weaponArray", ["",[["",0]],[]], [[]] ]
];

_weaponArray params [
	["_weapon", "", [""] ],
	["_magArray", [["",0]], [[]] ],
	["_attachments", [], [[]] ]
];

_ret = false;

if (_weapon != "") then
{
	_ret = true;

	//Get secondary weapon mag type, remove all matching
	{
		private _identifier = "";

		//Strip the mag class name to the bit before the first _, giving the general type
		_identifier = _x select [0,[_x find "_"]];

		{
			_unit removeMagazines _x;
		} forEach (magazines _unit select { _x find _identifier >= 0 });
	} forEach (secondaryWeaponMagazine _unit);

	_unit removeWeapon (secondaryWeapon _unit);

	{
		_unit addMagazines [_x select 0, _x select 1];
	} forEach _magArray;

	_unit addWeapon _weapon;

	{
		_unit addSecondaryWeaponItem _x;
	} forEach _attachments;
};

_ret;
