private ["_contactList", "_target", "_number", "_result"];

params ["_target", "_number"];

_result = false;

_contactList = _target getVariable ["GRAD_telephone_contacts", []];

_array = [_contactList, _number] call BIS_fnc_findNestedElement;

if (count _array > 0) then {
	_result = true;
};

_result