params ["_item", "_caller"];

private _light = "#lightpoint" createVehiclelocal position _item;

_light setLightDayLight true;
_light setlightbrightness 0.5;
_light setlightcolor [0.7,1,0.5];
_light setlightambient [0.7,1,0.5];
// start, constant, linear, quadratic, hardlimitstart, hardlimitend
_light setLightAttenuation [0,4,4,0,0.05,0.1];

[{
	(_this select 0) getVariable ["GRAD_telephone_currentState", "noPhone"] != "waiting"
}, 
{
	deleteVehicle (_this select 1);
}, [_caller, _light]] call CBA_fnc_waitUntilAndExecute;