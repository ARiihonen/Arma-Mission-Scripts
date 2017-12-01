private _reinforceWave = missionNamespace getVariable ["reinforcementWave", 1];
missionNamespace setVariable ["reinforcementWave",_reinforceWave + 1];

private _reinforcements = [];
switch _reinforceWave do
{
    case 1: { _reinforcements = reinforcementsOne; };
    case 2: { _reinforcements = reinforcementsTwo; };
    case 3: { _reinforcements = reinforcementsThree; };
    case 4: { _reinforcements = reinforcementsFour; };
    default {};
};

{
    _x hideObjectGlobal false;
    _x enableAI "ALL";
    _x setVariable ["ARTR_activeEnemy", true, true];
} forEach _reinforcements;