_radioID = (call TFAR_fnc_activeSwRadio);
_phone = missionNamespace getVariable ["GRAD_telephone_" + _radioID + "contacts", objNull];

_selector = _phone getVariable ["GRAD_telephone_contacts_current",0];
_list = _phone getVariable ["GRAD_telephone_contacts",[]];

_return = _list select _selector select 4;

_return