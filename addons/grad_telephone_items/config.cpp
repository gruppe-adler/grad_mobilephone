class CfgPatches
{
  class GRAD_cellphone_items
  {
    units[] = {
      "Item_tf_nokia3310"
    };
    weapons[] = {
      "tf_nokia3310"
    };
    requiredVersion = 1.0;
    requiredAddons[] = {"A3_Modules_F", "A3_UI_F", "A3_Structures_F_Items_Electronics", "A3_Weapons_F_ItemHolders","task_force_radio"};
    author = "nomisum";
    Url = "http://www.gruppe-adler.de";
    version = 0.1.0;
    versionStr = "0.1.0";
    versionAr[] = {0,1,0};
  };
};

class CfgMods {
  #include "\grad_telephone_items\CfgMods.hpp"
};

class CfgFactionClasses
{
  class TFAR;
};

class CfgFontFamilies
{
  class tf_font_dots;
};

class CfgVehicles {
  class Item_Base_F;

  class Item_tf_nokia3310: Item_Base_F
  {
    scope = 2;
    scopeCurator = 2;
    displayName =  "Nokia 3310";
    author = "nomisum";
    vehicleClass = "Items";
    dlc = "grad_telephone_fakedlc";
    class TransportItems
    {
      class tf_nokia3310
      {
        name="tf_nokia3310";
        count=1;
      };
    };
  };
};

#include "radio_ids.hpp"

class CfgWeapons
{
  class ItemRadio;

  class tf_nokia3310: ItemRadio
  {
    author = "nomisum";
    displayName = "Nokia 3310";
    descriptionShort = "Nokia 3310 Mobile Phone";
    scope = 2;
    scopeCurator = 2;
    model = "\A3\Structures_F\Items\Electronics\MobilePhone_old_F.p3d";
    picture = "\grad_telephone_items\nokia3310\nokia3310str_icon.paa";
    dlc = "grad_telephone_fakedlc";
    tf_prototype = 1;
    tf_range = 100000;
    tf_dialog = "nokia3310_radio_dialog";
    tf_encryptionCode = "tf_west_radio_code";
    tf_subtype = "phone";
    tf_parent = "tf_nokia3310";
    tf_additional_channel = 0;
    tf_dialogUpdate = "call TFAR_fnc_updateSWDialogToChannel;";
  };

  TF_RADIO_IDS(tf_nokia3310,Nokia3310)
};
