if (isServer) then
{
	switch (missionNamespace getVariable ["gearSelection", "default"]) do
	{
		case "RHSUSF":
		{
			diag_log "RHS VEHICLES STARTED";
			[cargoHelo,"RHS_UH60M","cargoHelo"] call ARTR_fnc_switchVehicle;
			[littleBird,"RHS_MELB_AH6M_L","littleBird"] call ARTR_fnc_switchVehicle;
			{
				private _name = format["GVEH_%1",_forEachIndex];
				[_x,"rhsusf_rg33_usmc_wd",_name] call ARTR_fnc_switchVehicle;
			} forEach groundVehicles;
		};

		case "RHSAFRF":
		{
			diag_log "RHS RUSSIA STARTED";
			[cargoHelo,"RHS_Mi8mt_vdv","cargoHelo"] call ARTR_fnc_switchVehicle;
			[littleBird,"O_Heli_Light_02_v2_F","littleBird"] call ARTR_fnc_switchVehicle;
			{
				private _name = format["GVEH_%1",_forEachIndex];
				[_x,"rhs_tigr_m_vdv",_name] call ARTR_fnc_switchVehicle;
			} forEach groundVehicles;
		};

		case "BAF":
		{
			diag_log "BRITS STARTED";
			[cargoHelo,"UK3CB_BAF_Merlin_HC3_18_GPMG_DPMT","cargoHelo"] call ARTR_fnc_switchVehicle;
			[littleBird,"UK3CB_BAF_Wildcat_AH1_CAS_8A_DPMT","littleBird"] call ARTR_fnc_switchVehicle;
			{
				private _name = format["GVEH_%1",_forEachIndex];
				[_x,"UK3CB_BAF_LandRover_Hard_FFR_Green_B_DPMT",_name] call ARTR_fnc_switchVehicle;
			} forEach groundVehicles;
		};
	};
};
