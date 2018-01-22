#include "..\macros_idc.hpp"
params ["_button","_display"];

private _lb = _display displayCtrl IDC_PHONEBOOK_SETTINGS;

private _history = [_display] call GRAD_Nokia3310_fnc_history;

switch (tolower _button) do {
     case "cancel": {
          //hide settings and show contacts
          (_display displayCtrl IDC_PHONEBOOK_CONTACTS) ctrlShow true;
          _lb ctrlShow false;

          //update history and entertext
          (_display displayCtrl IDC_HISTORY) ctrlSetText format ["1-%1", (lbCurSel (_display displayCtrl IDC_PHONEBOOK_CONTACTS)) + 1];
          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Select";

     };
     case "up";
     case "down": {
          private _nextIndex = if (tolower _button isEqualTo "down") then {(lbCurSel _lb) + 1} else {(lbCurSel _lb) - 1};
          if (_nextIndex isEqualTo (lbSize _lb)) then {_nextIndex = 0;};
          if (_nextIndex isEqualTo -1) then {_nextIndex = (lbSize _lb) -1;};

          _lb lbsetCurSel _nextIndex;

          (_display displayCtrl IDC_HISTORY) ctrlSetText format ["1-%1-%2",(_history select 1), _nextIndex + 1];
     };
     case "select": {
          private _contactIndex = lbCurSel (_display displayCtrl IDC_PHONEBOOK_CONTACTS);
          private _contactName = (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbText _contactIndex;
          private _contactNumber = (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbData _contactIndex;

          switch (lbCurSel _lb) do {
               case 0: {
                    //CALL
               };
               case 1: {
                    //VIEW DETAILS
                    (_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlSetText _contactName;
                    (_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlSetText _contactNumber;

                    (_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlShow true;
                    (_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlShow true;

                    _lb ctrlShow false;
                    (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "";
               };
               case 2: {
                    //EDIT
               };
               case 3: {
                    //DELETE
               };
          };
     };
};
