/*
Creates a diary record with optional variables to dynamically modify the briefing texts to conform to changing mission parameters.

Parameters:
	0: DiarySubject (defined elsewhere). STRING
	1: Record name. STRING
	2: File path to .txt file. STRING
	3: List of optional parameters to format the txt. ARRAY
*/

_subject = param [0, 'Diary', ['']];
_name = param [1, 'No Name', ['']];
_filePath = param [2, 'Error.txt', ['']];
_optionals = param [3, [], [[]], []];

_filePath = format ['files\briefing\%1', _filePath];

_formatParams = '[LoadFile _filePath';
{
	_formatParams = format ['%1, "%2"', _formatParams, _x];
} forEach _optionals;
_formatParams = format ['%1]', _formatParams];

player createDiaryRecord [_subject, [_name, format (call compile _formatParams)]];
