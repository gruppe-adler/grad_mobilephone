// set global variables

if (isNil "DEBUG_MODE") then { 
	DEBUG_MODE = true; 
};

if (isNil "CELLTOWER_MODE") then { 
	CELLTOWER_MODE = true; 
};

if (isNil "AUTO_SPAWN_CELLTOWERS_AT_SETTLEMENTS") then { 
	AUTO_SPAWN_CELLTOWERS_AT_SETTLEMENTS = true; 
};

if (isNil "MAX_CELLTOWER_RANGE") then { 
	MAX_CELLTOWER_RANGE = 5000; 
};


// go to init stuff

if (isServer or isDedicated) then {
	[] spawn GRAD_fnc_initServer;
};

if (hasInterface) then {
	[] spawn GRAD_fnc_initClient;
};