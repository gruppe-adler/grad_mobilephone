private ["_result", "_selector", "_phonebook"];

params ["_ied"];

_phone = player getVariable ["GRAD_telephone_radioID", objNull];

_result = true;

_phonebook = _phone getVariable ["GRAD_telephone_phonebook", []];
_selector = [_phonebook, _ied] call BIS_fnc_findNestedElement;

if (count _selector > 0) then {
	_result = false;
};

_result