params ["_name"];

player setVariable ["GRAD_telephone_currentState", "dialing", true];

_possibleCallTargets = [];

if (isMultiplayer) then {
	_possibleCallTargets = allPlayers;
} else {
	_possibleCallTargets = switchableUnits;
};

sleep 4 - (random 2); // random

// playsound tut tut

{
	diag_log format ["checking if %1 is name %2", _x, _name];
	if (str _x == _name) exitWith {
		_targetState = _x getVariable ["GRAD_telephone_currentState","noPhone"];

		/*
		if (_targetState == "noPhone") exitWith { 
			// emergency abort
			player setVariable ["GRAD_telephone_currentState","default",true];
			["default",2,"Cant reach target"] spawn GRAD_fnc_showHint; 
		};
		*/
		
		[_x] call GRAD_fnc_callWaiting;
	};
} forEach _possibleCallTargets;

diag_log format ["didnt find %1 in playableunits", _name];

[call TFAR_fnc_activeSwRadio, 5] call GRAD_fnc_showRadioInfo;

/*

ring tone delaybetween: 3.5
busy tone delaybetween: 0.3

*/