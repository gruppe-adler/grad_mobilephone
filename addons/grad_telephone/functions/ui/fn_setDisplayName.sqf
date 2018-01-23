params ["_str"];

ctrlSetText [IDC_NOKIA3310STR_CONTACT_NAME_ID, _str];
player setVariable ["GRAD_telephone_currentStateDisplayName", _str];