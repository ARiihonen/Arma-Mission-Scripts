//calculate which ending to show here, then remoteExec the ending on all clients

private _boxesDown = { !alive _x } count cargoBoxes;
private _boxesSaved = { alive _x && _x inArea tr_targetZone } count cargoBoxes;
private _boxesLost = { alive _x && !(_x inArea tr_targetZone) } count cargoBoxes;

private _ammoBoxesLost = { alive _x && !(_x inArea tr_targetZone) } count ammoBoxes;

//Win if no boxes or cars are lost and at least half are saved
private _ending = ["Loss","Win"] select (_boxesLost == 0 && _ammoBoxesLost == 0 && _boxesSaved >= (count cargoBoxes / 2));

if (_ending == "Win") then
{
	if (_boxesDown == 0) then
	{
		_ending = _ending + "Total";
	} else {
		_ending = _ending + "Partial";
	};

} else {

	if (_boxesLost == 0) then
	{
		_ending = _ending + "Amount";
	} else {

		if (_boxesLost >= (count cargoBoxes / 2)) then
		{
			_ending = _ending + "Total";
		} else {
			_ending = _ending + "Partial";
		};
	};

};


[_ending] remoteExecCall ["ARTR_fnc_clientEnding",0,false];
