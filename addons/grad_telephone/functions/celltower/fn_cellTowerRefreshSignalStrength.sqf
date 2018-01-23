waitUntil {dialog};

disableSerialization;


while {dialog} do {
	_strength = player getVariable ["GRAD_telephone_currentSignalStrength", 5];
	ctrlSetText [7107, "\grad_telephone\nokia3310\carrier_" + str _strength + ".paa"];
	sleep 1;
};