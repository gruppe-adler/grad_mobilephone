#include "..\macros_idc.hpp"
params ["_button"];

private _display = call GRAD_Nokia3310_fnc_displayGet;

private _curIndex = ((call GRAD_Nokia3310_fnc_historyGet) select 0) - 1;

switch (tolower _button) do {
     case "cancel": {
          ["home"] call GRAD_Nokia3310_fnc_initPage;
     };
     case "select": {
          [GRAD_Nokia3310_curSel] call GRAD_Nokia3310_fnc_initPage;
     };
     case "up";
     case "down": {
          private _nextIndex = if (tolower _button isEqualTo "down") then {_curIndex + 1} else {_curIndex - 1};

          [_nextIndex] call GRAD_Nokia3310_fnc_scroll_mainmenu;
     };
};
