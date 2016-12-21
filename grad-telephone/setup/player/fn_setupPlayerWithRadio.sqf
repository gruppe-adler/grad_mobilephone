params ["_freq","_number","_basefreq"];

_uniqueDummyRadioID = 999 - (_freq - _basefreq);
_uniqueDummyRadioClassname = "tf_rf7800str_" + str _uniqueDummyRadioID;

player setVariable ["GRAD_telephone_UIF",_freq];
player setVariable ["GRAD_telephone_number",_number];
player setVariable ["GRAD_telephone_dummyRadioClassname",_uniqueDummyRadioClassname];

player linkItem _uniqueDummyRadioClassname;

(str _freq) call TFAR_fnc_setPersonalRadioFrequency;

[] call grad_telephone_fnc_disableRiflemanRadio;