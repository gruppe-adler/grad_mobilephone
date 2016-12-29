_selector = player getVariable ["GRAD_telephone_contacts_current",0];
_list = player getVariable ["GRAD_telephone_contacts",[]];

_return = _list select _selector select 0;

_return