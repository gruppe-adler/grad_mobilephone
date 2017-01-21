params ["_button","_display","_ctrlGrp"];

switch (tolower _button) do {
     case "select";
     case "down";
     case "up": {
          [_display,"mainmenu"] call grad_telephone_ui_fnc_initPage;
     };
     case "1";
     case "2";
     case "3";
     case "4";
     case "5";
     case "6";
     case "7";
     case "5";
     case "8";
     case "9";
     case "0": {
          [_display,"callnumber"] call grad_telephone_ui_fnc_initPage;
          (_display displayCtrl MISSING) ctrlSetText _button;
     };
};
