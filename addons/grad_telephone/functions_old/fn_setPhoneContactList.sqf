params ["_phoneClassname", "_value"];

_string = "GRAD_telephone_" + _phoneClassname + "_phonebook";

missionNamespace setVariable [_string, _value];