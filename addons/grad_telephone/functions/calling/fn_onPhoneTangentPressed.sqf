private["_depth", "_radio"];

if (time - TF_last_lr_tangent_press > 0.5) then {

	if (!(TF_tangent_phone_pressed) and {alive TFAR_currentUnit} and {[player] call GRAD_telephone_fnc_isCellphone}) then {
		if (call TFAR_fnc_isAbleToUseRadio) then {call TFAR_fnc_unableToUseHint;} else {

			_depth = TFAR_currentUnit call TFAR_fnc_eyeDepth;

			if (	[TFAR_currentUnit,
					TFAR_currentUnit call TFAR_fnc_vehicleIsIsolatedAndInside,
					[TFAR_currentUnit call TFAR_fnc_vehicleIsIsolatedAndInside,
					_depth] call TFAR_fnc_canSpeak, _depth] call TFAR_fnc_canUseSWRadio) then {


					if (GRAD_telephone_phone_transmitting) then {
			        	call GRAD_telephone_fnc_tfarEndCall;
			        } else {
			        	call GRAD_telephone_fnc_tfarStartCall;
			    	};

			        TF_tangent_phone_pressed = true;

			} else {
					call TFAR_fnc_inWaterHint;
			};
		};
	};
};
true
