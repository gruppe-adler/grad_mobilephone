#include "\grad_telephone\define.h"

params ["_stateBefore", "_seconds", "_text", "_endCondition"];

// save old content
_cacheName = ctrlText IDC_NOKIA3310STR_CONTACT_NAME_ID;
_cacheNumber = ctrlText TF_MICRODAGR_EDIT_ID;

// set new content
[_text] call GRAD_fnc_setDisplayName;
[""] call GRAD_fnc_setDisplayNumber;

while {!(call _endCondition)} do {
	sleep _seconds;
};

// restore old content
[_cacheName] call GRAD_fnc_setDisplayName;
[_cacheNumber] call GRAD_fnc_setDisplayNumber;