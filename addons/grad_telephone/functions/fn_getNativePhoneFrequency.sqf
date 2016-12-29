_offset = ([(call TFAR_fnc_activeSwRadio), "_"] call CBA_fnc_split) select 2; // take third part of classname string tf_classname_uniqueID

_result = str (512 + (parseNumber _offset));

_result