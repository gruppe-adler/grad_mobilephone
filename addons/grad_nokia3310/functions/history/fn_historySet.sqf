params ["_text"];

private _display = call GRAD_Nokia3310_fnc_displayGet;

(_display displayCtrl IDC_HISTORY) ctrlSetText _text;

// save in history
missionNamespace setVariable ["GRAD_Nokia3310_curHistory", _text];
