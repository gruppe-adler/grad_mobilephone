disableSerialization;

#include "..\macros_idc.hpp"
params ["_display", "_tone", "_elementsActive"];

player setVariable ["GRAD_telephone_displayBusy",true];
player setVariable ["GRAD_telephone_currentPhoneRingtone", _tone, true];

if (!isMultiplayer) then {
     diag_log format ["........................................"];
     diag_log format ["grad_nokia3310: confirming action for %1", _tone];
     diag_log format ["........................................"];
};



{
  _x ctrlShow false;
} forEach _elementsActive;

(_display displayCtrl IDC_CTRLGROUP_CONFIRM) ctrlShow true;
(_display displayCtrl IDC_ACTION_CONFIRM2) ctrlShow false;
(_display displayCtrl IDC_ACTION_CONFIRM3) ctrlShow false;

(_display displayCtrl IDC_ACTION_CONFIRM1) ctrlShow true;
(_display displayCtrl IDC_ACTION_CONFIRM_TEXT) ctrlShow true;
uiSleep 0.5;

(_display displayCtrl IDC_ACTION_CONFIRM1) ctrlShow false;
(_display displayCtrl IDC_ACTION_CONFIRM2) ctrlShow true;
uiSleep 0.25;

(_display displayCtrl IDC_ACTION_CONFIRM2) ctrlShow false;
(_display displayCtrl IDC_ACTION_CONFIRM3) ctrlShow true;
uiSleep 0.5;

(_display displayCtrl IDC_ACTION_CONFIRM3) ctrlShow false;
(_display displayCtrl IDC_CTRLGROUP_CONFIRM) ctrlShow false;
(_display displayCtrl IDC_ACTION_CONFIRM_TEXT) ctrlShow false;

{
  _x ctrlShow true;
} forEach _elementsActive;

player setVariable ["GRAD_telephone_displayBusy",false];