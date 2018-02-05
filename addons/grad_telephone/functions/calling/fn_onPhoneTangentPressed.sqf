private["_depth", "_radio"];
if (time - TF_last_lr_tangent_press > 0.5) then {
	if (!(TF_tangent_sw_pressed) and {alive TFAR_currentUnit} and {[player] call GRAD_telephone_fnc_isCellphone}) then {
		if (call TFAR_fnc_isAbleToUseRadio) then {
			call TFAR_fnc_unableToUseHint;
		} else {
			_depth = TFAR_currentUnit call TFAR_fnc_eyeDepth;
			if ([TFAR_currentUnit, TFAR_currentUnit call TFAR_fnc_vehicleIsIsolatedAndInside, [TFAR_currentUnit call TFAR_fnc_vehicleIsIsolatedAndInside, _depth] call TFAR_fnc_canSpeak, _depth] call TFAR_fnc_canUseSWRadio) then {
				_radio = [player] call GRAD_telephone_fnc_getRadio;

				["OnBeforeTangent", TFAR_currentUnit, [TFAR_currentUnit, _radio, 0, false, true]] call TFAR_fnc_fireEventHandlers;

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

        TF_tangent_phone_pressed = true;
        GRAD_telephone_phone_transmitting = !GRAD_telephone_phone_transmitting;
				//						unit, radio, radioType, additional, buttonDown
				["OnTangent", TFAR_currentUnit, [TFAR_currentUnit, _radio, 0, false, true]] call TFAR_fnc_fireEventHandlers;
			} else {
				call TFAR_fnc_inWaterHint;
			};
		};
	};
};
true
