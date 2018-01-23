/*

	native phone frequency is counting item ID + 512
	makes every phone unique in its native phone frequency, so no one can hear anyone by default

*/

params ["_unit"];

_array = ([([_unit] call GRAD_telephone_fnc_getRadio), "_"] call CBA_fnc_split);

_offset = _array select 2; // take third part of classname string tf_classname_uniqueID

_result = str (512 + (parseNumber _offset));

_result