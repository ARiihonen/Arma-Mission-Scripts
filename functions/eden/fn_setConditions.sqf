/*
Set incrementing, array-format conditions of existence on all selected objects in Eden. Shows the final added value in both system chat and diag_log to help preinit setup.

Params:
	0: Variable name of the condition array. STRING
	1: (Optional) Counter start position. INT
	2: (Optional) Selection method. "object" or "group"

	EXAMPLE: ["proceduralDudes", 60, "group"] call ARTR_fnc_setConditions;
*/

params[
	["_var_name","presenceArray",[""]],
	["_counter",0,[0]],
	["_selection", "object", [""]]
];

collect3DENHistory {

    switch (_selection) do
    {
        case "group":
        {
            {
                _counter = _counter + 1;
                {
                    _x set3DENAttribute ["presenceCondition", format ["%1 in %2", _counter, _var_name]];
                } forEach (units _x);
            } forEach get3DENSelected "group";
        };

        default
        {
            {
                _counter = _counter + 1;
                _x set3DENAttribute ["presenceCondition", format ["%1 in %2", _counter, _var_name]];
            } forEach get3DENSelected "object";
        };
    };
};

diag_log ("Conditions set for " +  _var_name + ", last value: " + (str _counter));
copyToClipboard str _counter;
