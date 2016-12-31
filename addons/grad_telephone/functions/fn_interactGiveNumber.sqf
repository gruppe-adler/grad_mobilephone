private ["_radioID", "_number"];

params ["_target"];

if (!([player] call GRAD_fnc_isCellphone)) exitWith { hint "You dont have any Cellphone with you"; };

_radioID = (call TFAR_fnc_activeSwRadio);

_number = player getVariable ["GRAD_telephone_currentPhoneNumber", "1337"];

[player, _number, _radioID] remoteExec ["GRAD_fnc_interactReceiveNumber",_target,false];
[] call GRAD_fnc_playGiveAnimation;