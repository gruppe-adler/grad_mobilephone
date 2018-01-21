player setVariable ["GRAD_telephone_currentState", "scrolling_settings", true];

_selector = player getVariable ["GRAD_telephone_menu_settings_current",0];
_list = player getVariable ["GRAD_telephone_menu_settings",[]];

_nextEntryName = _list select _selector;
_nextEntryNumber = _list select _selector;

[_nextEntryName] call GRAD_fnc_setDisplayName;
[_nextEntryNumber] call GRAD_fnc_setDisplayNumber;

player setVariable ["GRAD_telephone_menu_settings_current",_selector];