private ["_phoneID", "_result", "_selector", "_phonebook"];

params ["_ied"];

_phoneID = player getVariable ["GRAD_telephone_phoneID", ""];

_result = true;

_phonebook = [_phoneID] call GRAD_telephone_fnc_getPhonebookForRadioID;
_selector = [_phonebook, _ied] call BIS_fnc_findNestedElement;

if (count _selector > 0) then {
	_result = false;
};

_result