params ["_display", "_text"];

(_display displayCtrl IDC_HISTORY) ctrlSetText _text;

// save in history
missionNamespace setVariable ["GRAD_Nokia3310_curHistory", _text];