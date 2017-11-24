if (isServer) then
{
    private _unitsAmount = ceil(playersNumber resistance/4);

    private _marksmenAmount = 2;
    private _patrolAmount = floor(_unitsAmount/2);
    private _staticsAmount = ceil(_unitsAmount/2);

    marksmen_balavu = [7,_marksmenAmount] call ARTR_fnc_presenceArray;
    patrols_balavu = [10,_patrolAmount] call ARTR_fnc_presenceArray;
    statics_balavu = [18,_staticsAmount] call ARTR_fnc_presenceArray;

    reinforceOne_balavu = selectRandom [0,1];
    reinforceTwo_balavu = selectRandom [0,1];
    reinforceThree_balavu = selectRandom [0,1];
    reinforceFour_balavu = selectRandom [0,1];

    marksmen_lijnhaven = [15,_marksmenAmount] call ARTR_fnc_presenceArray;
    patrols_lijnhaven = [12,_patrolAmount] call ARTR_fnc_presenceArray;
    statics_lijnhaven = [33,_staticsAmount] call ARTR_fnc_presenceArray;

    reinforceOne_lijnhaven = selectRandom [0,1,2];
    reinforceTwo_lijnhaven = selectRandom [0,1,2];
    reinforceThree_lijnhaven = selectRandom [0,1,2];
    reinforceFour_lijnhaven = selectRandom [0,1,2];
    
    marksmen_bluepearl = [35,_marksmenAmount] call ARTR_fnc_presenceArray;
    patrols_bluepearl = [16,_patrolAmount] call ARTR_fnc_presenceArray;
    statics_bluepearl = [45,_staticsAmount] call ARTR_fnc_presenceArray;

    reinforceOne_bluepearl = selectRandom [0,1];
    reinforceTwo_bluepearl = selectRandom [0,1];
    reinforceThree_bluepearl = selectRandom [0,1];
    reinforceFour_bluepearl = selectRandom [0,1];

    marksmen_roadhouse = [12,_marksmenAmount] call ARTR_fnc_presenceArray;
    patrols_roadhouse = [14,_patrolAmount] call ARTR_fnc_presenceArray;
    statics_roadhouse = [38,_staticsAmount] call ARTR_fnc_presenceArray;

    reinforceOne_roadhouse = selectRandom [0,1,2];
    reinforceTwo_roadhouse = selectRandom [0,1,2];
    reinforceThree_roadhouse = selectRandom [0,1,2];
    reinforceFour_roadhouse = selectRandom [0,1,2];


    completedAreas = [];
};

if (isServer || (!isServer && !hasInterface)) then
{
    reinforcementsOne = [];
    reinforcementsTwo = [];
    reinforcementsThree = [];
    reinforcementsFour = [];
};

targetsBalavu = [];
targetsLijnhaven = [];
targetsBluepearl = [];
targetsRoadhouse = [];

evidenceBalavu = [];
evidenceLijnhaven = [];
evidenceBluepearl = [];
evidenceRoadhouse = [];