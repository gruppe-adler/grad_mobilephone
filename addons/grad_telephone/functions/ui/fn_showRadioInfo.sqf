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
	[call TFAR_fnc_activeSwRadio] call GRAD_telephone_fnc_ShowRadioInfo;
*/
private ["_hintText", "_radio", "_name", "_realname", "_classname", "_splitThisShit", "_timeout", "_picture", "_status", "_isDialing", "_isWaiting", "_isCalling", "_imagesize"];
_radio = _this select 0;
_timeout = _this select 1;


_radioDisplayName = getText(configFile >> "CfgWeapons" >> _radio >> "displayName");
_splitThisShit = ([_radio, "_"] call CBA_fnc_split);

_realname = (_splitThisShit select 0) + (_splitThisShit select 1);


_picture = getText(configFile >> "CfgWeapons" >> _radio >> "picture");

_currentState = player getVariable ["GRAD_telephone_currentState", "noPhone"] == "dialing";

_text = format ["Kein Gespräch"];

_partnerObject = (player getVariable ["GRAD_telephone_currentPartner", objNull]);

if (!isNull _partnerObject) exitWith {};

_partnerName = name _partnerObject;

switch (_currentState) do {
	case "dialing": { _text = format ["Wähle %1",_partnerName]; };
	case "waiting": { _text = format ["Wähle %1",_partnerName]; };
	case "talking": { _text = format ["Gespräch mit %1",_partnerName]; };
	case "receiving": { _text = format ["%1 ruft an",_partnerName]; };
	case "ending": { _text = format ["beende Gespräch mit %1",_partnerName]; };
	case "default": { _text = format ["Kein Gespräch"]; };
	default { _text = format ["Kein Gespräch"]; };
};


_imagesize = "1.6";

_hintText = format [("<t size='1' align='center'>%1 <img size='" + _imagesize + 
	"' image='%2'/></t><br />
	<t align='center'>%3</t><br />"), _realname,_picture,_text];
	
//todo callback to display
