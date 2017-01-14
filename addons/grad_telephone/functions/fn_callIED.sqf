params ["_ied", "_name"];

player setVariable ["GRAD_telephone_currentState", "dialing", true];
player setVariable ["GRAD_telephone_currentPartner", _name, true];

// random connection build up time
sleep ((random 3) + 2);

// check if IED && player is in reach of celltower, exit if not

if ([_ied] call GRAD_fnc_isCellTowerReachable && [_player] call GRAD_fnc_isCellTowerReachable) then {
	if (player distance2D _nearestMarkerPlayer > MAX_CELLTOWER_RANGE) exitWith {
		player setVariable ["GRAD_telephone_currentState", "default", true];
		player setVariable ["GRAD_telephone_currentPartner", "", true];
		["Kein Netz"] spawn GRAD_fnc_showHintUnlimited;
	};
	if (_ied distance2D _nearestMarkerIED > MAX_CELLTOWER_RANGE) exitWith {
		player setVariable ["GRAD_telephone_currentState", "default", true];
		player setVariable ["GRAD_telephone_currentPartner", "", true];
		["Teilnehmer nicht erreichbar"] spawn GRAD_fnc_showHintUnlimited;
	};
};


player setVariable ["GRAD_telephone_currentState","waiting",true];

_ringBeeps = ["GRAD_telephone_phoneRingBeep1", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2", "GRAD_telephone_phoneRingBeep2"];
_busyBeeps = ["GRAD_telephone_phoneRingBusy1", "GRAD_telephone_phoneRingBusy2", "GRAD_telephone_phoneRingBusy3"];
_vibrations = ["GRAD_telephone_phoneVibrate1", "GRAD_telephone_phoneVibrate2"];
// diag_log format ["start waiting for %1", _name];

_wasAlreadyRinging = false;




// while player is waiting for feedback, play ringing beeps
while {player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting"} do {
	if (!alive _ied) then {
			playSound "GRAD_telephone_phoneUnknown";
			diag_log format ["callIED: IED unknown"];
			sleep 2;
		};

	if (alive _ied) exitWith {
		diag_log format ["callIED: long beep"];
		
		if (!_wasAlreadyRinging) then { 
			_wasAlreadyRinging = true;
			
			playSound (selectRandom _ringBeeps);
			_ied say3D (selectRandom _vibrations);
			sleep 0.55;
			[_ied] call GRAD_fnc_destroyIED;
			// [[_ied], 0] call ace_explosives_fnc_scriptedExplosive;
			while {player getVariable ["GRAD_telephone_currentState","noPhone"] == "waiting"} do {
				playSound (selectRandom _busyBeeps); 
				sleep 0.35; 
				diag_log format ["callIED: short beep"];
			};
		};
	};
};