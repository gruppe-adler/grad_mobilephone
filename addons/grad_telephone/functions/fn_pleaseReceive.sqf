params ["_name"];

_canReceive = [
	"default",
	"scrolling",
	"hint"
];

_canNotReceive = [
	"waiting",
	"receiving",
	"talking",
	"ending",
	"dialing",
	"rejecting"
];

_state = _name getVariable ["GRAD_telephone_currentState", "noPhone"];

_result = false;

// if target is not busy, ring him and kick him to receiving
if (_canReceive find _state > 0) then {
	_result = true;
	_name setVariable ["GRAD_telephone_currentState", "receiving", true];
	[player,_name] remoteExec ["GRAD_fnc_callReceiving", _name, false];
};

// unnecessary really, but gives better understanding
if (_canNotReceive find _state > 0) then {
	_result = false;
};

_result