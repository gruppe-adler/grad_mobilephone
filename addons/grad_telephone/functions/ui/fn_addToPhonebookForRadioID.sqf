/*

	adds contact entry

*/

private ["_phonebook", "_name", "_object", "_publicPhoneBookForID"];

params ["_phoneID", "_caller", "_number", "_isIED"];

_publicPhoneBookForID = "GRAD_telephone_phonebook_" + _phoneID;
_phonebook = missionNamespace getVariable [_publicPhoneBookForID, []];

_name = name _caller;
_object = _caller;


_phonebook = _phonebook + [[phoneID, _name, _number, _isIED, _object]];

missionNamespace setVariable [_publicPhoneBookForID, _phonebook, true];

if (GRAD_TELEPHONE_DEBUG_MODE) then { diag_log format ["modifyPhonebook: updating with %1, %2, %3, %4, %5", _radioID, _name, _number, _isIED, _object]; };