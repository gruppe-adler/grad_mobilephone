params ["_phoneID"];

private _publicPhoneBookForID = "GRAD_telephone_phonebook_" + _phoneID;

missionNamespace getVariable [_publicPhoneBookForID, []]