#include "\grad_telephone\define.h"

params ["_stateBefore", "_seconds", "_text", "_endCondition"];

// set new content
// [_text] call GRAD_telephone_fnc_setDisplayName;
[_text] call GRAD_telephone_fnc_setDisplayNumber;

while {!(call _endCondition)} do {
	sleep _seconds;
};