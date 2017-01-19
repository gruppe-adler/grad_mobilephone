#include "..\macros.h"

params ["_action"];

[] call GRAD_fnc_fillDummyContacts;

_currentState = player getVariable ["GRAD_telephone_currentState", "default"];

/* possible states
==================
default
dialing --> 	initial delay
waiting --> 	ringing or busy signal
receiving --> 	establishing connection (setting same frequency)
talking --> 	connection established
rejecting --> 	rejecting call and resetting everything
ending -->		frequencys are changed again, beep
scrolling		
hint
*/

switch (_currentState) do {
	case "default": {
		switch (_action) do {
			case "cancel": { ["default",3,localize "$STR_GRAD_radio_UI_cantSelect"] spawn GRAD_fnc_showHint;};
			case "select": { ["default",3,localize "$STR_GRAD_radio_UI_cantSelect"] spawn GRAD_fnc_showHint;};
			case "up": 	   { [true] spawn GRAD_fnc_showNextMenuEntry;};
			case "down":   { [false] spawn GRAD_fnc_showNextMenuEntry;};

			default {diag_log "GRAD_telephone default: button with no action given";};
		};
	};

	case "scrolling_mainmenu": {
		switch (_action) do {
			case "cancel": { [] call GRAD_fnc_gotoHomescreen; };
			case "select": { ["default",3,localize "$STR_GRAD_radio_UI_cantSelect"] spawn GRAD_fnc_showHint;};
			case "up": 	   { [true] spawn GRAD_fnc_showNextMenuEntry;};
			case "down":   { [false] spawn GRAD_fnc_showNextMenuEntry;};

			default {diag_log "GRAD_telephone default: button with no action given";};
		};
	};

	// TODO fill with main menu ^^ //

	
	case "scrolling_contacts": {
		switch (_action) do {
			case "cancel": { [] call GRAD_fnc_gotoHomescreen;};
			case "select": { 
				["Calling..."] spawn GRAD_fnc_showHintUnlimited;

				_targetRadioID = call GRAD_fnc_getSelectedContactRadioID;
				_targetName = call GRAD_fnc_getSelectedContactName;
				_targetObject = call GRAD_fnc_getSelectedContactObject;

				_isIED = call GRAD_fnc_isSelectedContactIED;

				if (!_isIED) then {
					
					[_targetRadioID, _targetName, _targetObject] spawn GRAD_fnc_callDialing;
				} else {
					[_targetRadioID, _targetName] spawn GRAD_fnc_callIED;
				};
			};
			case "up": 	   { [true] spawn GRAD_fnc_showNextContact;};
			case "down":   { [false] spawn GRAD_fnc_showNextContact;};

			default {diag_log "GRAD_telephone scrolling: button with no action given";};
		};
	};
	case "hint": {
		// do nothing to not add up shit
	};
	case "dialing": {
		switch (_action) do {
			case "cancel": { 
					["default",2,"Call aborted"] spawn GRAD_fnc_showHint;
					player setVariable ["GRAD_telephone_currentState", "default", true];
					[] call GRAD_fnc_gotoHomescreen;
				};
			case "select": {};
			case "up": 	   {};
			case "down": {};

			default {diag_log "GRAD_telephone dialing: button with no action given";};
		};
	};
	case "waiting": {
		switch (_action) do {
			case "cancel": { 
					["default",2,"Call aborted"] spawn GRAD_fnc_showHint;
					player setVariable ["GRAD_telephone_currentState", "default", true];
					[] call GRAD_fnc_gotoHomescreen;
				};
			case "select": {};
			case "up": 	   {};
			case "down": {};

			default {diag_log "GRAD_telephone waiting: button with no action given";};
		};
	};
	case "receiving": {
		switch (_action) do {
			case "cancel": {
				[player] call GRAD_fnc_callReject;
			};
			case "select": { 
				[player getVariable ["GRAD_telephone_currentPartner",objNull], player] call GRAD_fnc_callAccept;
			};
			case "up": 	   { [true] spawn GRAD_fnc_showNextContact;};
			case "down":   { [false] spawn GRAD_fnc_showNextContact;};

			default {diag_log "GRAD_telephone receiving: button with no action given";};
		};
	};
	case "talking": {
		switch (_action) do {
			case "cancel": {
				[] spawn GRAD_fnc_callEnding;
			};
			case "select": { };
			case "up": 	   { };
			case "down":   { };

			default {diag_log "GRAD_telephone receiving: button with no action given";};
		};
	};
	case "rejected": {
		switch (_action) do {
			case "cancel": { [] call GRAD_fnc_gotoHomescreen;};
			case "select": { };
			case "up": 	   { [true] spawn GRAD_fnc_showNextContact;};
			case "down":   { [false] spawn GRAD_fnc_showNextContact;};

			default {diag_log "GRAD_telephone scrolling: button with no action given";};
		};
	};


	default {diag_log "GRAD_telephone: currentState is default";};
};
