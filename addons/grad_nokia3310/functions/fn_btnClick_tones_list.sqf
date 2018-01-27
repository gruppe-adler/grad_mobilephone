#include "..\macros_idc.hpp"
#include "..\tones.hpp"

params ["_button","_display"];

private _lb = _display displayCtrl IDC_TONES_LIST;

private _history = [_display] call GRAD_Nokia3310_fnc_history;

if (player getVariable ["GRAD_telephone_displayBusy",false]) exitWith {};

switch (tolower _button) do {
     case "cancel": {
          player setVariable ["GRAD_telephone_listenSoundPreview",false];

          // reset progress in scrollview
          _lb lbsetCurSel 0;

          _lb ctrlShow false;
          (_display displayCtrl IDC_TONES_SETTING) ctrlShow true;
          (_display displayCtrl IDC_TONES_VALUE) ctrlShow true;

          (_display displayCtrl IDC_HISTORY) ctrlSetText format ["3-%1",(_history select 1)];
          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Select";
     };
     case "up";
     case "down": {
          player setVariable ["GRAD_telephone_listenSoundPreview",false];

          private _nextIndex = if (tolower _button isEqualTo "down") then {(lbCurSel _lb) + 1} else {(lbCurSel _lb) - 1};
          if (_nextIndex isEqualTo (lbSize _lb)) then {_nextIndex = 0;};
          if (_nextIndex isEqualTo -1) then {_nextIndex = (lbSize _lb) -1;};

          _lb lbsetCurSel _nextIndex;

          (_display displayCtrl IDC_HISTORY) ctrlSetText format ["3-%1-%2",(_history select 1), _nextIndex + 1];
          
          [{
               _this call GRAD_Nokia3310_fnc_soundPlayPreview;
          }, (_lb lbData _nextIndex), 0.5] call CBA_fnc_waitAndExecute;
     };
     case "select": {
          // stop sound preview
          player setVariable ["GRAD_telephone_listenSoundPreview",false];
          
          // start confirm action animation
          [_display, (_lb lbData (lbCurSel _lb)), [
               _display displayCtrl IDC_TONES_LIST,
               _display displayCtrl IDC_HISTORY,
               _display displayCtrl IDC_ENTERTEXT
          ]] spawn GRAD_Nokia3310_fnc_confirmAction;

          //diag_log format ["IDC_TONES_SETTING is %1", (ctrlText (_display displayCtrl IDC_TONES_SETTING))];

          private _radioID = [player] call GRAD_telephone_fnc_getRadio;

          switch (ctrlText (_display displayCtrl IDC_TONES_SETTING)) do {
               case "Ringing tone": {
                    // save for future uses
                    [_radioID, GRAD_NOKIA3310_TONES select (lbCurSel _lb)] call GRAD_telephone_fnc_setRingToneForPhoneID;
                    // update display instantly
                    (_display displayCtrl IDC_TONES_VALUE) ctrlSetText (GRAD_NOKIA3310_TONES select (lbCurSel _lb) select 0);
               };
               case "Alarm \ntone": {
                    // save for future uses
                    [_radioID, GRAD_NOKIA3310_TONES select (lbCurSel _lb)] call GRAD_telephone_fnc_setAlarmToneForPhoneID;
                    // update display instantly
                    (_display displayCtrl IDC_TONES_VALUE) ctrlSetText (GRAD_NOKIA3310_TONES select (lbCurSel _lb) select 0);
               };
          };
     };
};
