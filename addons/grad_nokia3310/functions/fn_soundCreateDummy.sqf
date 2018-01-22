params ["_unit", "_sound"];

private _dummyVehicle =  createVehicle ["Land_ClutterCutter_small_F", position _unit, [], 0, "CAN_COLLIDE"];

_unit setVariable ["GRAD_telephone_listenSoundPreview",true];

_dummyVehicle attachTo [_unit, [0,0,1.8]];
_dummyVehicle say3D _sound;

_dummyVehicle