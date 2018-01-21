params ["_up"];

player setVariable ["GRAD_telephone_currentState", "scrolling_menu_main", true];

_selector = player getVariable ["GRAD_telephone_menu_main_current",0];
_list = player getVariable ["GRAD_telephone_menu_main",[]];

if (_up) then {
	_selector = _selector + 1;
	if (_selector > 1) then {_selector = 0;};
} else {
	_selector = _selector - 1;
	if (_selector < 0) then {_selector = 1;};
};


_nextEntryName = _list select _selector;
_nextEntryNumber = _list select _selector;

[_nextEntryName] call GRAD_telephone_fnc_setDisplayName;
[_nextEntryNumber] call GRAD_telephone_fnc_setDisplayNumber;

player setVariable ["GRAD_telephone_menu_main_current",_selector];