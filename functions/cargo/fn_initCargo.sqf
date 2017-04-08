if (isServer) then
{
	private _availableItemTypes = ["Mortar","HMG","Explosives","Launchers","Medical"];

	{
		if (count _availableItemTypes <= 0) then { _availableItemTypes = ["Mortar","HMG","Explosives","Launchers","Medical"]; };

		private _itemType = selectRandom _availableItemTypes;
		_availableItemTypes deleteAt (_availableItemTypes find _itemType);

		[_x,_itemType] call ARTR_fnc_fillCargo;
	} forEach cargoBoxes;
};

//["Mortar","HMG","Explosives","Launchers","Medical"];
