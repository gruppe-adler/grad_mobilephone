#include "\grad_telephone\define.h"

waitUntil {sleep 0.2;time > 0};
waitUntil {sleep 0.1;!(isNull player)};

IDC_NOKIA3310STR_CONTACT_NAME_ID = IDC_NOKIA3310STR_CONTACT_NAME;

['suppressRadioHint', 'OnRadioOpen', { 

	if ([player] call GRAD_fnc_isCellphone) then { 
		[] call GRAD_fnc_restoreDisplay;
	}; 

}, player] call TFAR_fnc_addEventHandler; 

// suppress radio hint when transmitting if phone used
['suppressRadioHint', 'OnTangent', { 

	if ([player] call GRAD_fnc_isCellphone) then { 
		call TFAR_fnc_HideHint; diag_log format ['hiding hint'];
		[([player] call GRAD_fnc_getRadio), -1] call GRAD_fnc_showRadioInfo;
	}; 

}, player] call TFAR_fnc_addEventHandler; 


// setup phone radio when received (mono ear, homescreen)
["addRadioSpecifications", "OnRadiosReceived", {

	if ([player] call GRAD_fnc_isCellphone) then {

		[(call TFAR_fnc_activeSwRadio), 2] call TFAR_fnc_setSwStereo;
		[player] call GRAD_fnc_setNativePhoneFrequency;
	};

}, player] call TFAR_fnc_addEventHandler;

