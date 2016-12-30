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
private ["_hintText", "_radio", "_name", "_realname", "_classname", "_splitThisShit", "_timeout", "_picture", "_status", "_isDialing", "_isWaiting", "_isCalling", "_imagesize"];
_radio = _this select 0;
_timeout = _this select 1;

_splitThisShit = ([_radio, "_"] call CBA_fnc_split);

_realname = (_splitThisShit select 0) + (_splitThisShit select 1);


_picture =getText(configFile >> "CfgWeapons" >> _radio >> "picture");

_isDialing = player getVariable ["GRAD_telephone_currentState", "noPhone"] == "dialing";
_isWaiting = player getVariable ["GRAD_telephone_currentState", "noPhone"] == "waiting";
_isCalling = player getVariable ["GRAD_telephone_currentState", "noPhone"] == "talking";

_status = "No Call established";

_partner = player getVariable ["GRAD_telephone_currentPartner", ""];

if (_isDialing) then {
	_status = format ["dialing %1...",_partner];
} else {
	if (_isWaiting) then {
		_status = format ["waiting for %1...",_partner];
	} else {
		if (_isCalling) then {
			_status = format ["talking to %1...",_partner];
		};
	};
};


_imagesize = "1.6";

_hintText = format [("<t size='1' align='center'>%1 <img size='" + _imagesize + 
	"' image='%2'/></t><br />
	<t align='center'>%3</t><br />"), _realname,_picture,_status];
	
[parseText (_hintText), _timeout] call TFAR_fnc_showHint;