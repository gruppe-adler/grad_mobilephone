#include "..\macros_idc.hpp"
#include "defines.hpp"

class GRAD_Nokia3310_dialog
{
	idd = -1;
	movingEnable = 1;
	onUnload = "";
	onLoad = "_this call GRAD_Nokia3310_fnc_onLoad;";
	class controlsBackground {
		class background: RscPicture
		{
			idc = 1;
			text = "GRAD_Nokia3310\data\dialog\background.paa";
			x = safezoneX;
			y = safezoneY;
			w = NOKIA_W;
			h = NOKIA_H;
			moving = 1;
		};
	};
	class Controls {
		class home: RscControlsGroupNoScrollbars
		{
			idc = IDC_CTRLGROUP_HOME;
			show = 0;
			x = 0.214 * NOKIA_W + safezoneX;
			y = 0.273 * NOKIA_H + safezoneY;
			w = SCREEN_W;
			h = SCREEN_H + 0.03798 * NOKIA_H;
			class controls
			{
				#include "partials\home.hpp"
			};
		};
		class mainmenu: RscControlsGroupNoScrollbars
		{
			idc = IDC_CTRLGROUP_MAINMENU;
			show = 0;
			x = 0.214 * NOKIA_W + safezoneX;
			y = 0.31098 * NOKIA_H + safezoneY;
			w = SCREEN_W;
			h = SCREEN_H;
			class controls
			{
				#include "partials\mainmenu.hpp"
			};
		};
		class tones: mainmenu
		{
			idc = IDC_CTRLGROUP_TONES;
			class controls
			{
				#include "partials\tones.hpp"
			};
		};
		class phonebook: tones
		{
			idc = IDC_CTRLGROUP_PHONEBOOK;
			font = "tf_font_dots";
			class controls
			{
				#include "partials\phonebook.hpp"
			};
		};
		class alarm: tones
		{
			idc = IDC_CTRLGROUP_ALARM;
			class controls
			{
				#include "partials\alarm.hpp"
			};
		};
		class history: GRAD_Nokia3310_RscText
		{
			idc = IDC_HISTORY;
			x = 0.214 * NOKIA_W + safezoneX;
			y = 0.273 * NOKIA_H + safezoneY;
			w = 0.584 * NOKIA_W;
			h = 0.03798 * NOKIA_H;
			style = 1;
			text = "";
			sizeEx = 0.03798 * NOKIA_H;
		};
		class enterText: history
		{
			idc = IDC_ENTERTEXT;
			y = 0.444 * NOKIA_H + safezoneY;
			style = 2;
			text = "";
		};
		#include "partials\keys.hpp"
	};
};
