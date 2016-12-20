// find out unique idle frequency (UIF)




// server side == safe


if (isServer) then {
	#define BASEUIF 1337
	#define PHONENUMBERS []

	COUNTUIF = BASEUIF;

	_UIFtracker = addMissionEventHandler ["PlayerConnected",
	{
		COUNTUIF = COUNTUIF + 1;

		_generatedNumber = [] call generatePhoneNumber;
		PHONENUMBERS = PHONENUMBERS + [_generatedNumber];

		[COUNTUIF,_generatedNumber] remoteExec ["setBaseUIF", _this select 4];
		diag_log format ["grad-telephone: set client %1 to UIF %2.", _this select 2, _this select 4];
	}];
};