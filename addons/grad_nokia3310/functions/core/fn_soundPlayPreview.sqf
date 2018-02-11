params ["_sound"];

if (player getVariable ["GRAD_telephone_listenSoundPreview",false]) exitWith {};

private _dummy = [player, _sound] call GRAD_nokia3310_fnc_soundCreateDummy;

[{
	!(player getVariable ["GRAD_telephone_listenSoundPreview",false])
},{
	params ["_dummy"];
	detach _dummy;
	deleteVehicle _dummy;
}, [_dummy]] call CBA_fnc_waitUntilAndExecute;