#include "..\macros_idc.hpp"
params ["_display","_index"];

private _pages = [  ["Phone book","phonebook"],
                    ["Call register","callregister"],
                    ["Tones","tones"],
                    ["Settings","settings"],
                    ["Games","games"],
                    ["Alarm clock","alarm"],
                    ["Profiles","profiles"]
];

if (_index isEqualTo count _pages) then {_index = 0;};
if (_index isEqualTo -1) then {_index = count _pages -1;};

private _page = _pages select _index;

(_display displayCtrl IDC_HISTORY) ctrlSetText format ["%1",_index + 1];

(_display displayCtrl IDC_MAINMENU_TEXT) ctrlSetText (_page select 0);
(_display displayCtrl IDC_MAINMENU_PICTURE) ctrlSetText format ["GRAD_Nokia3310\data\dialog\mainmenu\%1_ca.paa",_page select 1];

GRAD_Nokia3310_curSel = _page select 1;
