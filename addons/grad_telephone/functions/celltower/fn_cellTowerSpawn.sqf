private ["_tower"];

params ["_pos", "_classnames"];

// find pos 30-350m from center, 10m to object, not on shore, max 20 slope
_onRoad = true;
_spawnPos = [];

while {_onRoad} do {

	_spawnPos = [_pos, 30, 350, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	_list = _spawnPos nearRoads 15;

	if (count _list == 0) then {
		_onRoad = false;
	};
};

_tower = createVehicle [selectRandom _classnames, _spawnPos, [], 0, "CAN_COLLIDE"];
	
// straight up
// _tower setvectorup [0,0,1];

// sink in ground
// _tower setpos [getpos _tower select 0, getpos _tower select 1, -0.5];

_tower