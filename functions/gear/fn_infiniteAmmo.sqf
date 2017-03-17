params ["_unit","_container","_item"];
if ( _item find "556x45" > 0 || _item find "9x21" > 0) then
{
	player removeMagazines _item;
	player addMagazine _item;
};
