/* _objectCalled is in most cases PLAYER */

params ["_objectCaller", "_objectCalled"];

if (isNull _objectCalled) exitWith { if (DEBUG_MODE) then {diag_log format ["_objectCalled didnt find a caller %1", _objectCalled];}; };

_objectCaller setVariable ["GRAD_telephone_currentState", "talking", true];
_objectCalled setVariable ["GRAD_telephone_currentState", "talking", true];

_objectCaller setVariable ["GRAD_telephone_currentPartner", _objectCalled, true];
_objectCalled setVariable ["GRAD_telephone_currentPartner", _objectCaller, true];

_myFrequency = [_objectCalled] call GRAD_fnc_getNativePhoneFrequency;
_myCode = [_objectCalled] call GRAD_fnc_getNativePhoneCode;

if (DEBUG_MODE) then { diag_log format ["callAccept: my frequency %1 and my code %2 will be sent to %3", _myFrequency, _myCode, name _objectCaller]; };

[_myFrequency, _myCode] remoteExec ["setCallersPhoneFrequency", _objectCaller, false];