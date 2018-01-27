/*

	adds contact entry

*/

private ["_phonebook", "_name", "_publicPhoneBookForID"];

params ["_phoneID", "_object", "_number", "_isIED"];

_publicPhoneBookForID = "GRAD_telephone_phonebook_" + _phoneID;
_phonebook = missionNamespace getVariable [_publicPhoneBookForID, []];

if (_isIED) then {
	_name = "IED " + _number;
} else {
	_name = name _object;	
};



_phonebook = _phonebook + [[_phoneID, _name, _number, _isIED, _object]];

missionNamespace setVariable [_publicPhoneBookForID, _phonebook, true];

if (GRAD_TELEPHONE_DEBUG_MODE) then { diag_log format ["modifyPhonebook: updating with %1, %2, %3, %4, %5", _radioID, _name, _number, _isIED, _object]; };