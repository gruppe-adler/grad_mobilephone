/*

	deletes contact entry

*/

params ["_radioID", "_index"];

private _phoneID = [_unit] call GRAD_telephone_fnc_getRadio;
private _publicPhoneBookForID = "GRAD_telephone_phonebook_" + _phoneID;
private _phonebook = missionNamespace getVariable [_publicPhoneBookForID, []];

_phonebook deleteAt _index;

missionNamespace setVariable [_publicPhoneBookForID, _phonebook, true];


if (GRAD_TELEPHONE_DEBUG_MODE) then { 
     diag_log format ["phonebook: %1, _index was %2", _phonebook, _index]; 
};