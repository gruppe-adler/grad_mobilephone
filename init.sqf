// find out unique idle frequency (UIF)

// server side == safe
#define BASEUIF 1337

if (isServer) then {

	COUNTUIF = BASEUIF;

	_UIFtracker = addMissionEventHandler ["PlayerConnected",
	{
		COUNTUIF = COUNTUIF + 1;

		 [COUNTUIF] remoteExec ["setBaseUIF", _this select 4];
		diag_log format ["grad-telephone: set client %1 to UIF %2.", _this select 2, _this select 4];
	}];
};