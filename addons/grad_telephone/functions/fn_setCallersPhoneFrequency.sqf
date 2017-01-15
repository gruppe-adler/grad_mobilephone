/* called on receivers client after accepting */

params ["_freq", "_code"];

[(call TFAR_fnc_activeSwRadio), _code] call TFAR_fnc_setSwRadioCode;
[(call TFAR_fnc_activeSwRadio), _freq] call TFAR_fnc_setSwFrequency;