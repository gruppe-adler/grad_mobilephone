params ["_button", "_nextIndex", "_lb"];

private _history = call GRAD_Nokia3310_fnc_historyGet;

private _nextIndex = if (tolower _button isEqualTo "down") then {(lbCurSel _lb) + 1} else {(lbCurSel _lb) - 1};
if (_nextIndex isEqualTo (lbSize _lb)) then {_nextIndex = 0;};
if (_nextIndex isEqualTo -1) then {_nextIndex = (lbSize _lb) -1;};

_lb lbsetCurSel _nextIndex;
[format ["3-%1-%2",(_history select 1), _nextIndex + 1]] call GRAD_Nokia3310_fnc_historySet;
