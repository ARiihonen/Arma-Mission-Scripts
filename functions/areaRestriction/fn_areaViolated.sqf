private _warning_text = [(selectRandom ["THIS IS FUTILE", "HA HA HA HA HA", "WASTING YOUR TIME", "UNPRODUCTIVE"]), "YOU WERE WARNED"] select (player getVariable ["hades",false]);
private _scum_text = selectRandom ["SCUM", "VERMIN", "PEST"];

private _warned = 1 cutText [_warning_text, "WHITE OUT", 0.1, true];
player setPos [0,0,0];
player setVariable ["hades", true, true];
sleep 1;
private _scum = 2 cutText [_scum_text, "WHITE OUT", 0.1, true];
1 cutFadeOut 1;
2 cutFadeOut 0.2;
