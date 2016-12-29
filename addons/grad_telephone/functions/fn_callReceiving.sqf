params ["_caller"];

_vibrations = ["GRAD_telephone_phoneVibrate1", "GRAD_telephone_phoneVibrate2"];

player setVariable ["GRAD_telephone_currentState","receiving",true];

[str _caller] call GRAD_fnc_setDisplayName;
["incoming call..."] call GRAD_fnc_setDisplayNumber;

while {_caller getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting" &&
	   	player getVariable ["GRAD_telephone_currentState","noPhone"] == "receiving"
	  } do {

		player say3d (selectRandom _vibrations);
		sleep 3.5;
};

if (player getVariable ["GRAD_telephone_currentState","noPhone"] == "rejected") then {
	[] call GRAD_fnc_callReject;
};