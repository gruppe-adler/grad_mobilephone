player getVariable  ["GRAD_telephone_menu_main_current",0];

player setVariable ["GRAD_telephone_currentState", "scrolling_menu_main", true];

_selector = player getVariable ["GRAD_telephone_menu_main_current",0];
_list = player getVariable ["GRAD_telephone_menu_main",[]];

_nextEntryName = _list select _selector;
_nextEntryNumber = _list select _selector;

[_nextEntryName] call GRAD_fnc_setDisplayName;
[_nextEntryNumber] call GRAD_fnc_setDisplayNumber;

player setVariable ["GRAD_telephone_menu_main_current",_selector];