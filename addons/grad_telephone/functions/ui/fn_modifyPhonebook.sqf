/*

	adds or deletes contact entry

*/

private ["_phonebook", "_name", "_object", "_phoneID", "_phone"];

params ["_unit", "_mode", "_radioID", "_caller", "_number", "_isIED"];

_phoneID = [player] call GRAD_telephone_fnc_getRadio;

_publicPhoneBookForID = "GRAD_telephone_phonebook_" + _phoneID;

_phonebook = missionNamespace getVariable [_publicPhoneBookForID, []];

_name = name _caller;
_object = _caller;



//remove note
if (_mode == "remove") then {
    _selector = [_phonebook, _number] call BIS_fnc_findNestedElement;

    _phonebook set [_selector,"deletethis"];
    _phonebook = _phonebook - ["deletethis"];

    missionNamespace setVariable [_publicPhoneBookForID, _phonebook, true];
};

//add note
if (_mode == "add") then {
    _phonebook = _phonebook + [[_radioID, _name, _number, _isIED, _object]];
    
    missionNamespace setVariable [_publicPhoneBookForID, _phonebook, true];

    if (GRAD_TELEPHONE_DEBUG_MODE) then { diag_log format ["modifyPhonebook: updating with %1, %2, %3, %4, %5", _radioID, _name, _number, _isIED, _object]; };
};