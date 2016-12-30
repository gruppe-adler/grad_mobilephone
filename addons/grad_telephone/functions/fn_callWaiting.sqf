private ["_wasAlreadyRinging", "_name", "_number", "_ringBeeps", "_busyBeeps"];

params ["_name", "_number"];

player setVariable ["GRAD_telephone_currentState","waiting",true];

_ringBeeps = ["GRAD_telephone_phoneRingBeep1", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2"];
_busyBeeps = ["GRAD_telephone_phoneRingBusy1", "GRAD_telephone_phoneRingBusy2", "GRAD_telephone_phoneRingBusy3"];

// diag_log format ["start waiting for %1", _name];

_wasAlreadyRinging = false;

if ([_name] call GRAD_fnc_canReceive) then {

	// while player is waiting for feedback, play ringing beeps
	while {player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting"} do {
		if (_name getVariable ["GRAD_telephone_currentState", "noPhone"] == "receiving") then {
				playSound (selectRandom _ringBeeps);
				_wasAlreadyRinging = true;
				sleep 5;
			} else {
				playSound (selectRandom _busyBeeps);
				if (!_wasAlreadyRinging) then { sleep 0.55;	} else { sleep 0.35; };
			
		};
	};	
};

// if player decides to end call OR target changes status, check again if transmission should be established
if (player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting" &&
	_name getVariable ["GRAD_telephone_currentState", "noPhone"] == "talking"
	) then {
	[_name, [_name] call GRAD_fnc_getNativePhoneFrequency, [_name] call GRAD_fnc_getNativePhoneCode] remoteExec ["setCallersPhoneFrequency", _name, false];
};