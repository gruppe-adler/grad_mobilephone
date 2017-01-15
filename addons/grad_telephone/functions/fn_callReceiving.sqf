/* called on receivers client by caller remoteexec*/

params ["_caller", "_receiver"];

_vibrations = ["GRAD_telephone_phoneVibrate1", "GRAD_telephone_phoneVibrate2"];

_receiver setVariable ["GRAD_telephone_currentState","receiving",true];

[call TFAR_fnc_activeSwRadio, -1] call GRAD_fnc_showRadioInfo;

// checking for player, because in SP our own display would be overwritten
if (isPlayer _receiver) then {
	[str _caller] call GRAD_fnc_setDisplayName;
	["incoming call..."] call GRAD_fnc_setDisplayNumber;
};

_condition = true;
while {_caller getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting" &&
   	_receiver getVariable ["GRAD_telephone_currentState","noPhone"] == "receiving"
  } do {

  	[_receiver, _condition] spawn {
  		while {_condition} do {
			[(_this select 0), ["GRAD_telephone_phoneRingOriginal", 50]] remoteExec ["say3D",0,false];
			sleep 3.5;
		};
	};
};

_condition = false;

if (_caller getVariable ["GRAD_telephone_currentState","noPhone"] == "rejected") then {
	[_receiver] call GRAD_fnc_callReject;
};