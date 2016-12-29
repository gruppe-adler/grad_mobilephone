params ["_name", "_number"];

player setVariable ["GRAD_telephone_currentState","waiting",true];

_ringBeeps = ["GRAD_telephone_phoneRingBeep1", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2"];
_busyBeeps = ["GRAD_telephone_phoneRingBusy1", "GRAD_telephone_phoneRingBusy2", "GRAD_telephone_phoneRingBusy3"];

// diag_log format ["start waiting for %1", _name];

_wasAlreadyRinging = false;

while {player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting"} do {

	if ([_name] call GRAD_fnc_canReceive) then {
		if (player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting") then {
			playSound (selectRandom _ringBeeps);
			_wasAlreadyRinging = true;
		};
		sleep 5;
	} else {
		if (player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting") then {
			playSound (selectRandom _busyBeeps);
			if (!_wasAlreadyRinging) then {
				sleep 0.55;
			} else {
				sleep 0.35;
			};
		};
	};
};

if (_name getVariable ["GRAD_telephone_currentState", "noPhone"] == "receiving") then {
	[_name, call getNativePhoneFrequency, call getNativePhoneCode] remoteExec ["setCallersPhoneFrequency", _name, false];
	player setVariable ["GRAD_telephone_currentPartner", _name, true];
};