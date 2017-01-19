params ["_up"];

player setVariable ["GRAD_telephone_currentState", "scrolling_mainmenu", true];

_selector = player getVariable ["GRAD_telephone_mainmenu_current",0];
_list = player getVariable ["GRAD_telephone_mainmenu",[]];

if (_up) then {
	_selector = _selector + 1;
	if (_selector > 1) then {_selector = 0;};
} else {
	_selector = _selector - 1;
	if (_selector < 0) then {_selector = 1;};
};


_nextEntryName = _list select _selector select 0;
_nextEntryNumber = _list select _selector select 1;

[_nextEntryName] call GRAD_fnc_setDisplayName;
[_nextEntryNumber] call GRAD_fnc_setDisplayNumber;

player setVariable ["GRAD_telephone_mainmenu_current",_selector];