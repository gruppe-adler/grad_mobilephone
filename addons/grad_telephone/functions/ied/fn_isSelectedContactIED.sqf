_phone = player getVariable ["GRAD_telephone_radioID", objNull];

_selector = _phone getVariable ["GRAD_telephone_contacts_current",0];
_list = _phone getVariable ["GRAD_telephone_contacts",[]];

_return = _list select _selector select 3;

_return