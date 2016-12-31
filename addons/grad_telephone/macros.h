// #define debugLog(msg) if (DEBUG_MODE) then { [msg, "GRAD_mission_debug", [true, true, true] ] call CBA_fnc_debug; }

#define debugLog(msg) if (DEBUG_MODE) then { diag_log (msg); hintsilent (msg);}