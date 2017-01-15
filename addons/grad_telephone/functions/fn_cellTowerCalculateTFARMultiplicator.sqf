private ["_distance", "_strengthCaller", "_strengthCalled", "_maxDistanceMultiplicator", "_multiplicator"];

params ["_caller", "_called"];

_multiplicator = 2;

// needed to calculate TFAR multiplicator with
_distance = [_caller, _called] call GRAD_fnc_cellTowerGetAttendeesDistance;

_strengthCaller = _caller getVariable ["GRAD_telephone_currentSignalStrength",0];
_strengthCalled = _called getVariable ["GRAD_telephone_currentSignalStrength",0];

if (DEBUG_MODE) then { diag_log format ["calcTFARmulti: _strengthCaller = %1, _strengthCalled = %2", _strengthCaller, _strengthCalled]; };

// 100k is hardwired phone range
_maxDistanceMultiplicator = _distance/100000;

_overallStrength = floor (_strengthCalled + _strengthCaller)/2;

if (DEBUG_MODE) then { diag_log format ["calcTFARmulti: _distance is %2, _overAllStrength = %1", _overallStrength, _distance]; };

switch (_overallStrength) do {
	case 0: { 
		_multiplicator = 0;
	};
	
	case 1: {
		_multiplicator = _maxDistanceMultiplicator * 1.1;
	};
	
	case 2: {
		_multiplicator = _maxDistanceMultiplicator * 1.3;
	};
	
	case 3: {
		_multiplicator = _maxDistanceMultiplicator * 1.5;
	};
	
	case 4: {
		_multiplicator = _maxDistanceMultiplicator * 2;
	};
	
	case 5: {
		_multiplicator = _maxDistanceMultiplicator * 3;
	};
	
	default {diag_log format ["error calculating TFAR multiplicator gave neither 0,1,2,3,4,5."];};
};

// TODO: THIS IS ONLY DEBUG
_multiplicator = 1;

_multiplicator