params ["_button","_display","_ctrlGrp"];

switch (tolower _button) do {
     case "cancel": {
          [_display,"main"] call grad_telephone_ui_fnc_initPage;
     };
     case "select": {

     };
};
