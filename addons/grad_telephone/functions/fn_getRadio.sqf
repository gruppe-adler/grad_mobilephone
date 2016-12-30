params ["_ai"];

_result = nil;

{	
	if (_x call TFAR_fnc_isRadio) exitWith {_result = _x};
	true;
} count (assignedItems _ai);

_result