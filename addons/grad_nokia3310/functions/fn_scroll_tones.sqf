#include "..\macros_idc.hpp"
params ["_display","_index"];

// todo : read real values of set ring tones
private _pages = [  ["Ringing tone","Attraction","tones_ringing"],
                    ["Alarm \ntone","Tick Tick","tones_alarm"]
];

if (_index isEqualTo count _pages) then {_index = 0;};
if (_index isEqualTo -1) then {_index = count _pages -1;};

private _page = _pages select _index;

(_display displayCtrl IDC_HISTORY) ctrlSetText format ["3-%1", _index + 1];

(_display displayCtrl IDC_TONES_SETTING) ctrlSetText (_page select 0);
(_display displayCtrl IDC_TONES_VALUE) ctrlSetText (_page select 1);

GRAD_Nokia3310_curSel = _page select 2;