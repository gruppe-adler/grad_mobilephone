/*

	array: [_radioID, _name, _number, _isIED, _object]
	types: [string, string, string, bool, obj]

	examples: "tf_fadak_1", "nomisum", "01602342123", false, objNull

	obj is only necessary for IEDs

	[[player] call GRAD_telephone_fnc_getRadio] call GRAD_telephone_fnc_addDummyData;

*/

params ["_phoneID"];


[
	_phoneID,
	[
		["tf_nokia3310_1", "XiviD", "0160 7945321", false, objNull],
		["tf_nokia3310_2", "Zarrck", "0170 5456787", false, objNull],
		["tf_nokia3310_3", "Fussel", "0151 2311122", false, objNull],
		["tf_nokia3310_4", "Slant", "0152 7245325", false, objNull],
		["tf_nokia3310_5", "Simmax", "0153 2516139", false, objNull]
	]
] call GRAD_telephone_fnc_setPhonePhonebook;