params ["_freq"];

if (call grad_telephone_fnc_isCurrentDummyRadio) then {
	(str _uif) call TFAR_fnc_setPersonalRadioFrequency;
} else {
	diag_log format ["cant set target frequency, no dummy radio found."];
};