if (missionNamespace getVariable ["noInfilMarker", true]) then {
	_marker = createMarkerLocal ["mrk_infil", getPosWorld infiltration];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "hd_marker";
	_marker setMarkerColorLocal "colorOPFOR";

	missionNamespace setVariable ["noInfilMarker", false, true];
} else {
	"mrk_infil" setMarkerPos (getPosWorld infiltration);
};
