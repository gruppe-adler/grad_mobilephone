params ["_display"];

missionNamespace setVariable ["GRAD_Nokia3310_curDisplay", _display];

GRAD_Nokia3310_curPage = missionNamespace getVariable ["GRAD_Nokia3310_curPageSave", "home"];
GRAD_Nokia3310_curSel = missionNamespace getVariable ["GRAD_Nokia3310_curSelSave", ""];

[GRAD_Nokia3310_curPage] call GRAD_Nokia3310_fnc_initPage;

if (!isMultiplayer) then {
	diag_log format ["........................................"];
	diag_log format ["grad_nokia3310: loaded phone display %1", _display];
	diag_log format ["........................................"];
};
