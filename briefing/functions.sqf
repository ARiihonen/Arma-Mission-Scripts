caran_briefingFile = {
	
	_subject = param [0, 'Diary', ['']];
	_name = param [1, 'No Name', ['']];
	_filePath = param [2, 'Error.txt', ['']];
	_optionals = param [3, [], [[]], []];
	
	_filePath = format ['briefing\files\%1', _filePath];

	_formatParams = '[LoadFile _filePath';
	{
		_formatParams = format ['%1, "%2"', _formatParams, _x];
	} forEach _optionals;
	_formatParams = format ['%1]', _formatParams];
	
	player createDiaryRecord [_subject, [_name, format (call compile _formatParams)]];	
};