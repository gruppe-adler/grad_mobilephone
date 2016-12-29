_freqStr = call GRAD_fnc_getNativePhoneFrequency;

[(call TFAR_fnc_activeSwRadio), _freqStr] call TFAR_fnc_setSwFrequency;

_code = "GRAD_encryptCode_" + _freqStr;

[call TFAR_fnc_activeSwRadio, _code] call TFAR_fnc_setSwRadioCode;