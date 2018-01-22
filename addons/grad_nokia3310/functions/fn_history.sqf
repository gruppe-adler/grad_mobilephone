#include "..\macros_idc.hpp"
params ["_display"];

private _history = [];
private _ctrltext = ctrlText (_display displayCtrl IDC_HISTORY);

{
     _history pushBack (parseNumber _x);
} forEach (_ctrltext splitString "-");

_history
