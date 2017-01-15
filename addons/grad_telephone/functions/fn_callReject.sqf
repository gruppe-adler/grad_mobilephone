params ["_receiver"];
_receiver setVariable ["GRAD_telephone_currentState", "rejected", true];

if (player == _receiver) then {
	["default",1,"Rejected Call"] spawn GRAD_fnc_showHintUnlimited;
	call TFAR_fnc_HideHint; // ("TFAR_HintLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
};
