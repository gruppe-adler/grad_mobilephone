#include "\grad_telephone\define.h"

waitUntil {sleep 0.1;!(isNull player)};

// IDC_NOKIA3310STR_CONTACT_NAME_ID = IDC_NOKIA3310STR_CONTACT_NAME;

// for AI testing purposes with TFAR
if (!isMultiplayer) then {
    _teamSwitchEnabler = addMissionEventHandler ["TeamSwitch",{
        TFAR_currentUnit = player;
    }];
};


{
    _x addEventHandler ["InventoryClosed", {
       	// disable all the phone custom stuff
        if (!([player] call GRAD_telephone_fnc_isCellphone)) then {
          	// end all connections
          	if (
              		(player getVariable ["GRAD_telephone_currentState", "noPhone"] == "talking") ||
              		(player getVariable ["GRAD_telephone_currentState", "noPhone"] == "waiting") ||
              		(player getVariable ["GRAD_telephone_currentState", "noPhone"] == "dialing")
          		) then {
          			["default",2,"Ended Call"] spawn GRAD_telephone_fnc_showHint;
          		};

            _radioString = "GRAD_telephone_" + _x + "_contacts";
    		player setVariable ["GRAD_telephone_currentState", "default", true];
    		player setVariable ["GRAD_telephone_currentPartner", objNull, true];
            

    		["preventChannelSwitchEH", "OnSWchannelSet", objNull] call TFAR_fnc_removeEventHandler;
        } else {
        	["preventChannelSwitchEH", "OnSWchannelSet", {
    	    	[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setSwChannel;
    		}, player] call TFAR_fnc_addEventHandler;
    		[(call TFAR_fnc_activeSwRadio), 2] call TFAR_fnc_setSwStereo;
    		[player] call GRAD_telephone_fnc_setNativePhoneFrequency;
    		[player, (call TFAR_fnc_activeSwRadio)] remoteExec ["GRAD_telephone_fnc_getUniquePhoneNumber", 2, false];
    	};
    }];


    ['refreshDisplay', 'OnRadioOpen', { 

    	if ([player] call GRAD_telephone_fnc_isCellphone) then { 
    		[] call GRAD_telephone_fnc_restoreDisplay;
            [player, (call TFAR_fnc_activeSwRadio)] remoteExec ["GRAD_telephone_fnc_getUniquePhoneNumber", 2, false];
    	};
    }, _x] call TFAR_fnc_addEventHandler; 


    // suppress radio hint when transmitting if phone used
    ['suppressRadioHint', 'OnTangent', { 

    	if ([player] call GRAD_telephone_fnc_isCellphone) then { 
    		call TFAR_fnc_HideHint; // hijack original tfar hint, replace with our version
            if (_this select 4) then {
        	   [([player] call GRAD_telephone_fnc_getRadio), -1] call GRAD_telephone_fnc_showRadioInfo;
            } else {
               [([player] call GRAD_telephone_fnc_getRadio), 3] call GRAD_telephone_fnc_showRadioInfo;
            };
        };
    }, _x] call TFAR_fnc_addEventHandler; 


    // setup phone radio when received (mono ear, homescreen)
    ["addRadioSpecifications", "OnRadiosReceived", {
        {
        	if ([player] call GRAD_telephone_fnc_isCellphone) then {
        		player setVariable ["GRAD_telephone_currentState", "default", true];
                player setVariable ["GRAD_telephone_radioID", _x, true];

        		[(call TFAR_fnc_activeSwRadio), 2] call TFAR_fnc_setSwStereo;
        		[player] call GRAD_telephone_fnc_setNativePhoneFrequency;
        		// prevent channel switching (always 1)
        		["preventChannelSwitchEH", "OnSWchannelSet", {
        		    [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setSwChannel;
        		}, player] call TFAR_fnc_addEventHandler;
        		[player, (call TFAR_fnc_activeSwRadio)] remoteExec ["GRAD_telephone_fnc_getUniquePhoneNumber", 2, false];
        	};
        } forEach (_this select 1);
    }, _x] call TFAR_fnc_addEventHandler;
    
} forEach playableUnits + switchableUnits;


///// INTERACTION

//add interaction nodes
[{!isNull player}, {

    _action = [
    	"interactGiveNumber", 
    	"Give phone number", 
    	"grad_telephone\data\give.paa", 
    	{[(_this select 1), (_this select 0)] call GRAD_telephone_fnc_interactGiveNumber;}, 
    	{([player] call GRAD_telephone_fnc_isCellphone)}

    ] call ace_interact_menu_fnc_createAction;


    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
}, []] call CBA_fnc_waitUntilAndExecute;


//add interaction nodes
[{!isNull player}, {

    _action = [
    	"programIED", 
    	"Program IED with your phone", 
    	"grad_telephone\data\give.paa", 
    	{[(_this select 1), (_this select 0)] call GRAD_telephone_fnc_programIED;	}, 
    	{([(_this select 1)] call GRAD_telephone_fnc_isCellphone) && ([(_this select 0)] call GRAD_telephone_fnc_isNotInContacts)}

    ] call ace_interact_menu_fnc_createAction;


    ["ACE_Explosives_Place_IEDUrbanBig",    0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;
    ["ACE_Explosives_Place_IEDUrbanSmall",  0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;
    ["ACE_Explosives_Place_IEDLandBig",     0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;
    ["ACE_Explosives_Place_IEDLandSmall",   0,  ["ACE_MainActions"],    _action,true] call ace_interact_menu_fnc_addActionToClass;

}, []] call CBA_fnc_waitUntilAndExecute;

[{!isNull player}, {
    _condition = {([player] call GRAD_telephone_fnc_isCellphone)};
    _statement = {hintSilent format ["%1",player getVariable ["GRAD_telephone_currentPhoneNumber","1337"]]; };
    _action = ["showMyNumber","Show my Phone Number","grad_telephone\data\give.paa",_statement,_condition] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
}, []] call CBA_fnc_waitUntilAndExecute;


/* CELLTOWER SYSTEM */

if (!GRAD_TELEPHONE_CELLTOWER_MODE) exitWith {};



if (!isMultiplayer) then {
    {
        [{
           (_this select 0) params ["_unit"];
           
           [_unit] call GRAD_telephone_fnc_cellTowerSignalStrengthCheck;

        }, 5, [_x]] call CBA_fnc_addPerFrameHandler;
    } forEach allUnits;
} else {
    [{
       (_this select 0) params ["_unit"];
       
       [_unit] call GRAD_telephone_fnc_cellTowerSignalStrengthCheck;

    }, 5, [player]] call CBA_fnc_addPerFrameHandler;  
};