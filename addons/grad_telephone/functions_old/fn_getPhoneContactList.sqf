private ["_return"];

params ["_phoneClassname"];

_string = "GRAD_telephone_" + _phoneClassname + "_phonebook";

_return = missionNamespace getVariable [_string, []];

_return