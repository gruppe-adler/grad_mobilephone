#include "..\macros_idc.hpp"
#include "..\tones.hpp"

params ["_button","_display"];

private _curIndex = (([_display] call GRAD_Nokia3310_fnc_history) select 1) - 1;

if (ctrlShown (_display displayCtrl IDC_TONES_LIST)) exitWith {_this call GRAD_Nokia3310_fnc_btnClick_tones_list;};

switch (tolower _button) do {
     case "cancel": {
          [_display,"mainmenu"] call GRAD_Nokia3310_fnc_initPage;
     };
     case "select": {
          //show list and hide other controls
          (_display displayCtrl IDC_TONES_LIST) ctrlShow true;
          (_display displayCtrl IDC_TONES_SETTING) ctrlShow false;
          (_display displayCtrl IDC_TONES_VALUE) ctrlShow false;

          //fill list
          lbClear (_display displayCtrl IDC_TONES_LIST);
          {
               private _i = (_display displayCtrl IDC_TONES_LIST) lbAdd (_x select 0);
               (_display displayCtrl IDC_TONES_LIST) lbSetData [_i, (_x select 1)];

               if ((_x select 0) isEqualTo (ctrlText (_display displayCtrl IDC_TONES_VALUE))) then {
                    (_display displayCtrl IDC_TONES_LIST) lbSetCurSel _i;
               };
          } forEach GRAD_NOKIA3310_TONES;

          //update history and entertext
          (_display displayCtrl IDC_HISTORY) ctrlSetText format ["3-%1-%2",_curIndex + 1, (lbCurSel (_display displayCtrl IDC_TONES_LIST)) + 1];
          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "OK";
     };
     case "up";
     case "down": {
          private _nextIndex = if (tolower _button isEqualTo "down") then {_curIndex + 1} else {_curIndex - 1};
          [_display, _nextIndex] call GRAD_Nokia3310_fnc_scroll_tones;
     };
};
