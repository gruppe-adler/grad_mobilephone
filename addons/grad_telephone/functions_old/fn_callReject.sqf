params ["_receiver"];
_receiver setVariable ["GRAD_telephone_currentState", "rejected", true];

if (player == _receiver) then {
	["Rejected Call"] spawn GRAD_fnc_showHintUnlimited;
	[([player] call GRAD_fnc_getRadio), 3] call GRAD_fnc_showRadioInfo;
};
