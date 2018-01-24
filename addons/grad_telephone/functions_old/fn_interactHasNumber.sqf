private ["_phonebook", "_target", "_number", "_result"];

params ["_target", "_number"];

_result = false;

_phonebook = (_target getVariable ["GRAD_telephone_radioID", objNull]) getVariable ["GRAD_telephone_phonebook", []];


_array = [_phonebook, _number] call BIS_fnc_findNestedElement;

if (count _array > 0) then {
	_result = true;
};

_result