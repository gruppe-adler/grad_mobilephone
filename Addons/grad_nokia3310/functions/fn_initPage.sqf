#include "..\macros_idc.hpp"
params ["_display","_newPage"];
private _oldPage = GRAD_Nokia3310_curPage;

GRAD_Nokia3310_curPage = _newPage;

//save history
private _history = [_display] call GRAD_Nokia3310_fnc_history;

//reset to default
switch (toLower _oldPage) do {
     case "home": {
          (_display displayCtrl IDC_CTRLGROUP_HOME) ctrlShow false;
     };
     case "mainmenu": {
          (_display displayCtrl IDC_CTRLGROUP_MAINMENU) ctrlShow false;
     };
     case "tones": {
          (_display displayCtrl IDC_CTRLGROUP_TONES) ctrlShow false;
     };
     case "phonebook": {
          (_display displayCtrl IDC_CTRLGROUP_PHONEBOOK) ctrlShow false;
     };
     case "alarm": {
          (_display displayCtrl IDC_CTRLGROUP_ALARM) ctrlShow false;
     };
};
//init new page
switch (toLower _newPage) do {
     case "home": {
          (_display displayCtrl IDC_CTRLGROUP_HOME) ctrlShow true;
          (_display displayCtrl IDC_CTRLGROUP_HOME) ctrlEnable false;

          (_display displayCtrl IDC_HISTORY) ctrlSetText "";
          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Menu";

          (_display displayCtrl IDC_HOME_CARRIER) ctrlSetText "GRAD_Nokia3310\data\dialog\home\carrier_5_ca.paa";
          (_display displayCtrl IDC_HOME_BATTERY) ctrlSetText "GRAD_Nokia3310\data\dialog\home\battery_full_ca.paa";
     };
     case "mainmenu": {
          (_display displayCtrl IDC_CTRLGROUP_MAINMENU) ctrlShow true;
          (_display displayCtrl IDC_CTRLGROUP_MAINMENU) ctrlEnable false;

          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Select";

          private _index = if (_history isEqualTo []) then {0} else {(_history select 0) - 1};

          [_display,_index] call GRAD_Nokia3310_fnc_scroll_mainmenu;
     };
     case "tones": {
          (_display displayCtrl IDC_CTRLGROUP_TONES) ctrlShow true;
          (_display displayCtrl IDC_CTRLGROUP_TONES) ctrlEnable false;

          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Select";

          (_display displayCtrl IDC_TONES_LIST) ctrlShow false;

          private _index = if (count _history isEqualTo 1) then {0} else {(_history select 1) - 1};

          [_display, _Index] call GRAD_Nokia3310_fnc_scroll_tones;
     };
     case "phonebook": {
          (_display displayCtrl IDC_CTRLGROUP_PHONEBOOK) ctrlShow true;
          (_display displayCtrl IDC_CTRLGROUP_PHONEBOOK) ctrlEnable false;

          (_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Select";

          (_display displayCtrl IDC_PHONEBOOK_SETTINGS) ctrlShow false;
          (_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlShow false;
          (_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlShow false;

          //fill contacts
          private _contacts = [
               ["nomisum","000000000000"],
               ["X to the iviD","111111111111"],
               ["Z to the arrck","222222222222"],
               ["Dukes Keller","333333333333"],
               ["Slant","444444444444"],
               ["McDiod","555555555555"],
               ["Salbei","666666666666"],
               ["Fridelcastro (aka McDiod 2.0)","777777777777"],
               ["Simmax","888888888888"],
               ["Fussel","999999999999"]
          ];
          
          lbClear (_display displayCtrl IDC_PHONEBOOK_CONTACTS);
          (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbAdd "<New contact>";
          {
               private _i = (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbAdd (_x select 0);
               (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbSetData [_i,(_x select 1)];
          } forEach _contacts;

          //fill settings
          lbClear (_display displayCtrl IDC_PHONEBOOK_SETTINGS);
          {
               (_display displayCtrl IDC_PHONEBOOK_SETTINGS) lbAdd _x;
          } forEach ["Call Contact", "View Details", "Edit Contact", "Delete Contact"];

          private _index = if (count _history isEqualTo 1) then {0} else {(_history select 1)};
          (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbsetCurSel _index;
          (_display displayCtrl IDC_HISTORY) ctrlSetText format ["1-%1",_index + 1];
     };
     case "alarm": {
          (_display displayCtrl IDC_CTRLGROUP_ALARM) ctrlShow true;
          (_display displayCtrl IDC_CTRLGROUP_PHONEBOOK) ctrlEnable false;

          (_display displayCtrl IDC_ALARM_SET_TEXT) ctrlSetText "hh:mm";
          (_display displayCtrl IDC_ALARM_SET_EDIT) ctrlSetText "hh:mm";
          ctrlSetFocus (_display displayCtrl IDC_ALARM_SET_EDIT);

          handle1 = [_display,IDC_ALARM_SET_EDIT] spawn {
               disableSerialization;
               params ["_disp","_idc"];
               private _shownCursor = false;
               while {true} do {
                    private _text = toArray (ctrlText (_disp displayCtrl _idc));
                    if (_shownCursor) then {_text deleteAt (count _text -1);};
                    private _char = _text deleteAt (count _text -1);
                    _char = if (isNil "_char") then {""} else {toString [_char]};
                    _text = toString _text;
                    systemChat str [_text,_char,_shownCursor];
                    if (_shownCursor) then {
                         _text = format ["<t color='#00ffffff'>%1<t size='0.7'>%2</t></t>",_text,_char];
                    } else {
                         _text = format ["<t color='#00ffffff'>%1<t size='0.7'>%2</t></t><t color='#BF000000'>|</t>",_text,_char];
                    };
                    (_disp displayCtrl _idc) ctrlSetStructuredText parseText _text;
                    _shownCursor = !_shownCursor;
                    sleep 0.5;
               };
          };
     };
};
