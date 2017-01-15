playSound "GRAD_telephone_phoneRingBusy1";

["default",2,"Ended Call"] spawn GRAD_fnc_showHint;

call TFAR_fnc_HideHint; // ("TFAR_HintLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
player setVariable ["GRAD_telephone_currentState", "default", true];
player setVariable ["GRAD_telephone_currentPartner", objNull, true];

[player] call GRAD_fnc_setNativePhoneFrequency;