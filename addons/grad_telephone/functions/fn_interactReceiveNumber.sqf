/* originally by mcdiod */

params ["_caller", "_number", "_radioID"];

hint format ["You have received the phone number from %1.", name _caller];
["add", _radioID, _caller, _number] call GRAD_fnc_updateContactList;