/* very hacky to hardcode the classnames, couldnt get any other method to work */

params ["_IED"];

private ["_pos", "_replacement", "_explosion"];

_pos = getPosATL _IED;

deleteVehicle _IED;

switch (typeOf _IED) do { 
	case "ACE_Explosives_Place_IEDUrbanBig" : { _replacement = "IEDUrbanBig_Remote_Ammo"; }; 
	case "ACE_Explosives_Place_IEDUrbanSmall" : { _replacement = "IEDUrbanSmall_Remote_Ammo"; }; 
	case "ACE_Explosives_Place_IEDLandBig" : { _replacement = "IEDLandBig_Remote_Ammo"; }; 
	case "ACE_Explosives_Place_IEDLandSmall" : { _replacement = "IEDLandSmall_Remote_Ammo"; }; 
	default {  _replacement = "IEDUrbanBig_Remote_Ammo"; }; 
};

_explosion = createVehicle [_replacement, _pos, [], 0, "CAN_COLLIDE"];
_explosion setDamage 1;
_unit setVariable ["GRAD_telephone_myIEDlist", _unit getVariable ["GRAD_telephone_myIEDlist", 1] - 1];