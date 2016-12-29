if (isServer or isDedicated) then {
	[] spawn GRAD_fnc_initServer;
};
if (hasInterface) then {
	[] spawn GRAD_fnc_initClient;
};