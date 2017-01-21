params ["_button","_params"];
_params params ["_ctrl"];

private _display = ctrlParent _ctrl;

switch (toLower grad_telephone_ui_curPage) do {
     case "callIncoming": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_callIncoming;
     };
     case "callnumber": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_callNumber;
     };
     case "callOutgoing": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_callOutgoing;
     };
     case "contact_menu": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_contact_menu;
     };
     case "contacts": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_contacts;
     };
     case "main": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_main;
     };
     case "mainmenu": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_mainMenu;
     };
     case "newcontact": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_newContact;
     };
     case "settings": {
          private _ctrlGroup = _display displayCtrl MISSING;
          [_button, _display, _ctrlGroup] call grad_telephone_ui_fnc_onButtonClick_settings;
     };
};
