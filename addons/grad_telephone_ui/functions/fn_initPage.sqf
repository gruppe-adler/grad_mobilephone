params ["_display","_newPage"];

private _oldPage = grad_telephone_ui_curPage;

grad_telephone_ui_curPage = _newPage;

//reset to default
switch (toLower _oldPage) do {
    case "": {

    };
};

//init new page
