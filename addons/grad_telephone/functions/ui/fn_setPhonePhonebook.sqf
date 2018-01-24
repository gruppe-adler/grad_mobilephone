params ["_phoneID", "_phonebookArray"];

private _publicPhoneBookForID = "GRAD_telephone_phonebook_" + _phoneID;

missionNamespace setVariable [_publicPhoneBookForID, _phonebookArray, true];