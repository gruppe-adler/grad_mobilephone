private ["_nearestMarker", "_distance", "_signalStrength"];

params ["_unit"];


_nearestMarker = [ALL_CELLTOWERS, _unit] call BIS_fnc_nearestPosition;

_distance = _nearestMarker distance2D  _unit;

_d5 = MAX_CELLTOWER_RANGE/5;
_d4 = MAX_CELLTOWER_RANGE/2.5;
_d3 = MAX_CELLTOWER_RANGE/1.6;
_d2 = MAX_CELLTOWER_RANGE/1.25;
_d1 = MAX_CELLTOWER_RANGE;


if (_distance < _d5) then {
	_signalStrength = 5;
};

if (_distance >= _d5 && _distance < _d4) then {
	_signalStrength = 4;
};

if (_distance >= _d4 && _distance < _d3) then {
	_signalStrength = 3;
};

if (_distance >= _d3 && _distance < _d2) then {
	_signalStrength = 2;
};

if (_distance >= _d2 && _distance < _d1) then {
	_signalStrength = 1;
};

if (_distance >= _d1) then {
	_signalStrength = 0;
};

// store only locally for performance reasons if no connection established
if (_unit getVariable ["GRAD_telephone_currentPartner",""] == "") then {
	_unit setVariable ["GRAD_telephone_currentSignalStrength", _signalStrength];
} else {
	_unit setVariable ["GRAD_telephone_currentSignalStrength", _signalStrength, true];
	_partner = _unit getVariable ["GRAD_telephone_currentPartner",""];

	if (DEBUG_MODE) then {diag_log format ["cellTowerSignalStrengthCheck: partner is %1", _partner];};

	_multi = [_unit, _partner] call GRAD_fnc_cellTowerCalculateTFARMultiplicator;
	_unit setVariable ["tf_receivingDistanceMultiplicator", _multi];
	_unit setVariable ["tf_sendingDistanceMultiplicator", _multi];
	
	if (DEBUG_MODE) then {diag_log format ["cellTowerSignalStrengthCheck: setting tf multis to %1", _multi];};
};