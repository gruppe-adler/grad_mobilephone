private ["_phoneID", "_number"];

params ["_giver", "_target"];

if (!([_giver] call GRAD_telephone_fnc_isCellphone)) exitWith { hint "You dont have any Cellphone with you."; };
if (!([_target] call GRAD_telephone_fnc_isCellphone)) exitWith { hint format ["%1 doesnt has any Cellphone with him.",_target]; };

_phoneID = _giver getVariable ["GRAD_telephone_phoneID", ""];

_number = _giver getVariable ["GRAD_telephone_currentPhoneNumber", "1337"];

if ([_target, _number] call GRAD_telephone_fnc_interactHasNumber) exitWith { hint "He already has your number."; };

[_target, _giver, _number, _phoneID] remoteExec ["GRAD_telephone_fnc_interactReceiveNumber",_target,false];
[] call GRAD_telephone_fnc_playGiveAnimation;