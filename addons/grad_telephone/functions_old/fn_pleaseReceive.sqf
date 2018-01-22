params ["_senderObject", "_receiverObject"];

_canReceive = [
	"default",
	"scrolling_contacts",
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

_state = _receiverObject getVariable ["GRAD_telephone_currentState", "noPhone"];

_result = false;

// if target is not busy, ring him and kick him to receiving
if (_canReceive find _state >= 0) then {
	_result = true;
	_receiverObject setVariable ["GRAD_telephone_currentState", "receiving", true];
	[_senderObject, _receiverObject] remoteExec ["GRAD_fnc_callReceiving", _receiverObject, false];
};

_result