disableSerialization;

#include "..\macros_idc.hpp"
params ["_name"];

private _display = call GRAD_Nokia3310_fnc_displayGet;

call GRAD_nokia3310_fnc_displayDisable;


(_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlSetText "Dialing...";
(_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlSetText _name;

(_display displayCtrl IDC_PHONEBOOK_SETTINGS) ctrlShow false;

(_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlShow true;
(_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlShow true;

(_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Cancel";

[
	{
		!([player] call GRAD_telephone_fnc_isCalling)
	},
	{
		params ["_ctrlname", "_ctrlnumber"];
		_ctrlname ctrlShow false;
		_ctrlnumber ctrlShow false;
		call GRAD_nokia3310_fnc_displayEnable;
	},
	[
		(_display displayCtrl IDC_PHONEBOOK_VIEW_NAME),
		(_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER)
	]
] call CBA_fnc_waitUntilAndExecute;
