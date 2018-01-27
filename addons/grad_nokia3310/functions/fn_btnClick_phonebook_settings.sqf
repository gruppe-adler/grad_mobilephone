#include "..\macros_idc.hpp"
params ["_button","_display"];

private _lb = _display displayCtrl IDC_PHONEBOOK_SETTINGS;

private _history = [_display] call GRAD_Nokia3310_fnc_history;

switch (tolower _button) do {
     case "cancel": {
          if ([player] call GRAD_telephone_fnc_isCalling) then {
               [] spawn GRAD_telephone_fnc_callEnding;
          };
               
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

          private _phoneBook = [player getVariable ["GRAD_telephone_phoneID",""]] call GRAD_telephone_fnc_getPhonebookForRadioID;
          private _currentEntry = _phoneBook select (_contactIndex - 1); // first entry is "new contact"

          // ["1", "XiviD", "0160 7945321", false, objNull]
          // 14:27:47 "_currentEntry is <null>"
          _currentEntry params ["_targetRadioID", "_targetName", "_phoneNumber", "_isIED", "_targetObject"];

          diag_log format ["_currentEntry is %1, _index is %2, _phoneBook is %3", _currentEntry, _contactIndex, _phoneBook];

          switch (lbCurSel _lb) do {
               case 0: {
                    //CALL
                    // diag_log format ["call wish detected"];
                    player setVariable ["GRAD_telephone_currentState", "dialing", true];
                    if (_isIED) then {
                         [_targetName, _targetObject] spawn GRAD_telephone_fnc_callIED;
                    } else {
                         [_targetRadioID, _targetName] spawn GRAD_telephone_fnc_callDialing;
                    };
                    [_display, _targetName] call GRAD_nokia3310_fnc_displayDialing;
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
                    //DELETE
                    [_display, (_lb lbData (lbCurSel _lb)), 
                         [
                              (_display displayCtrl IDC_PHONEBOOK_CONTACTS),
                              (_display displayCtrl IDC_HISTORY),
                              (_display displayCtrl IDC_ENTERTEXT)
                         ], 
                         [
                              (_display displayCtrl IDC_PHONEBOOK_SETTINGS)
                         ]
                    ] spawn GRAD_Nokia3310_fnc_confirmAction;

                    // get selected entry from phonebook
                    private _currentEntryIndex = (lbCurSel (_display displayCtrl IDC_PHONEBOOK_CONTACTS));
                    [player, _currentEntryIndex, "remove", _targetRadioID, player, _phoneNumber, _isIED] call GRAD_telephone_fnc_modifyPhonebook;
                    (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbDelete _currentEntryIndex;
                    
                    if (GRAD_TELEPHONE_DEBUG_MODE) then { 
                         diag_log format ["remove called with index: %1", _currentEntryIndex]; 
                    };

               };
          };
     };
};
