#include "..\macros_idc.hpp"
#include "..\tones.hpp"

params ["_display","_index"];

private _radioID = [player] call GRAD_telephone_fnc_getRadio;
private _currentRingingTone = [_radioID] call GRAD_telephone_fnc_getRingToneForPhoneID;
private _currentAlarmTone = [_radioID] call GRAD_telephone_fnc_getAlarmToneForPhoneID;

if (count _currentRingingTone < 1) then {
	_currentRingingTone = GRAD_NOKIA3310_TONES select 0;
};

if (count _currentAlarmTone < 1) then {
	_currentAlarmTone = GRAD_NOKIA3310_TONES select 0;
};


private _pages = [  ["Ringing tone",_currentRingingTone select 0,_currentRingingTone select 1],
                    ["Alarm \ntone",_currentAlarmTone select 0,_currentAlarmTone select 1]
];

if (_index isEqualTo count _pages) then {_index = 0;};
if (_index isEqualTo -1) then {_index = count _pages -1;};

private _page = _pages select _index;

[_display, format ["3-%1", _index + 1]] call GRAD_Nokia3310_fnc_historySet;

(_display displayCtrl IDC_TONES_SETTING) ctrlSetText (_page select 0);
(_display displayCtrl IDC_TONES_VALUE) ctrlSetText (_page select 1);

GRAD_Nokia3310_curSel = _page select 2;