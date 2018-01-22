player setVariable ["GRAD_telephone_currentState", "scrolling_contacts", true];

_selector = player getVariable ["GRAD_telephone_menu_contacts_current",0];
_list = player getVariable ["GRAD_telephone_menu_contacts",[]];

_nextEntryName = _list select _selector;
_nextEntryNumber = _list select _selector;

[_nextEntryName] call GRAD_fnc_setDisplayName;
[_nextEntryNumber] call GRAD_fnc_setDisplayNumber;

player setVariable ["GRAD_telephone_menu_contacts_current",_selector];