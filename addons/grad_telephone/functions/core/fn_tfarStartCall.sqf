private _radio = [player] call GRAD_telephone_fnc_getRadio;

["OnBeforeTangent",
  TFAR_currentUnit,
  [TFAR_currentUnit, _radio, 0, false, true]
] call TFAR_fnc_fireEventHandlers;

// [hintstuff, extensionstuff]
/*
      , [ numberFrequency, stringEncryptionCode, numberSignalStrength, stringSubtype ]

*/

[
  format[localize "STR_transmit",
        format ["%1<img size='1.5' image='%2'/>",
              getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"),
              getText(configFile >> "CfgWeapons"  >> _radio >> "picture")
        ],(_radio call TFAR_fnc_getSwChannel) + 1,
call TFAR_fnc_currentSWFrequency],
format["TANGENT	PRESSED	%1%2	%3	%4",
        [player] call GRAD_telephone_fnc_getNativePhoneFrequency, /* todo called proof */
        _radio call TFAR_fnc_getSwRadioCode,
        getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") *
        (call TFAR_fnc_getTransmittingDistanceMultiplicator),
        "phone"],
-1
] call TFAR_fnc_ProcessTangent;

GRAD_telephone_phone_transmitting = true;

["OnTangent",
  TFAR_currentUnit,
  [TFAR_currentUnit, _radio, 0, false, true]
] call TFAR_fnc_fireEventHandlers;
