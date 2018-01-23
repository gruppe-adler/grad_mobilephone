params ["_unit"];

_result = (getText (configFile >> 'CfgWeapons' >> ([_unit] call GRAD_telephone_fnc_getRadio) >> 'tf_subtype') == 'phone');

_result