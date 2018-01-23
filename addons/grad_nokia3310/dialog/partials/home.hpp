class carrier: GRAD_Nokia3310_RscPicture
{
     idc = IDC_HOME_CARRIER;
     x = 0;
     y = 0.005 * NOKIA_H;
     w = 0.06 * NOKIA_W;
     h = SCREEN_H + 0.03798 * NOKIA_H;
};
class battery: carrier
{
     idc = IDC_HOME_BATTERY;
     x = SCREEN_W - 0.06 * NOKIA_W;
};
class clock: GRAD_Nokia3310_RscText
{
     idc = IDC_HOME_CLOCK;
     text = "00:00";
     font = "GRAD_font_nokiaCellPhoneFC";
     x = 0;
     y = 0.005 * NOKIA_H;
     w = SCREEN_W - 0.06 * NOKIA_W;
     h = 0.03798 * NOKIA_H;
     sizeEx = 0.03798 * NOKIA_H;
     style = 1;
};
class background : GRAD_Nokia3310_RscPictureKeepAspect
{
     idc = IDC_HOME_BACKGROUND;
     x = 0.08 * NOKIA_W;
     y = 0.03798 * NOKIA_H;
     w = SCREEN_W - 0.16 * NOKIA_W;
     h = SCREEN_H;
     text = "GRAD_Nokia3310\data\dialog\backgrounds\nokia.paa";
};
