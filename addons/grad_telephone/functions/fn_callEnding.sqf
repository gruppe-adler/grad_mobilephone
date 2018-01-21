playSound "GRAD_telephone_phoneRingBusy1";

["default",2,"Ended Call"] spawn GRAD_telephone_fnc_showHint;

call TFAR_fnc_HideHint; // ("TFAR_HintLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
player setVariable ["GRAD_telephone_currentState", "ending", true];
player setVariable ["GRAD_telephone_currentPartner", objNull, true];

[player] call GRAD_telephone_fnc_setNativePhoneFrequency;

// show ending hint for 3 more seconds
[([player] call GRAD_telephone_fnc_getRadio), 3] call GRAD_telephone_fnc_showRadioInfo;
sleep 2;
// set state to default
player setVariable ["GRAD_telephone_currentState", "default", true];