#include "\grad_telephone\define.h"

params ["_text"];

// save old content
_cacheName = ctrlText IDC_NOKIA3310STR_CONTACT_NAME_ID;
_cacheNumber = ctrlText TF_MICRODAGR_EDIT_ID;

// set new content
[_text] call GRAD_telephone_fnc_setDisplayName;
[""] call GRAD_telephone_fnc_setDisplayNumber;
