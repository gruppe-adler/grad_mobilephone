/* check if currently active radio is the same as the dummyRadio */

_isSame = false;

_equippedRadio = call TFAR_fnc_activeSwRadio;
_savedRadio = player getVariable ["GRAD_telephone_dummyRadioClassname","none"];

if (_equippedRadio == _savedRadio) then {
	_isSame = true;
};

_isSame