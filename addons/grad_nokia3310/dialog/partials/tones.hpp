class setting: GRAD_Nokia3310_RscText
{
     idc = IDC_TONES_SETTING;
     text = "";
     x = 0.05 * NOKIA_W;
     y = 0;
     w = SCREEN_W / 2;
     h = SCREEN_H;
     style = 16;
     sizeEx = 0.03798 * NOKIA_H;
};
class value: GRAD_Nokia3310_RscText
{
     idc = IDC_TONES_VALUE;
     x = 0;
     y = 0.04697 * NOKIA_H;
     w = SCREEN_W - 0.05 * NOKIA_W;
     h = 0.09605 * NOKIA_H;
     text = "";
     font = "RobotoCondensedLight";
     style = 1;
     sizeEx = 0.03798 * NOKIA_H;
};
class list: GRAD_Nokia3310_RscListBox
{
     idc = IDC_TONES_LIST;
     x = SCREEN_W * 0.03;
     y = 0;
     w = SCREEN_W * 0.94;
     h = SCREEN_H;
     sizeEx = SCREEN_H / 4;
};
