player addEventHandler ["InventoryClosed", {
       
        if ("ACE_Cellphone" in items player) then {
            if (!assignedItems player find "PLAYER_RADIO" >= 0) then {
			     player unlinkItem "ItemRadio";
            };
        };
}];

player addEventHandler ["Take", {
        _item = _this select 2;

        hintsilent format ["%1 take", _item];

        if (_item == "ACE_Cellphone") then {
            if (assignedItems player find "ItemRadio" >= 0) then {
                player unassignItem "ItemRadio";
            };
		  player additem (player getVariable ["GRAD_telephone_dummyRadioClassname","ItemRadio"]);
          [(player getVariable ["GRAD_telephone_dummyRadioClassname","ItemRadio"])] call TFAR_fnc_setActiveSwRadio;
          hintsilent "FOUND NO RADIO, adding.";
        };
}];

// prevent channel switching (always 1)
["preventChannelSwitchEH", "OnSWchannelSet", {
    [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setSwChannel;
}, Player] call TFAR_fnc_addEventHandler;