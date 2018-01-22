params ["_display"];

GRAD_Nokia3310_curPage = "null";
GRAD_Nokia3310_curSel = "";
[_display,"home"] call GRAD_Nokia3310_fnc_initPage;

if (!isMultiplayer) then {
	diag_log format ["........................................"];
	diag_log format ["grad_nokia3310: loaded phone display %1", _display];
	diag_log format ["........................................"];
};