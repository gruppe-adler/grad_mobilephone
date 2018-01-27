disableSerialization;

#include "..\macros_idc.hpp"
params ["display", "_name", "_elementsToShow", ["_elementsToHide",[]]];

player setVariable ["GRAD_telephone_displayBusy",true];

{
  _x ctrlShow false;
} forEach (_elementsToShow + _elementsToHide);

(_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlSetText "Dialing...";
(_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlSetText _name;

(_display displayCtrl IDC_PHONEBOOK_VIEW_NAME) ctrlShow true;
(_display displayCtrl IDC_PHONEBOOK_VIEW_NUMBER) ctrlShow true;

(_display displayCtrl IDC_ENTERTEXT) ctrlSetText "Cancel";

[{
	// condition to end dialing display
},
{
	// execute display change
}, []] call CBA_fnc_waitUntilAndExecute;