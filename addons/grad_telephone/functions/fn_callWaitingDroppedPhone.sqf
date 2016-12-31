#include "..\macros.h"

private ["_item", "_ringBeeps", "_busyBeeps"];

params ["_item"];

player setVariable ["GRAD_telephone_currentState","waiting",true];

_ringBeeps = ["GRAD_telephone_phoneRingBeep1", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2"];
_busyBeeps = ["GRAD_telephone_phoneRingBusy1", "GRAD_telephone_phoneRingBusy2", "GRAD_telephone_phoneRingBusy3"];
_vibrations = ["GRAD_telephone_phoneVibrate1", "GRAD_telephone_phoneVibrate2"];




// while player is waiting for feedback, play ringing beeps on item
while {player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting"} do {
			playSound (selectRandom _ringBeeps);
			_item say3D (selectRandom _vibrations);
			_wasAlreadyRinging = true;
			diag_log format ["callWaitingDroppedPhone: long beep"];
			sleep 5;
};	
