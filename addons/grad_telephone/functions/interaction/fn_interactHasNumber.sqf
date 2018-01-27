private ["_phonebook", "_target", "_number", "_result"];

params ["_target", "_number"];

_result = false;

_phonebook = [_target getVariable ["GRAD_telephone_phoneID", ""]] call GRAD_telephone_fnc_getPhonebookForRadioID;

_array = [_phonebook, _number] call BIS_fnc_findNestedElement;

if (count _array > 0) then {
	_result = true;
};

_result