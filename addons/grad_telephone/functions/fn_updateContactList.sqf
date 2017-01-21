private ["_contactList", "_name", "_object", "_phone"];

params ["_unit", "_mode", "_radioID", "_caller", "_number", "_isIED"];

_phone = [player] call GRAD_fnc_getRadio;

_contactList = _phone getVariable ["GRAD_telephone_contacts", []];

_name = name _caller;
_object = _caller;



//remove note
if (_mode == "remove") then {
    _selector = [_contactList, _number] call BIS_fnc_findNestedElement;

    _contactList set [_selector,"deletethis"];
    _contactList = _contactList - ["deletethis"];

    _phone setVariable ["GRAD_telephone_contacts", _contactList, true];
};

//add note
if (_mode == "add") then {
    _contactList = _contactList + [[_radioID, _name, _number, _isIED, _object]];
    _phone setVariable ["GRAD_telephone_contacts", _contactList, true];

    if (DEBUG_MODE) then { diag_log format ["updateContactList: updating with %1, %2, %3, %4, %5", _radioID, _name, _number, _isIED, _object]; };
};