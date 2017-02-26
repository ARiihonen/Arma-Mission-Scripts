
if (!(1 in buildings)) then	{ deleteMarker "mrk_buildingOne"; };
if (!(2 in buildings)) then { deleteMarker "mrk_buildingTwo"; };

if (isServer) then
{
	{
		_index = str(_forEachIndex);
		_markerName = format ["mrk_fenceOpening_%1", _index];

		_newMarker = createMarker [_markerName,getPos _x];
		_newMarker setMarkerShape "ICON";
		_newMarker setMarkerColor "ColorRed";
		_newMarker setMarkerType "mil_dot";
	} forEach brokenFenceObjects;
};
