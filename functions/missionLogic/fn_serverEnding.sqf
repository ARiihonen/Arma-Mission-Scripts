//Calculating endings for each team individually
diag_log format ["Balavu: %1", (evidenceBalavu + targetsBalavu)];
diag_log format ["Lijnhaven: %1", (evidenceLijnhaven + targetsLijnhaven)];
diag_log format ["Bluepearl: %1", (evidenceBluepearl + targetsBluepearl)];
diag_log format ["Roadhouse: %1", (evidenceRoadhouse + targetsRoadhouse)];

[(evidenceBalavu + targetsBalavu), group_balavu, "tsk_balavu"] spawn ARTR_fnc_groupEnding;
[(evidenceLijnhaven + targetsLijnhaven), group_lijnhaven, "tsk_lijnhaven"] spawn ARTR_fnc_groupEnding;
[(evidenceBluepearl + targetsBluepearl), group_bluepearl, "tsk_bluepearl"] spawn ARTR_fnc_groupEnding;
[(evidenceRoadhouse + targetsRoadhouse), group_roadhouse, "tsk_roadhouse"] spawn ARTR_fnc_groupEnding;