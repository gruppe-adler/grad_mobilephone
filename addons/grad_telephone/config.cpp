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
		sound[] = {"\grad_telephone\sounds\phoneRingBeep1.ogg",0.75,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneRingBeep2
	{
		name = "phoneRingBeep2";
		sound[] = {"\grad_telephone\sounds\phoneRingBeep2.ogg",0.75,1};
		titles[] = {};
	};

	class GRAD_telephone_phoneRingBusy1
	{
		name = "phoneRingBusy1";
		sound[] = {"\grad_telephone\sounds\phoneRingBusy1.ogg",0.75,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneRingBusy2
	{
		name = "phoneRingBusy2";
		sound[] = {"\grad_telephone\sounds\phoneRingBusy2.ogg",0.75,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneRingBusy3
	{
		name = "phoneRingBusy3";
		sound[] = {"\grad_telephone\sounds\phoneRingBusy3.ogg",0.75,1};
		titles[] = {};
	};

	class GRAD_telephone_phoneVibrate1
	{
		name = "phoneVibrate1";
		sound[] = {"\grad_telephone\sounds\phoneVibrate1.ogg",1.5,1};
		titles[] = {};
	};
	class GRAD_telephone_phoneVibrate2
	{
		name = "phoneVibrate2";
		sound[] = {"\grad_telephone\sounds\phoneVibrate2.ogg",1.5,1};
		titles[] = {};
	};

	class GRAD_telephone_phoneRingOriginal
	{
		name = "GRAD_telephone_phoneRingOriginal";
		sound[] = {"\grad_telephone\sounds\phoneRingOriginal.ogg",1.5,1};
		titles[] = {};
	};

	class GRAD_telephone_phoneUnknown
	{
		name = "phoneUnknown";
		sound[] = {"\grad_telephone\sounds\phoneUnknown.ogg",0.75,1};
		titles[] = {};
	};


	/* nokia3310 specific */

	class GRAD_telephone_ringtone_attraction
	{
		name = "attraction";
		sound[] = {"\grad_telephone\nokia3310\ringtones\attraction.ogg",1,1};
		titles[] = {};
		GRAD_delay = 0;
		GRAD_length = 28.4;
	};
	class GRAD_telephone_ringtone_badinerie
	{
		name = "badinerie";
		sound[] = {"\grad_telephone\nokia3310\ringtones\badinerie.ogg",1,1};
		titles[] = {};
		GRAD_delay = 0.5;
		GRAD_length = 16;
	};
	class GRAD_telephone_ringtone_citybird
	{
		name = "citybird";
		sound[] = {"\grad_telephone\nokia3310\ringtones\citybird.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2.5;
		GRAD_length = 1.735;
	};
	class GRAD_telephone_ringtone_frog
	{
		name = "frog";
		sound[] = {"\grad_telephone\nokia3310\ringtones\frog.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2.5;
		GRAD_length = 1.53;
	};
	class GRAD_telephone_ringtone_hurdygurdy
	{
		name = "hurdygurdy";
		sound[] = {"\grad_telephone\nokia3310\ringtones\hurdygurdy.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2;
		GRAD_length = 11;
	};
	class GRAD_telephone_ringtone_jumping
	{
		name = "jumping";
		sound[] = {"\grad_telephone\nokia3310\ringtones\jumping.ogg",1,1};
		titles[] = {};
		GRAD_delay = 3;
		GRAD_length = 4;
	};
	class GRAD_telephone_ringtone_kick
	{
		name = "kick";
		sound[] = {"\grad_telephone\nokia3310\ringtones\kick.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2;
		GRAD_length = 4;
	};
	class GRAD_telephone_ringtone_knickknack
	{
		name = "knickknack";
		sound[] = {"\grad_telephone\nokia3310\ringtones\knickknack.ogg",1,1};
		titles[] = {};
		GRAD_delay = 1.5;
		GRAD_length = 10.5;
	};
	class GRAD_telephone_ringtone_lamp
	{
		name = "lamp";
		sound[] = {"\grad_telephone\nokia3310\ringtones\lamp.ogg",1,1};
		titles[] = {};
		GRAD_delay = 0.5;
		GRAD_length = 42;
	};
	class GRAD_telephone_ringtone_low
	{
		name = "low";
		sound[] = {"\grad_telephone\nokia3310\ringtones\low.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2.5;
		GRAD_length = 1.5;
	};
	class GRAD_telephone_ringtone_merry_xmas
	{
		name = "merry_xmas";
		sound[] = {"\grad_telephone\nokia3310\ringtones\merry_xmas.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2;
		GRAD_length = 9;
	};
	class GRAD_telephone_ringtone_ringring
	{
		name = "ringring";
		sound[] = {"\grad_telephone\nokia3310\ringtones\ringring.ogg",1,1};
		titles[] = {};
		GRAD_delay = 3;
		GRAD_length = 1.5;
	};
	class GRAD_telephone_ringtone_rocket
	{
		name = "rocket";
		sound[] = {"\grad_telephone\nokia3310\ringtones\rocket.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2;
		GRAD_length = 1.5;
	};
	class GRAD_telephone_ringtone_thatsit
	{
		name = "thatsit";
		sound[] = {"\grad_telephone\nokia3310\ringtones\thatsit.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2.5;
		GRAD_length = 5;
	};
	class GRAD_telephone_ringtone_the_buffoon
	{
		name = "the_buffoon";
		sound[] = {"\grad_telephone\nokia3310\ringtones\the_buffoon.ogg",1,1};
		titles[] = {};
		GRAD_delay = 2.5;
		GRAD_length = 12.7;
	};
	class GRAD_telephone_ringtone_ticktickv
	{
		name = "ticktick";
		sound[] = {"\grad_telephone\nokia3310\ringtones\ticktick.ogg",1,1};
		titles[] = {};
		GRAD_delay = 3;
		GRAD_length = 15.5;
	};
};