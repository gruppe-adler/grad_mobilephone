#include "..\..\macros.h"

private ["_possibleCallTargets", "_foundRadioInUnits", "_unitRadio", "_radioItemID", "_onGround", "_inVehicle", "_possibleHolder", "_main"];

params ["_phoneID", "_name", ["_targetObject", objNull]];

player setVariable ["GRAD_telephone_currentPartner", _targetObject, true];
_targetObject setVariable ["GRAD_telephone_currentPartner", player, true];

_possibleCallTargets = [];
_foundRadioInUnits = false;

if (isMultiplayer) then {
	_possibleCallTargets = allPlayers;
} else {
	_possibleCallTargets = switchableUnits;
};

// random sleep for establishing connection
sleep 4 - (random 2);



// playsound tut tut
scopeName "_main";

{
	_unitRadio = [_x] call GRAD_telephone_fnc_getRadio;
	if (_unitRadio != "none") then {
		diag_log format ["callDialing: checking if persons radioID %1 is calledID %2", _phoneID, _unitRadio];
		if (_phoneID == _unitRadio) exitWith {
			[_x] call GRAD_telephone_fnc_callWaiting;
			_foundRadioInUnits = true;
			breakTo "_main";
		};
	} else {
		diag_log format ["callDialing: %1 has no radio", _x];
	};
} forEach _possibleCallTargets;


// extend search, if no unit possesses radio
if (!_foundRadioInUnits) then {

	_radioItemID = "Item_" + _phoneID;
	diag_log format ["callDialing: radioItemID is %1", _radioItemID];

	// todo find item elsewhere to ring in open field
	_onGround = false;
	_inVehicle = false;
	_possibleHolder = position player nearObjects ["WeaponHolder", 30000];

	{
		diag_log format ["callDialing: checking %2 for %1 on the ground", _radioItemID, (itemCargo _x)];
		if ((itemCargo _x) find _radioItemID >= 0 ) exitWith {
			[_x] call GRAD_telephone_fnc_callWaitingDroppedPhone;
			diag_log format ["callDialing: found radioID %1 on the ground", _radioItemID];
			_onGround = true;
		};

	} forEach _possibleHolder;

	// extend search to all vehicles (here _phoneID is sufficient)
	if (!_onGround) then {
		{
			diag_log format ["callDialing: checking %2 for %1 in vehicle", _phoneID, (itemCargo _x)];
			if ((itemCargo _x) find _phoneID >= 0) exitWith {
				[_x] call GRAD_telephone_fnc_callWaitingDroppedPhone;
				diag_log format ["callDialing: found radioID %1 in vehicle", _phoneID];
				_inVehicle = true;
			};
		} forEach vehicles;
	};
};

[call TFAR_fnc_activeSwRadio, -1] call GRAD_telephone_fnc_showRadioInfo;