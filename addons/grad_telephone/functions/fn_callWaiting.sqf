#include "..\macros.h"

private ["_wasAlreadyRinging", "_name", "_number", "_ringBeeps", "_busyBeeps"];

params ["_name", "_number"];

player setVariable ["GRAD_telephone_currentState","waiting",true];

_ringBeeps = ["GRAD_telephone_phoneRingBeep1", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2"];
_busyBeeps = ["GRAD_telephone_phoneRingBusy1", "GRAD_telephone_phoneRingBusy2", "GRAD_telephone_phoneRingBusy3"];

// diag_log format ["start waiting for %1", _name];

_wasAlreadyRinging = false;

[_name] call GRAD_fnc_pleaseReceive,

// while player is waiting for feedback, play ringing beeps
while {player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting"} do {
	if (_name getVariable ["GRAD_telephone_currentState", "noPhone"] == "receiving") then {
			playSound (selectRandom _ringBeeps);
			_wasAlreadyRinging = true;
			diag_log format ["callWaiting: long beep"];
			sleep 5;
		} else {
			playSound (selectRandom _busyBeeps);
			diag_log format ["callWaiting: short beep"];
			if (!_wasAlreadyRinging) then { sleep 0.55;	} else { sleep 0.35; };
		
	};
};	


diag_log format ["callWaiting: leaving beep loop"];

// if player decides to end call OR target changes status, check again if transmission should be established
if (player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting" &&
	_name getVariable ["GRAD_telephone_currentState", "noPhone"] == "talking"
	) exitWith {
	diag_log format ["callWaiting: target changed status to talking"];
	[_name, [_name] call GRAD_fnc_getNativePhoneFrequency, [_name] call GRAD_fnc_getNativePhoneCode] remoteExec ["setCallersPhoneFrequency", _name, false];
};

diag_log format ["callWaiting: target changed status to %1", _name getVariable ["GRAD_telephone_currentState", "noPhone"]];