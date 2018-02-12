params ["_display"];

missionNamespace setVariable ["GRAD_Nokia3310_curPageSave", GRAD_Nokia3310_curPage];
missionNamespace setVariable ["GRAD_Nokia3310_curSelSave", GRAD_Nokia3310_curSel];
missionNamespace setVariable ["GRAD_Nokia3310_curHistory", GRAD_Nokia3310_curHistory];

if (!isMultiplayer) then {
	diag_log format ["........................................"];
	diag_log format ["grad_nokia3310: loaded phone display %1", _display];
	diag_log format ["........................................"];
};
