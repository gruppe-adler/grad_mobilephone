private _historyString = missionNamespace getVariable ["GRAD_Nokia3310_curHistory", ""];
private _historyArray = [];

{
     _historyArray pushBack (parseNumber _x);
} forEach (_historyString splitString "-");

_historyArray