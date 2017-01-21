#include "defines.hpp"

class nokia3310_radio_dialog
{
	idd = IDD_NOKIA3310STR_RADIO_DIALOG;
	movingEnable = 1;
	controlsBackground[] = { background };
	objects[] = { };
	onUnload = "";
	onLoad = "";

	controls[]=
	{

		carrier,
		clear,
		enter,
		select_up,
		select_down,
		button_1,
		button_2,
          button_3,
          button_4,
		button_5,
		button_6,
		button_7,
		button_8,
		button_9,
		button_star,
		button_0,
		button_hash
	};



	class background: RscBackPicture
	{
		idc = 1;
		text = "grad_telephone_ui\data\nokia3310\background.paa";
		x = 0.2 * safezoneW + safezoneX;
		y = 0.05 * safezoneH + safezoneY;
		w = 0.27878 * safezoneW;
		h = 1.034 * safezoneH;
		moving = 1;
	};
	class carrier: background
	{
          text = "grad_telephone_ui\data\nokia3310\carrier_3.paa";
		x = 0.268 * safezoneW + safezoneX;
		y = 0.374 * safezoneH + safezoneY;
		w = 0.01742 * safezoneW;
		h = 0.1293 * safezoneH;
		moving = 1;
	};
/*
	class decrease_volume: HiddenButton
	{
		text = "";
		idc = IDC_NOKIA3310STR_DECREASE_VOLUME;
		x = 0.43 * safezoneW + safezoneX;
		y = 0.47 * safezoneH + safezoneY;
		w = 0.02 * safezoneW;
		h = 0.04 * safezoneH;
		tooltip = "decrease volume";
//		action = "_volume = TF_sw_dialog_radio call TFAR_fnc_getSwVolume; if (_volume >= 0) then {[TF_sw_dialog_radio,_volume - 1] call TFAR_fnc_setSwVolume;}; [TF_sw_dialog_radio] call TFAR_fnc_ShowRadioSpeakers;";
	};
	class increase_volume: HiddenButton
	{
		text = "";
		idc = IDC_NOKIA3310STR_INCREASE_VOLUME;
		x = 0.43 * safezoneW + safezoneX;
		y = 0.35 * safezoneH + safezoneY;
		w = 0.02 * safezoneW;
		h = 0.04 * safezoneH;
		tooltip = "increase volume";
//		action = "_volume = TF_sw_dialog_radio call TFAR_fnc_getSwVolume; if (_volume < 9) then {[TF_sw_dialog_radio,_volume + 1] call TFAR_fnc_setSwVolume;}; [TF_sw_dialog_radio] call TFAR_fnc_ShowRadioSpeakers;";
	};
	class speakers: HiddenButton
	{
		text = "";
		idc = IDC_NOKIA3310STR_SPEAKERS;
		x = 0.305 * safezoneW + safezoneX;
		y = 0.19 * safezoneH + safezoneY;
		w = 0.06 * safezoneW;
		h = 0.03 * safezoneH;
		tooltip = $STR_speakers_settings_true;
//		action = "[TF_sw_dialog_radio] call TFAR_fnc_setSwSpeakers; [TF_sw_dialog_radio] call TFAR_fnc_ShowRadioSpeakers;";
	};
*/
	/*
	class stereo: HiddenButton
	{
		text = "STEREO";
		idc = IDC_NOKIA3310STR_STEREO;
		x = 0.21 * safezoneW + safezoneX;
		y = 0.4186 * safezoneH + safezoneY;
		w = 0.03 * safezoneW;
		h = 0.03 * safezoneH;
		action = "_balance = 1; if ((TF_sw_dialog_radio call TFAR_fnc_getCurrentSwStereo) == 1) then {_balance = 2}; [TF_sw_dialog_radio, _balance] call TFAR_fnc_setSwStereo; [TF_sw_dialog_radio] call TFAR_fnc_ShowRadioSpeakers;";
		tooltip = $STR_stereo_settings;
	};
	class contact_name: RscEditLCD
	{
		idc = IDC_NOKIA3310STR_CONTACT_NAME;
		text = "";
		x = 0.28 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.05 * safezoneH;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (0.4 / (getResolution select 5))";
		moving = 1;
		font = "tf_font_dots";
		shadow = 2;
		canModify = 0;
		tooltip = "";
	};
	class contact_number: RscEditLCD
	{
		idc = IDC_MICRODAGR_EDIT;
		text = "";
		x = 0.28 * safezoneW + safezoneX;
		y = 0.47 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.05 * safezoneH;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (0.6 / (getResolution select 5))";
		moving = 1;
		font = "tf_font_dots";
		shadow = 2;
		canModify = 1;
		tooltip = "";
	};
*/
	class clear: HiddenButton
	{
		x = 0.26 * safezoneW + safezoneX;
		y = 0.61 * safezoneH + safezoneY;
		w = 0.0402187 * safezoneW;
		h = 0.08 * safezoneH;
		onButtonClick = "['cancel',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
	class enter: HiddenButton
	{
		idc = -1;
		x = 0.298 * safezoneW + safezoneX;
		y = 0.585 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.0517 * safezoneH;
		onButtonClick = "['select',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
	class select_up: HiddenButton
	{
		idc = -1;
		x = 0.39 * safezoneW + safezoneX;
		y = 0.61 * safezoneH + safezoneY;
		w = 0.03 * safezoneW;
		h = 0.06 * safezoneH;
		onButtonClick = "['up',_this] call grad_telephone_ui_fnc_onButtonClick;";

	};
	class select_down: HiddenButton
	{
		x = 0.355 * safezoneW + safezoneX;
		y = 0.655 * safezoneH + safezoneY;
		w = 0.035 * safezoneW;
		h = 0.06 * safezoneH;
		onButtonClick = "['down',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
	class button_1: HiddenButton
     {
          idc = -1;
          x = 0.252 * safezoneW + safezoneX;
		y = 0.725 * safezoneH + safezoneY;
		w = 0.045 * safezoneW;
		h = 0.0517 * safezoneH;
		onButtonClick = "['1',_this] call grad_telephone_ui_fnc_onButtonClick;";
     };
	class button_2: button_1
	{
		x = 0.32 * safezoneW + safezoneX;
		y = 0.74 * safezoneH + safezoneY;
		onButtonClick = "['2',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
	class button_3: button_1
	{
		x = 0.386 * safezoneW + safezoneX;
		onButtonClick = "['3',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
     class button_4: button_1
     {
          x = 0.256 * safezoneW + safezoneX;
          y = 0.793 * safezoneH + safezoneY;
		onButtonClick = "['4',_this] call grad_telephone_ui_fnc_onButtonClick;";
     };
	class button_5: button_2
	{
		y = 0.809 * safezoneH + safezoneY;
		onButtonClick = "['5',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
	class button_6: button_4
	{
		x = 0.383 * safezoneW + safezoneX;
		onButtonClick = "['6',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
     class button_7: button_1
     {
          x = 0.259 * safezoneW + safezoneX;
          y = 0.866 * safezoneH + safezoneY;
		onButtonClick = "['7',_this] call grad_telephone_ui_fnc_onButtonClick;";
     };
	class button_8: button_2
	{
		y = 0.881 * safezoneH + safezoneY;
		onButtonClick = "['8',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
	class button_9: button_7
	{
		x = 0.381 * safezoneW + safezoneX;
		onButtonClick = "['9',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
     class button_star: button_1
     {
          x = 0.262 * safezoneW + safezoneX;
          y = 0.934 * safezoneH + safezoneY;
		onButtonClick = "['star',_this] call grad_telephone_ui_fnc_onButtonClick;";
     };
	class button_0: button_2
	{
		y = 0.951 * safezoneH + safezoneY;
		onButtonClick = "['0',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
	class button_hash: button_star
	{
		x = 0.379 * safezoneW + safezoneX;
		onButtonClick = "['hash',_this] call grad_telephone_ui_fnc_onButtonClick;";
	};
};
