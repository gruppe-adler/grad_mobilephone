private _display = call GRAD_Nokia3310_fnc_displayGet;

private _hour = str (floor daytime);
private _minute = (floor ((daytime - _hour) * 60));

private _time24 = format ["%1:%2", [_hour, 2] call CBA_fnc_formatNumber, [_minute, 2] call CBA_fnc_formatNumber]];
(_display displayCtrl IDC_HOME_CLOCK) ctrlSetText _time24;
