// setUniqueIdleFrequency

params ["_freq","_number"];
player linkItem "TFAR_rf7800str";

player setVariable ["GRAD_telephone_UIF",_freq];
player setVariable ["GRAD_telephone_number",_number];

(str _freq) call TFAR_fnc_setPersonalRadioFrequency;

[] call grad_telephone_fnc_disableRiflemanRadio;