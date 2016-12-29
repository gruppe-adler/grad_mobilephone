params ["_name", "_freq", "_code"];

[call TFAR_fnc_activeSwRadio, _code] call TFAR_fnc_setSwRadioCode;
[(call TFAR_fnc_activeSwRadio), _freq] call TFAR_fnc_setSwFrequency;

player setVariable ["GRAD_telephone_currentPartner", _name, true];