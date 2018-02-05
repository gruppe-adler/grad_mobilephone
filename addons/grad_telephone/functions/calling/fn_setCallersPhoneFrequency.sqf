/*
	called on receivers client after accepting

	sets receivers client to frequency of calling client
*/


params ["_freq", "_code"];

[([player] call GRAD_telephone_fnc_getRadio), _code] call TFAR_fnc_setSwRadioCode;
[([player] call GRAD_telephone_fnc_getRadio), _freq] call TFAR_fnc_setSwFrequency;
