/*

	adds or deletes contact entry

*/

private ["_phonebook", "_name", "_object", "_phoneID", "_phone"];

// player, (lbCurSel _lb), "remove", _targetRadioID, player, _phoneNumber, _isIED
params ["_unit", "_index", "_mode", "_radioID", "_caller", "_number", "_isIED"];

_phoneID = [_unit] call GRAD_telephone_fnc_getRadio;

_publicPhoneBookForID = "GRAD_telephone_phonebook_" + _phoneID;

_phonebook = missionNamespace getVariable [_publicPhoneBookForID, []];

_name = name _caller;
_object = _caller;



//remove note
if (_mode == "remove") then {
    // _selector = [_phonebook, _number] call BIS_fnc_findNestedElement;

    _phonebook deleteAt _index;

    missionNamespace setVariable [_publicPhoneBookForID, _phonebook, true];

    if (GRAD_TELEPHONE_DEBUG_MODE) then { 
	     diag_log format ["phonebook: %1, _index was %2", _phonebook, _index]; 
	};
};

//add note
if (_mode == "add") then {
    _phonebook = _phonebook + [[_radioID, _name, _number, _isIED, _object]];
    
    missionNamespace setVariable [_publicPhoneBookForID, _phonebook, true];

    if (GRAD_TELEPHONE_DEBUG_MODE) then { diag_log format ["modifyPhonebook: updating with %1, %2, %3, %4, %5", _radioID, _name, _number, _isIED, _object]; };
};

if (_mode == "none") then {
	diag_log format ["nokia3310 error: no mode for modifying phonebook"];
};