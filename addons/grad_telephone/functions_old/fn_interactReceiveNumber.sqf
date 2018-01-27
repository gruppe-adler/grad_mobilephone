/* originally by mcdiod */

params ["_unit", "_caller", "_number", "_radioID"];

hint format ["You have received the phone number from %1.", name _caller];

diag_log format ["receive number : %1, %2, %3, %4", _unit, _caller, _number, _radioID];

// last param is "isIED"
[_radioID, _caller, _number, false] call GRAD_fnc_addToPhonebookForRadioID;

// log 23:05:29 "receive number : C Alpha 1-3:1, C Alpha 1-1:1 (nomisum), [0,1,5,5,2,7,4,1,1,6,2], tf_nokia3310_1"