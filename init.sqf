// find out unique idle frequency (UIF)
// server side == safe


if (isServer) then {
	BASEUIF = 1337;
	
	PHONENUMBERS = [];

	COUNTUIF = BASEUIF;

	if (!isMultiplayer) then {
		/* SINGLEPLAYER */
		COUNTUIF = COUNTUIF + 1;

		_generatedNumber = [PHONENUMBERS] call generatePhoneNumber;
		PHONENUMBERS = PHONENUMBERS + [_generatedNumber];

		[COUNTUIF,_generatedNumber] call setUniqueIdleFrequency;
	};
	

	/* MULTIPLAYER */
	_UIFtracker = addMissionEventHandler ["PlayerConnected",
	{
		COUNTUIF = COUNTUIF + 1;

		_generatedNumber = [PHONENUMBERS] call generatePhoneNumber;
		PHONENUMBERS = PHONENUMBERS + [_generatedNumber];

		[COUNTUIF,_generatedNumber] remoteExec ["setUniqueIdleFrequency", _this select 4];
		diag_log format ["grad-telephone: set client %1 to UIF %2.", _this select 2, _this select 4];
	}];
};