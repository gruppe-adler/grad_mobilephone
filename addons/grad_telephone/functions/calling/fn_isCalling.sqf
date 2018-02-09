params ["_unit"];

private _callingStates = [
	"waiting",
	"receiving",
	"talking",
	"dialing"
];

private _currentState = _unit getVariable ["GRAD_telephone_currentState", "noPhone"];

// return bool if unit is in calling state
(_callingStates find _currentState >= 0)