/*
Creates a diary record with optional variables to dynamically modify the briefing texts to conform to changing mission parameters.

Parameters:
	0: DiarySubject (defined elsewhere). STRING
	1: Record name. STRING
	2: File name in files/briefing STRING
	3: List of optional parameters to format the txt. ARRAY
*/

params [
	["_subject","Diary",[""]],
	["_name", "No Name", [""]],
	["_fileName", "Error.txt", [""]],
	["_optionals", [], [[]]]
];

private _filePath = "files\briefing\" + _fileName;

private _formatParams = "[LoadFile _filePath";
{
	_formatParams = format ['%1, "%2"', _formatParams, _x];
} forEach _optionals;
_formatParams = _formatParams + "]";

player createDiaryRecord [_subject, [_name, format (call compile _formatParams)]];
