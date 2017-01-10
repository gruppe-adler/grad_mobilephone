params ["_caller", "_receiver"];

_vibrations = ["GRAD_telephone_phoneVibrate1", "GRAD_telephone_phoneVibrate2"];

_receiver setVariable ["GRAD_telephone_currentState","receiving",true];

[call TFAR_fnc_activeSwRadio, -1] call GRAD_fnc_showRadioInfo;

// checking for player, because in SP our own display would be overwritten
if (isPlayer _receiver) then {
	[str _caller] call GRAD_fnc_setDisplayName;
	["incoming call..."] call GRAD_fnc_setDisplayNumber;
} else {
	
};

while {_caller getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting" &&
	   	_receiver getVariable ["GRAD_telephone_currentState","noPhone"] == "receiving"
	  } do {

		_receiver say3d (selectRandom _vibrations);
		sleep 3.5;
};

if (_receiver getVariable ["GRAD_telephone_currentState","noPhone"] == "rejected") then {
	[] call GRAD_fnc_callReject;
};