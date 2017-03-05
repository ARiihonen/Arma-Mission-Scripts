_HCUnit = player;
_id = clientOwner;

diag_log format ["HCUnit: %1, ID: %2", _HCUnit, _id];
missionNamespace setVariable ["ARTR_AIController", _HCUnit, true];
missionNamespace setVariable ["ARTR_HCID", _id, true];
