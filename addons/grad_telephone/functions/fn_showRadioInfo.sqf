/*
 	Name: fn_GRAD_ShowRadioInfo
 	
 	Author(s):
		original by L-H,
		modified by nomisum
 	
 	Description:
 	
 	Parameters: 
	0: OBJECT/STRING - Radio
	1: TIMEOUT - -1 none, 0+x seconds
	
 	
 	Returns:
	Nothing
 	
 	Example:
	[call TFAR_fnc_activeSwRadio] call GRAD_fnc_ShowRadioInfo;
*/
private ["_hintText", "_radio", "_name", "_timeout", "_picture", "_status", "_isDialing", "_isWaiting", "_isCalling", "_imagesize"];
_radio = _this select 0;
_timeout = _this select 1;

_name = getText(configFile >> "CfgWeapons" >> _radio >> "displayName");
_picture =getText(configFile >> "CfgWeapons" >> _radio >> "picture");

_isDialing = player getVariable ["GRAD_telephone_isDialing", 0];
_isWaiting = player getVariable ["GRAD_telephone_isWaiting", 0];
_isCalling = player getVariable ["GRAD_telephone_isCalling", 0];

_status = "no Call established";

if (_isDialing > 0) then {
_status = format ["dialing %1...",_isDialing];
} else {
	if (_isWaiting > 0) then {
		_status = format ["dialing %1...",_isWaiting];
	} else {
		if (_isCalling > 0) then {
			_status = format ["dialing %1...",_isCalling];
		};
	};
};


_imagesize = "1.6";

_hintText = format [("<t size='1' align='center'>%1 <img size='" + _imagesize + 
	"' image='%2'/></t><br />
	<t align='center'>%3</t><br />"), _name,_picture,_status];
	
[parseText (_hintText), _timeout] call TFAR_fnc_showHint;