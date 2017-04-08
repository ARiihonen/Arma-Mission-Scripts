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

	//Get primary weapon mags and remove all types associated, then remove the primary weapon
	{
		private _identifier = "";
		if (_x find "_grenade_" < 0 && _x find "UGL" < 0) then
		{
			//Strip the mag class name to the bit between the first two _, result is caliber
			private _firstBoundary = (_x find "_")+1;
			private _secondBoundary = ((_x select [_firstBoundary]) find "_");

			_identifier = _x select [_firstBoundary,_secondBoundary];
		} else {
			//If it's an UGL grenade or flare, these identifiers are used
			_identifier = (["_grenade_","UGL"] select (_x find "UGL" >= 0));
		};

		{
			_unit removeMagazines _x;
		} forEach (magazines _unit select { _x find _identifier >= 0 });
	} forEach (primaryWeaponMagazine _unit);

	_unit removeWeapon (primaryWeapon _unit);

	if (_weapon != "remove") then
	{
		[_unit,_magArray] call ARTR_fnc_giveMagazines;

		_unit addWeapon _weapon;

		{
			_unit addPrimaryWeaponItem _x;
		} forEach _attachments;
	};
};

_ret;
