// set global variables


if (isNil "GRAD_TELEPHONE_DEBUG_MODE") then { 
	GRAD_TELEPHONE_DEBUG_MODE = true; 
};

if (isNil "GRAD_TELEPHONE_CELLTOWER_MODE") then { 
	GRAD_TELEPHONE_CELLTOWER_MODE = true; 
};

if (isNil "GRAD_TELEPHONE_AUTO_SPAWN_CELLTOWERS") then { 
	GRAD_TELEPHONE_AUTO_SPAWN_CELLTOWERS = true; 
};

if (isNil "GRAD_TELEPHONE_MAX_CELLTOWER_RANGE") then { 
	GRAD_TELEPHONE_MAX_CELLTOWER_RANGE = 5000; 
};


// go to init stuff

if (isServer or isDedicated) then {
	[] spawn GRAD_telephone_fnc_initServer;
};

if (hasInterface) then {
	[] spawn GRAD_telephone_fnc_initClient;
};