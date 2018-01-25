params ["_phoneID", "_tone"];

missionNamespace setVariable [("GRAD_telephone_alarmToneSetFor_" + _phoneID), _tone, true];