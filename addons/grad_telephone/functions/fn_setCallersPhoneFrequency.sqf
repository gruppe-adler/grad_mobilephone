params ["_receiverObject", "_freq", "_code"];

[(call TFAR_fnc_activeSwRadio), _code] call TFAR_fnc_setSwRadioCode;
[(call TFAR_fnc_activeSwRadio), _freq] call TFAR_fnc_setSwFrequency;

_receiverObject setVariable ["GRAD_telephone_currentPartner", _receiverObject, true];
_receiverObject setVariable ["GRAD_telephone_currentState", "talking", true];