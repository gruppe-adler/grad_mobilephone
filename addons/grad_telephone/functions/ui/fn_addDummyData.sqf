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
		["1", "XiviD", "0160 7945321", false, objNull],
		["2", "Zarrck", "0170 5456787", false, objNull],
		["3", "Fussel", "0151 2311122", false, objNull]
	]
] call GRAD_telephone_fnc_setPhonePhonebook;