player setVariable ["GRAD_telephone_currentState", "rejected", true];

["default",1,"Rejected Call"] spawn GRAD_fnc_showHint;
("TFAR_HintLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];