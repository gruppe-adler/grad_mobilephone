#include "..\macros_idc.hpp"
params ["_display","_index"];

private _radioID = [player] call GRAD_telephone_fnc_getRadio;

// todo : read real values of set ring tones
private _currentRingingTone = [_radioID] call GRAD_telephone_fnc_getToneForPhoneID;
private _currentAlarmTone = [_radioID] call GRAD_telephone_fnc_getRingToneForPhoneID;

if (count _currentRingingTone < 1) then {
	_currentRingingTone = GRAD_NOKIA3310_TONES select 0;
};

if (count _currentAlarmTone < 1) then {
	_currentAlarmTone = GRAD_NOKIA3310_TONES select 0;
};

private _pages = [  ["Ringing tone",_currentAlarmTone select 0,_currentAlarmTone select 1],
                    ["Alarm \ntone",_currentAlarmTone select 0,_currentAlarmTone select 1]
];

if (_index isEqualTo count _pages) then {_index = 0;};
if (_index isEqualTo -1) then {_index = count _pages -1;};

private _page = _pages select _index;

(_display displayCtrl IDC_HISTORY) ctrlSetText format ["3-%1", _index + 1];

(_display displayCtrl IDC_TONES_SETTING) ctrlSetText (_page select 0);
(_display displayCtrl IDC_TONES_VALUE) ctrlSetText (_page select 1);

GRAD_Nokia3310_curSel = _page select 2;