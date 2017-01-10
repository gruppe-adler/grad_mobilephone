private ["_contactList"];

params ["_unit", "_mode", "_radioID", "_name", "_number"];

_contactList = _unit getVariable ["GRAD_telephone_contacts", []];

//remove note
if (_mode == "remove") then {
    _selector = [_contactList, _number] call BIS_fnc_findNestedElement;

    _contactList set [_selector,"deletethis"];
    _contactList = _contactList - ["deletethis"];

    _unit setVariable ["GRAD_telephone_contacts", _contactList, true];
};

//add note
if (_mode == "add") then {
    _contactList = _contactList + [[_radioID, _name, _number]];
    _unit setVariable ["GRAD_telephone_contacts", _contactList, true];
};