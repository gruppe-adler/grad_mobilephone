#include "\grad_telephone\define.h"

waitUntil {sleep 0.2;time > 0};
waitUntil {sleep 0.1;!(isNull player)};

IDC_NOKIA3310STR_CONTACT_NAME_ID = IDC_NOKIA3310STR_CONTACT_NAME;

// for AI testing purposes with TFAR
_teamSwitchEnabler = addMissionEventHandler ["onTeamSwitch",{
    TFAR_currentUnit = player;
}];


{
    _x addEventHandler ["InventoryClosed", {
       	// disable all the phone custom stuff
        if (!([player] call GRAD_fnc_isCellphone)) then {
          	// end all connections
          	if (
              		(player getVariable ["GRAD_telephone_currentState", "noPhone"] == "talking") ||
              		(player getVariable ["GRAD_telephone_currentState", "noPhone"] == "waiting") ||
              		(player getVariable ["GRAD_telephone_currentState", "noPhone"] == "dialing")
          		) then {
          			["default",2,"Ended Call"] spawn GRAD_fnc_showHint;
          		};

    		player setVariable ["GRAD_telephone_currentState", "default", true];
    		player setVariable ["GRAD_telephone_currentPartner", objNull, true];

    		["preventChannelSwitchEH", "OnSWchannelSet", objNull] call TFAR_fnc_removeEventHandler;
        } else {
        	["preventChannelSwitchEH", "OnSWchannelSet", {
    	    	[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setSwChannel;
    		}, Player] call TFAR_fnc_addEventHandler;
    		[(call TFAR_fnc_activeSwRadio), 2] call TFAR_fnc_setSwStereo;
    		[player] call GRAD_fnc_setNativePhoneFrequency;
    		[player, (call TFAR_fnc_activeSwRadio)] remoteExec ["GRAD_fnc_getUniquePhoneNumber", 2, false];
    	};
    }];


    ['refreshDisplay', 'OnRadioOpen', { 

    	if ([player] call GRAD_fnc_isCellphone) then { 
    		[] call GRAD_fnc_restoreDisplay;
            [player, (call TFAR_fnc_activeSwRadio)] remoteExec ["GRAD_fnc_getUniquePhoneNumber", 2, false];
    	};

    }, _x] call TFAR_fnc_addEventHandler; 


    // suppress radio hint when transmitting if phone used
    ['suppressRadioHint', 'OnTangent', { 

    	if ([player] call GRAD_fnc_isCellphone) then { 

            // if button is pressed, show hint, else hide
            if (_this select 4) then {
    		  call TFAR_fnc_HideHint; // hijack original tfar hint, replace with our version
        	  [([player] call GRAD_fnc_getRadio), -1] call GRAD_fnc_showRadioInfo;
            } else {
              call TFAR_fnc_HideHint;
            };
    	}; 

    }, _x] call TFAR_fnc_addEventHandler; 


    // setup phone radio when received (mono ear, homescreen)
    ["addRadioSpecifications", "OnRadiosReceived", {

    	if ([player] call GRAD_fnc_isCellphone) then {

    		[(call TFAR_fnc_activeSwRadio), 2] call TFAR_fnc_setSwStereo;
    		[player] call GRAD_fnc_setNativePhoneFrequency;
    		// prevent channel switching (always 1)
    		["preventChannelSwitchEH", "OnSWchannelSet", {
    		    [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setSwChannel;
    		}, Player] call TFAR_fnc_addEventHandler;
    		[player, (call TFAR_fnc_activeSwRadio)] remoteExec ["GRAD_fnc_getUniquePhoneNumber", 2, false];
    	};

    }, _x] call TFAR_fnc_addEventHandler;
} forEach playableUnits + switchableUnits;


///// INTERACTION

//add interaction nodes
[{!isNull player}, {

    _action = [
    	"interactGiveNumber", 
    	"Give phone number", 
    	"grad_telephone\data\give.paa", 
    	{[(_this select 1), (_this select 0)] call GRAD_fnc_interactGiveNumber;}, 
    	{([player] call GRAD_fnc_isCellphone)}

    ] call ace_interact_menu_fnc_createAction;


    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
}, []] call CBA_fnc_waitUntilAndExecute;


//add interaction nodes
[{!isNull player}, {

    _action = [
    	"programIED", 
    	"Program IED with your phone", 
    	"grad_telephone\data\give.paa", 
    	{[(_this select 1), (_this select 0)] call GRAD_fnc_programIED;	}, 
    	{([(_this select 1)] call GRAD_fnc_isCellphone) && ([(_this select 0)] call GRAD_fnc_isNotInContacts)}

    ] call ace_interact_menu_fnc_createAction;


    ["ACE_Explosives_Place_IEDUrbanBig",    0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;
    ["ACE_Explosives_Place_IEDUrbanSmall",  0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;
    ["ACE_Explosives_Place_IEDLandBig",     0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;
    ["ACE_Explosives_Place_IEDLandSmall",   0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;

}, []] call CBA_fnc_waitUntilAndExecute;


/* CELLTOWER SYSTEM */

if (!CELLTOWER_MODE) exitWith {};



if (!isMultiplayer) then {
    {
        [{
           (_this select 0) params ["_unit"];
           
           [_unit] call GRAD_fnc_cellTowerSignalStrengthCheck;

        }, 5, [_x]] call CBA_fnc_addPerFrameHandler;
    } forEach allUnits;
} else {
    [{
       (_this select 0) params ["_unit"];
       
       [_unit] call GRAD_fnc_cellTowerSignalStrengthCheck;

    }, 5, [player]] call CBA_fnc_addPerFrameHandler;  
};