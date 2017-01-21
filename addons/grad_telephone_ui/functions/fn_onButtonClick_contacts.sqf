params ["_button","_display","_ctrlGrp"];

switch (tolower _button) do {
     case "select": {
          [_display,"contact_menu"] call grad_telephone_ui_fnc_initPage;
     };
     case "down": {
          //SCROLL DOWN
     };
     case "up": {
          //SCROLL UP
     };
};
