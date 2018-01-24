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

          private _phoneBook = [[player] call GRAD_telephone_fnc_getRadio] call GRAD_telephone_fnc_getPhonePhonebook;
          private _currentEntry = _phoneBook select _contactIndex;

          // ["1", "XiviD", "0160 7945321", false, objNull]
          _currentEntry params ["_targetRadioID", "_targetName", "_phoneNumber", "_isIED", "_targetObject"];

          switch (lbCurSel _lb) do {
               case 0: {
                    //CALL
                    if (_isIED) then {
                         [_targetName, _targetObject] call GRAD_telephone_fnc_callIED;
                    } else {
                         [_targetRadioID, _targetName, _targetObject] call GRAD_telephone_fnc_callDialing;
                    };
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
                    [_display, (_lb lbData (lbCurSel _lb)), [
                         (_display displayCtrl IDC_PHONEBOOK_VIEW_NAME),
                         (_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER),
                         (_display displayCtrl IDC_ENTERTEXT)
                    ]] spawn GRAD_Nokia3310_fnc_confirmAction;

                    [player, (lbCurSel _lb), "remove", _targetRadioID, player, _phoneNumber, _isIED] call GRAD_telephone_fnc_modifyPhonebook;
                    // [_display] call GRAD_Nokia3310_fnc_refreshPhonebook;

               };
          };
     };
};
