params ["_unit", "_ied"];


// _generatedName = "IED";
_generatedName = toupper ((configfile >> "cfgvehicles" >> typeof _ied) call bis_fnc_displayname),

diag_log format ["connected to IED %2 at position %1", getPos _ied, _generatedName];

_number = "IED";

_count = _unit getVariable ["GRAD_telephone_myIEDlist", 0];
_IEDNum = _count + 1;
_unit setVariable ["GRAD_telephone_myIEDlist", _IEDNum];

_number = str _IEDNum;

[_unit, "add", _ied, _generatedName, _number, true] call GRAD_fnc_updateContactList;