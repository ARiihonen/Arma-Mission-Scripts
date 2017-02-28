//create camera
call ARTR_fnc_createUAV;

//add UAV camera action
_cam_action = player addAction [
	"<t color='#AAAAEE'>View UAV camera</t>",
	"call ARTR_fnc_viewUAV;",
	"",
	0,
	false,
	true,
	"",
	"!(missionNamespace getVariable ['uav_done', false])"
];
