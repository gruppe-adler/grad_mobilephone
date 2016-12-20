player addEventHandler ["InventoryClosed", {
        _item = _this select 1;
        if (typeOf _item == "ACE_Cellphone") then {
			player unlinkItem "TFAR_rf7800str";
        };
}];

player addEventHandler ["Take", {
        _item = _this select 2;
        if (typeOf _item == "ACE_Cellphone") then {
        player unlinkItem "ItemRadio";
			player linkItem "TFAR_rf7800str";
        };
}];

// prevent channel switching (always 1)
["preventChannelSwitchEH", "OnSWchannelSet", {
    [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setSwChannel;
}, Player] call TFAR_fnc_addEventHandler;