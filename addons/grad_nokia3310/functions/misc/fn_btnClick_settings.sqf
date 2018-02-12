#include "..\macros_idc.hpp"
#include "..\tones.hpp"

params ["_button"];

private _display = call GRAD_Nokia3310_fnc_displayGet;

private _curIndex = ((call GRAD_Nokia3310_fnc_history) select 1) - 1;

switch (tolower _button) do {
     case "cancel": {
          ["mainmenu"] call GRAD_Nokia3310_fnc_initPage;
     };
     case "select": {
          //update history and entertext
          [format ["1-%1-1", (lbCurSel _lb) + 1]] call GRAD_Nokia3310_fnc_historySet;
          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "OK";

          (_display displayCtrl IDC_SETTINGS_SETTING) ctrlShow false;
          (_display displayCtrl IDC_SETTINGS_VALUE) ctrlShow false;
     };
     case "up";
     case "down": {
          private _nextIndex = if (tolower _button isEqualTo "down") then {_curIndex + 1} else {_curIndex - 1};
          [_nextIndex] call GRAD_Nokia3310_fnc_scroll_settings;
     };
};
