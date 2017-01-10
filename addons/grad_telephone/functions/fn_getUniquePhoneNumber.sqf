// generates unique number for radioID
params ["_caller", "_radioID"];

diag_log format ["getUniquePhoneNumber gets caller %1, radioID %2",_caller,_radioID];

_associatedNumber = 0;

_currentRadioIDs = [];
[PHONENUMBERS, { _currentRadioIDs pushBack _radioID; }] call CBA_fnc_hashEachPair;

diag_log format ["currentRadioIDS: %1, _radioID: %2",_currentRadioIDs,_radioID];

if ([PHONENUMBERS, _radioID] call CBA_fnc_hashHasKey) then {
	_associatedNumber = [PHONENUMBERS, _radioID] call CBA_fnc_hashGet;
} else {
	
	_associatedNumber = [_currentRadioIDs, _radioID] call GRAD_fnc_generatePhoneNumber;
	
	[PHONENUMBERS, _radioID, _associatedNumber] call CBA_fnc_hashSet;	
};

_caller setVariable ["GRAD_telephone_currentPhoneNumber", _associatedNumber, true];