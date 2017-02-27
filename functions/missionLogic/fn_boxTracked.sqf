_box = _this;

_marker = _box getVariable "marker";
_action = _box getVariable "tracker_action";

_marker setMarkerColorLocal "colorGreen";
_box removeAction _action;
