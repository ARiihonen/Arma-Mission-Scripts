params ["_box","_type"];

private _inventoryContents = [];

switch (_type) do
{
	case "Mortar":
	{

	};

	case "HMG":
	{

	};

	case "Explosives":
	{

	};

	case "Launchers":
	{

	};

	case "Medical":
	{

	};
};

private _index = 0;

while ( _box canAdd (_inventoryContents select _index) ) do
{
	_box addItemCargoGlobal [_inventoryContents select _index, 1];

	if (_index == (count _inventoryContents - 1)) then
	{
		_index = 0;
	} else {
		_index = _index + 1;
	};
};
