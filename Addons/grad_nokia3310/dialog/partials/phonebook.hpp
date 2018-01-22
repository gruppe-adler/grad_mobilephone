class contacts: GRAD_Nokia3310_RscListBox
{
     idc = IDC_PHONEBOOK_CONTACTS;
     x = SCREEN_W * 0.03;
     y = 0;
     w = SCREEN_W * 0.94;
     h = SCREEN_H;
     sizeEx = SCREEN_H / 4;
};
class settings: contacts
{
     idc = IDC_PHONEBOOK_SETTINGS;
};
class view_name: GRAD_Nokia3310_RscText
{
     idc = IDC_PHONEBOOK_VIEW_NAME;
     x = 0.05 * NOKIA_W;
     y = 0;
     w = SCREEN_W - 0.05 * NOKIA_W;
     h = SCREEN_H;
     style = 16;
     sizeEx = 0.03798 * NOKIA_H;
};
class view_number: view_name
{
     idc = IDC_PHONEBOOK_VIEW_NUMBER;
     x = 0;
     y = 0.04697 * NOKIA_H;
     h = 0.09605 * NOKIA_H;
     font = "RobotoCondensedLight";
     style = 1;
};
