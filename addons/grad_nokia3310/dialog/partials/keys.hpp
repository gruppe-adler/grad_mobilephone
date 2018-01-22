class enter: GRAD_Nokia3310_HiddenButton
{
     x = 0.348 * NOKIA_W + safezoneX;
     y = 0.524 * NOKIA_H + safezoneY;
     w = 0.320 * NOKIA_W;
     h = 0.046 * NOKIA_H;
     onButtonClick = "['select',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class clear: GRAD_Nokia3310_HiddenButton
{
     x = 0.224 * NOKIA_W + safezoneX;
     y = 0.547 * NOKIA_H + safezoneY;
     w = 0.134 * NOKIA_W;
     h = 0.071 * NOKIA_H;
     onButtonClick = "['cancel',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class select_up: GRAD_Nokia3310_HiddenButton
{
     x = 0.692 * NOKIA_W + safezoneX;
     y = 0.542 * NOKIA_H + safezoneY;
     w = 0.112 * NOKIA_W;
     h = 0.072 * NOKIA_H;
     onButtonClick = "['up',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class select_down: GRAD_Nokia3310_HiddenButton
{
     x = 0.560 * NOKIA_W + safezoneX;
     y = 0.574 * NOKIA_H + safezoneY;
     w = 0.112 * NOKIA_W;
     h = 0.072 * NOKIA_H;
     onButtonClick = "['down',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_1: GRAD_Nokia3310_HiddenButton
{
     x = 0.194 * NOKIA_W + safezoneX;
     y = 0.646 * NOKIA_H + safezoneY;
     w = 0.158 * NOKIA_W;
     h = 0.056 * NOKIA_H;
     onButtonClick = "['1',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_2: button_1
{
     x = 0.430 * NOKIA_W + safezoneX;
     y = 0.663 * NOKIA_H + safezoneY;
     onButtonClick = "['2',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_3: button_1
{
     x = 0.670 * NOKIA_W + safezoneX;
     onButtonClick = "['3',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_4: button_1
{
     x = 0.200 * NOKIA_W + safezoneX;
     y = 0.716 * NOKIA_H + safezoneY;
     onButtonClick = "['4',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_5: button_2
{
     y = 0.733 * NOKIA_H + safezoneY;
     onButtonClick = "['5',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_6: button_4
{
     x = 0.662 * NOKIA_W + safezoneX;
     onButtonClick = "['6',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_7: button_1
{
     x = 0.208 * NOKIA_W + safezoneX;
     y = 0.786 * NOKIA_H + safezoneY;
     onButtonClick = "['7',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_8: button_2
{
     y = 0.8 * NOKIA_H + safezoneY;
     onButtonClick = "['8',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_9: button_7
{
     x = 0.652 * NOKIA_W + safezoneX;
     onButtonClick = "['9',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_star: button_1
{
     x = 0.220 * NOKIA_W + safezoneX;
     y = 0.854 * NOKIA_H + safezoneY;
     onButtonClick = "['star',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_0: button_2
{
     y = 0.869 * NOKIA_H + safezoneY;
     onButtonClick = "['0',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
class button_hash: button_star
{
     x = 0.646 * NOKIA_W + safezoneX;
     onButtonClick = "['hash',_this] call GRAD_Nokia3310_fnc_btnClick;";
};
