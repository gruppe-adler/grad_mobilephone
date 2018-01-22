// check if _caller and _called are in reach of celltower

private ["_isReachable"];

params ["_caller"];

_isReachable = true;

if (CELLTOWER_MODE) then {
	_nearestMarker = 	[ALL_CELLTOWERS, _caller] call BIS_fnc_nearestPosition;

	if (_called distance2D _nearestMarker > MAX_CELLTOWER_RANGE) then {	_isReachable = false; };
};

_isReachable