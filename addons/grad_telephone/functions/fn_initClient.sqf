#include "\grad_telephone\define.h"

waitUntil {sleep 0.2;time > 0};
waitUntil {sleep 0.1;!(isNull player)};

IDC_NOKIA3310STR_CONTACT_NAME_ID = IDC_NOKIA3310STR_CONTACT_NAME;


// suppress radio hint when transmitting if phone used
['suppressRadioHint', 'OnTangent', { 

	if (getText (configFile >> 'CfgWeapons' >> (call TFAR_fnc_activeSwRadio) >> 'tf_subtype') == 'phone') then { 
		call TFAR_fnc_HideHint; diag_log format ['hiding hint'];
		[call TFAR_fnc_activeSwRadio, 5] call GRAD_fnc_showRadioInfo;
	}; 

}, player] call TFAR_fnc_addEventHandler; 


// setup phone radio when received (mono ear, homescreen)
["addRadioSpecifications", "OnRadiosReceived", {

	if (getText (configFile >> 'CfgWeapons' >> (call TFAR_fnc_activeSwRadio) >> 'tf_subtype') == 'phone') then {

		[(call TFAR_fnc_activeSwRadio), 2] call TFAR_fnc_setSwStereo;
		[] call GRAD_fnc_gotoHomescreen;
		[] call GRAD_fnc_setNativePhoneFrequency;
	};

}, player] call TFAR_fnc_addEventHandler;

