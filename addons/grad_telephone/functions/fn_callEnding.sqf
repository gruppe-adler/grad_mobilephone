player setVariable ["GRAD_telephone_currentState", "ending", true];

playSound "phoneRingBusy1";

["default",2,"Ended Call"] spawn GRAD_fnc_showHint;
sleep 2;

("TFAR_HintLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
player setVariable ["GRAD_telephone_currentState", "default", true];
player setVariable ["GRAD_telephone_currentPartner", "", true];

[[player] call GRAD_fnc_setNativePhoneFrequency;