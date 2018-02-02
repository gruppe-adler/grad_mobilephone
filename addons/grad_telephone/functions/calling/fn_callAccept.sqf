/* _objectCalled is in most cases PLAYER */

// params ["_objectCaller", "_objectCalled"];
params [["_objectCaller", objNull], "_objectCalled"];

if (isNull _objectCaller) exitWith { if (GRAD_TELEPHONE_DEBUG_MODE) then {diag_log format ["_objectCalled didnt find a caller %1", _objectCalled];}; };

_objectCaller setVariable ["GRAD_telephone_currentState", "talking", true];

_myFrequency = [_objectCalled] call GRAD_telephone_fnc_getNativePhoneFrequency;
_myCode = [_objectCalled] call GRAD_telephone_fnc_getNativePhoneCode;

if (GRAD_TELEPHONE_DEBUG_MODE) then { diag_log format ["callAccept: my frequency %1 and my code %2 will be sent to %3", _myFrequency, _myCode, name _objectCaller]; };

[_myFrequency, _myCode] remoteExec ["GRAD_telephone_fnc_setCallersPhoneFrequency", _objectCaller, false];
