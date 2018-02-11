params ["_button","_params"];
_params params ["_ctrl"];

private _display = ctrlParent _ctrl;

switch (toLower GRAD_Nokia3310_curPage) do {
     case "home": {
          [_button, _display] call GRAD_Nokia3310_fnc_btnClick_home;
     };
     case "mainmenu": {
          [_button, _display] call GRAD_Nokia3310_fnc_btnClick_mainMenu;
     };
     case "tones": {
          [_button, _display] call GRAD_Nokia3310_fnc_btnClick_tones;
     };
     case "settings": {
          [_button, _display] call GRAD_Nokia3310_fnc_btnClick_settings;
     };
     case "phonebook": {
          [_button, _display] call GRAD_Nokia3310_fnc_btnClick_phonebook;
     };
     case "alarm": {
          [_button, _display] call GRAD_Nokia3310_fnc_btnClick_alarm;
     };
};

if (!isMultiplayer) then {
     diag_log format ["........................................"];
     diag_log format ["grad_nokia3310: btn click %1", _button];
     diag_log format ["........................................"];
};