#include "..\macros.h"

params ["_name"];

player setVariable ["GRAD_telephone_currentState", "dialing", true];
player setVariable ["GRAD_telephone_currentPartner", _name, true];

_possibleCallTargets = [];

if (isMultiplayer) then {
	_possibleCallTargets = allPlayers;
} else {
	_possibleCallTargets = switchableUnits;
};

sleep 4 - (random 2); // random

// playsound tut tut

{
	debugLog (format ["callDialing: checking if %1 is name %2", _x, _name]);
	if (str _x == _name) exitWith {
		_targetState = _x getVariable ["GRAD_telephone_currentState","noPhone"];
		
		[_x] call GRAD_fnc_callWaiting;
	};
} forEach _possibleCallTargets;

debugLog (format ["callDialing: didnt find %1 in playableunits", _name]);

[call TFAR_fnc_activeSwRadio, 3] call GRAD_fnc_showRadioInfo;

/*

ring tone delaybetween: 3.5
busy tone delaybetween: 0.3

*/