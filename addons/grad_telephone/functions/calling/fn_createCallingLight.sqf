params ["_item", "_caller"];

private _light = "#lightpoint" createVehiclelocal position _item;

_light setLightDayLight true;
_light setlightbrightness 10;
_light setlightcolor [0.7,1,0.5];
_light setlightambient [0.7,1,0.5];
_light setlightintensity 10;

[{
	(_this select 0) getVariable ["GRAD_telephone_currentState", "noPhone"] != "waiting"
}, 
{
	deleteVehicle (_this select 1);
}, [_caller, _light]] call CBA_fnc_waitUntilAndExec;