params ["_display"];

GRAD_TELEPHONE_PHONEBOOK_LOCAL = [];

//fill contacts
private _contacts = [[player] call GRAD_telephone_fnc_getRadio] call GRAD_telephone_fnc_getPhonePhonebook;

if (!isMultiplayer) then {
	diag_log format ["........................................"];
	diag_log format ["grad_nokia3310: refreshing phonebook %1", _contacts];
	diag_log format ["........................................"];
};

lbClear (_display displayCtrl IDC_PHONEBOOK_CONTACTS);
(_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbAdd "<New contact>";

// phonebook structure: _radioID, _name, _number, _isIED, _object
{
   GRAD_TELEPHONE_PHONEBOOK_LOCAL append _x;
   private _i = (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbAdd (_x select 1);
   (_display displayCtrl IDC_PHONEBOOK_CONTACTS) lbSetData [_i,(_x select 2)];
} forEach _contacts;