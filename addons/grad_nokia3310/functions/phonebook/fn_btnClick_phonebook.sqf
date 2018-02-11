#include "..\macros_idc.hpp"
params ["_button","_display"];

private _lb = _display displayCtrl IDC_PHONEBOOK_CONTACTS;

private _history = [_display] call GRAD_Nokia3310_fnc_historyGet;

if (ctrlShown (_display displayCtrl IDC_PHONEBOOK_SETTINGS)) exitWith {
          _this call GRAD_Nokia3310_fnc_btnClick_phonebook_settings;
};

if (ctrlShown (_display displayCtrl IDC_PHONEBOOK_VIEW_NAME)) exitWith {
     if (tolower _button isEqualTo "cancel") then {

          (_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlShow false;
          (_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlShow false;

          (_display displayCtrl IDC_PHONEBOOK_SETTINGS) ctrlShow true;
          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "OK";
     };
};

switch (tolower _button) do {
     case "cancel": {
          [_display,"mainmenu"] call GRAD_Nokia3310_fnc_initPage;
     };
     case "select": {
          if (lbCurSel _lb isEqualTo 0) then {
               // todo create new contact manually
          } else {
               //show settings and hide contacts
               (_display displayCtrl IDC_PHONEBOOK_SETTINGS) ctrlShow true;
               (_display displayCtrl IDC_PHONEBOOK_SETTINGS) lbSetCurSel 0;
               _lb ctrlShow false;

               //update history and entertext
               [_display, format ["1-%1-1", (lbCurSel _lb) + 1]] call GRAD_Nokia3310_fnc_historySet;
               (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "OK";
          };
     };
     case "up";
     case "down": {
          private _nextIndex = if (tolower _button isEqualTo "down") then {(lbCurSel _lb) + 1} else {(lbCurSel _lb) - 1};
          if (_nextIndex isEqualTo (lbSize _lb)) then {_nextIndex = 0;};
          if (_nextIndex isEqualTo -1) then {_nextIndex = (lbSize _lb) -1;};

          _lb lbsetCurSel _nextIndex;

          [_display, format ["1-%1", _nextIndex + 1]] call GRAD_Nokia3310_fnc_historySet;
     };
};
