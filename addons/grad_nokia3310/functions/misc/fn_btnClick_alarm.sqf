#include "..\macros_idc.hpp"
params ["_button"];

private _display = call GRAD_Nokia3310_fnc_displayGet;

switch (tolower _button) do {
     case "cancel": {
          ["mainmenu"] call GRAD_Nokia3310_fnc_initPage;
     };
     case "select": {

     };
     case "down": {
          private _editCtrl = _display displayCtrl IDC_ALARM_SET_EDIT;
          private _textCtrl = _display displayCtrl IDC_ALARM_SET_TEXT;

          private _text = toArray (ctrlText _editCtrl);
          if (_text select ((count _text) -1) isEqualTo 124) then {_text deleteAt ((count _text) -1);};

          _text deleteAt ((count _text) -1);
          _editCtrl ctrlSetStructuredText parseText format ["<t color='#ffff00' size='%1'>%2</t>",0.03798 * NOKIA_H,toString _text];
     };
     case "up": {
          private _editCtrl = _display displayCtrl IDC_ALARM_SET_EDIT;
          private _textCtrl = _display displayCtrl IDC_ALARM_SET_TEXT;


          private _text = toArray (ctrlText _editCtrl);
          if (_text select ((count _text) -1) isEqualTo 124) then {_text deleteAt ((count _text) -1);};
          private _char = (toArray (ctrlText _textCtrl)) select (count _text);

          _text pushBack _char;

          _editCtrl ctrlSetStructuredText parseText (toString _text);

     };
};
