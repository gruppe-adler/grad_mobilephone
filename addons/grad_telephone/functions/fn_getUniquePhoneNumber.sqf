// generates unique number for radioID
params ["_caller", "_radioID"];

diag_log format ["getUniquePhoneNumber gets caller %1, radioID %2",_caller,_radioID];

_associatedNumber = 0;

[PHONENUMBERS_HASH, { PHONENUMBERS_ARRAY pushBack _radioID; }] call CBA_fnc_hashEachPair;

diag_log format ["PHONENUMBERS_ARRAY: %1, _radioID: %2",PHONENUMBERS_ARRAY,_radioID];

if ([PHONENUMBERS_HASH, _radioID] call CBA_fnc_hashHasKey) then {
	_associatedNumber = [PHONENUMBERS_HASH, _radioID] call CBA_fnc_hashGet;
	_caller setVariable ["GRAD_telephone_currentPhoneNumber", _associatedNumber, true];
} else {
	
	_associatedNumber = [PHONENUMBERS_ARRAY, _radioID] call GRAD_telephone_fnc_generatePhoneNumber;
	
	[PHONENUMBERS_HASH, _radioID, _associatedNumber] call CBA_fnc_hashSet;
	PHONENUMBERS_ARRAY = PHONENUMBERS_ARRAY + [_associatedNumber];

	if (GRAD_TELEPHONE_DEBUG_MODE) then { diag_log format ["number generated is %1", _associatedNumber]};
	_caller setVariable ["GRAD_telephone_currentPhoneNumber", _associatedNumber, true];
};

