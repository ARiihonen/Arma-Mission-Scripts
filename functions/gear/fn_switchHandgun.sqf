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

	//Get handgun mag type and remove all that match it
	{
		private _identifier = "";

		//Strip the mag class name to the bit between the first two _, result is caliber
		private _firstBoundary = (_x find "_")+1;
		private _secondBoundary = ((_x select [_firstBoundary]) find "_");
		
		_identifier = _x select [_firstBoundary,_secondBoundary];

		{
			_unit removeMagazines _x;
		} forEach (magazines _unit select { _x find _identifier >= 0 });
	} forEach (handgunMagazine _unit);

	_unit removeWeapon (handgunWeapon _unit);

	if (_weapon != "remove") then
	{
		[_unit,_magArray] call ARTR_fnc_giveMagazines;

		_unit addWeapon _weapon;

		{
			_unit addHandgunItem _x;
		} forEach _attachments;
	};
};

_ret;
