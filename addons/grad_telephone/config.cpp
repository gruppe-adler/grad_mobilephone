class CfgPatches
{
	class grad_telephone
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = { "CBA_Main", "cba_settings", "task_force_radio"};
		author = "nomisum";
		authorUrl = "http://www.gruppe-adler.de";
		url="https://github.com/gruppe-adler/grad-telephone/";
		version = 0.1;
		versionStr = "0.1";
		versionAr[] = {0,1,0};
	};
};

#include "\grad_telephone\CfgFunctions.h"
class grad_telephone_settings {
};
#include "\grad_telephone\description.h"
#include "\grad_telephone\RscTitles.hpp"



/*
class CfgSounds:CfgSounds {
	class TFAR_rotatorPush:TFAR_rotatorPush {};
	class TFAR_rotatorClick:TFAR_rotatorClick {};
};*/


class CfgSounds
{
	class GRAD_telephone_phoneRingBeep1
	{
		name = "phoneRingBeep1";
		sound[] = {"\grad_telephone\sounds\phoneRingBeep1.ogg",0.5,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneRingBeep2
	{
		name = "phoneRingBeep2";
		sound[] = {"\grad_telephone\sounds\phoneRingBeep2.ogg",0.5,1};
		titles[] = {};
	};

	class GRAD_telephone_phoneRingBusy1
	{
		name = "phoneRingBusy1";
		sound[] = {"\grad_telephone\sounds\phoneRingBusy1.ogg",0.5,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneRingBusy2
	{
		name = "phoneRingBusy2";
		sound[] = {"\grad_telephone\sounds\phoneRingBusy2.ogg",0.5,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneRingBusy3
	{
		name = "phoneRingBusy3";
		sound[] = {"\grad_telephone\sounds\phoneRingBusy3.ogg",0.5,1};
		titles[] = {};
	};

	class GRAD_telephone_phoneVibrate1
	{
		name = "phoneVibrate1";
		sound[] = {"\grad_telephone\sounds\phoneVibrate1.ogg",0.5,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneVibrate2
	{
		name = "phoneVibrate2";
		sound[] = {"\grad_telephone\sounds\phoneVibrate2.ogg",0.5,1};
		titles[] = {};
	};

		class GRAD_telephone_phoneUnknown
	{
		name = "phoneUnknown";
		sound[] = {"\grad_telephone\sounds\phoneUnknown.ogg",0.5,1};
		titles[] = {};
	};
};
/*
*/