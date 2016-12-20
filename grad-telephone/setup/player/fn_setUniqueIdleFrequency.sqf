// setUniqueIdleFrequency

params ["_freq"];
player linkItem "TFAR_rf7800str";

player setVariable ["GRAD_telephone_UIF",_freq];

(str _freq) call TFAR_fnc_setPersonalRadioFrequency;

[] call disableRiflemanRadio;