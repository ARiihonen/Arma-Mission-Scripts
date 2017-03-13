params [
	["_unit", player, [objNull]]
];


private _ACEAdvGear = [
	["ACE_fieldDressing", 6],
	["ACE_packingBandage", 6],
	["ACE_epinephrine", 2],
	["ACE_morphine", 2],
	["ACE_tourniquet", 2]
];
private _ACEAdvMedicGear = [
	["ACE_fieldDressing", 15],
	["ACE_packingBandage", 15],
	["ACE_elasticBandage", 15],
	["ACE_quikclot", 15],
	["ACE_epinephrine", 10],
	["ACE_morphine", 10],
	["ACE_atropine", 10],
	["ACE_tourniquet", 5],
	["ACE_bloodIV_500", 8]
];


private _basicGear = [];
private _medicGear = [];

if (missionNamespace getVariable ["ace_medical_level",0] == 2) then
{
	{
		_item = _x select 0;
		_amount = _x select 1;

		while { {_x == _item} count uniformItems _unit < _amount} do {
			_unit addItemToUniform _item;
		};
	} forEach _ACEAdvGear;

	if (["medic", typeOf _unit] call BIS_fnc_inString ) then {
		{
			_item = _x select 0;
			_amount = _x select 1;

			while { {_x == _item} count backpackItems _unit < _amount} do {
				_unit addItemToBackpack _item;
			};
		} forEach _ACEAdvMedicGear;
	};
};

//Earplugs
if (missionNamespace getVariable ["ace_hearing_enableCombatDeafness",false]) then
{
	_unit addItemToUniform "ACE_EarPlugs";
};
