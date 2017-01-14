/* 
*
* author: nomisum
* generates random phone number but not one from the given array 
*
*/

private ["_result"];

params ["_existingNumbers"];

_phonePrefixesAfghan = ["0701","0702","0703","0704","0705","0706","0707","0708","0799","0798","0797","0796","0795","0794","0793","0786","0787","0788","0789","0771","0772","0773","0774","0775","0776","0777","0778","0779"];
_phonePrefixesGerman = ["0150","0151","0152","0155","0157","0160","0162","0170","0171","0172","0173","0174","0175","0176","0178","0179"];

_phoneNumberLengthAfghan = [6,6];
_phoneNumberLengthGerman = [6,7];

_result = [0];

// convert prefix to number array
_extractArrayFromPrefix = {
	params ["_string"];
	_result = [];

	_splittedString = _string splitString "";

	{
		_result = _result + [parseNumber _x];	  
	} forEach _splittedString;

	diag_log format ["grad-telephone: splitting number to %1", _result];

	_result
};

// random number from 0 - 9
_getRandomDigit = {
	_digit = ceil (random 8.999);
	_digit
};

// base number after prefix
_generateBaseNumber = {
	params ["_lengthMin", "_lengthMax"];

	_length = _lengthMin; // default 

	if (random 2 > 1) then { _length = _lengthMax; };

	_number = [];

	for [{_i=0}, {_i<_length}, {_i=_i+1}] do
	{
		_nextNumber = [] call _getRandomDigit;
		_number = _number + [_nextNumber];
	};

	_number
};

// check if any numbers were generated before
if (count _existingNumbers > 0) then {

	// check if generated number already exists
	while {_existingNumbers find _existingNumbers >= 0} do {

		_phonePrefixCurrent = [selectRandom _phonePrefixesGerman] call _extractArrayFromPrefix;
		_phoneBaseNumber = [_phoneNumberLengthGerman select 0, _phoneNumberLengthGerman select 1] call _generateBaseNumber;

		_result = _phonePrefixCurrent + _phoneBaseNumber;
	};

} else {
	
	_phonePrefixCurrent = [selectRandom _phonePrefixesGerman] call _extractArrayFromPrefix;
	_phoneBaseNumber = [_phoneNumberLengthGerman select 0, _phoneNumberLengthGerman select 1] call _generateBaseNumber;

	_result = _phonePrefixCurrent + _phoneBaseNumber;

};

_endResult = "";

if (DEBUG_MODE) then { diag_log format ["generatePhoneNumber: %1", _result]; };

{
  _endResult = _endResult + str _x;
} forEach _result;

_endResult