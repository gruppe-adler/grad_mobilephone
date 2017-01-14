private ["_result", "_selector", "_contactList"];

params ["_ied"];

_result = true;

_contactList = _unit getVariable ["GRAD_telephone_contacts", []];
_selector = [_contactList, _ied] call BIS_fnc_findNestedElement;

if (count _selector > 0) then {
	_result = false;
};

_result