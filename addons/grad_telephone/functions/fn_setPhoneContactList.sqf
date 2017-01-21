params ["_phoneClassname", "_value"];

_string = "GRAD_telephone_" + _phoneClassname + "_contactList";

missionNamespace setVariable [_string, _value];