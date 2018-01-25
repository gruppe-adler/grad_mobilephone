params ["_phoneID", "_tone"];

missionNamespace setVariable [("GRAD_telephone_ringToneSetFor_" + _phoneID), _tone, true];