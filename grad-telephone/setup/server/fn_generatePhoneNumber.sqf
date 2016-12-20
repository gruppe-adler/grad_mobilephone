/* 
*
* author: nomisum
* generates random phone number but not one from the given array 
*
*/

params ["_existingNumbers"];

_phonePrefixesAfghan = [0701,0702,0703,0704,0705,0706,0707,0708,0799,0798,0797,0796,0795,0794,0793,0786,0787,0788,0789,0771,0772,0773,0774,0775,0776,0777,0778,0779];
_phonePrefixesGerman = [0150,0151,0152,0155,0157,0160,0162,0170,0171,0172,0173,0174,0175,0176,0178,0179];

_phoneNumberLengthAfghan = [6,6];
_phoneNumberLengthGerman = [6,7];

// convert prefix to array
_extractArrayFromPrefix = {
	params ["_array"];
	_result = [];

	{
		_result = _result + [_x];	  
	} forEach _array;
	_result
};

// random number from 0 - 9
_getRandomDigit = {
	_digit = floor (random 9.999);
	_digit
};

// base number after prefix
_generateBaseNumber = {
	params ["_lengthMin", "_lengthMax"];

	if (random 2 < 1) then {
		_length = _lengthMin;
	} else {
		_length = _lengthMax;
	};

	_number = [];

	for [{_i=0}, {_i<_length}, {_i=_i+1}] do
	{
		_nextNumber = [] call _getRandomDigit;
		_number = _number + [_nextNumber];
	};

	_number
};

while (_existingNumbers find _endResult < 0) do {

	_phonePrefixCurrent = [selectRandom _phonePrefixesGerman] call _extractArrayFromPrefix;
	_phoneBaseNumber = [] call _generateBaseNumber;

	_endResult = _phonePrefixCurrent + _phoneBaseNumber;
};

_endResult