params ["_phoneID", "_tone"];

private _publicSetToneForID = "GRAD_telephone_setTone_" + _phoneID;

missionNamespace setVariable [_publicSetToneForID, _tone, true];