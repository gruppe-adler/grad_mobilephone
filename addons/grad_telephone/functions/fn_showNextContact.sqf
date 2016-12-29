params ["_up"];

player setVariable ["GRAD_telephone_currentState", "scrolling", true];

_selector = player getVariable ["GRAD_telephone_contacts_current",0];
_list = player getVariable ["GRAD_telephone_contacts",[]];

_count = count _list;

if (_count < 1) exitWith {
	["default",3,"No Contacts :("] spawn GRAD_fnc_showHint;
};

if (_up) then {
	_selector = _selector + 1;

	if (_selector > (_count - 1)) then {_selector = 0;};

} else {
	_selector = _selector - 1;

	if (_selector < 0) then {_selector = (_count - 1);};
};

_nextEntryName = _list select _selector select 0;
_nextEntryNumber = _list select _selector select 1;

[_nextEntryName] call GRAD_fnc_setDisplayName;
[_nextEntryNumber] call GRAD_fnc_setDisplayNumber;

player setVariable ["GRAD_telephone_contacts_current",_selector];