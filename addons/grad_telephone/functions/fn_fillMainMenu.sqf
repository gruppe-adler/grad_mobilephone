player setVariable ["GRAD_telephone_mainmenu",[
	[localize "$STR_GRAD_radio_UI_contacts"],
	[localize "$STR_GRAD_radio_UI_settings"]
]];



/* todo: refactoring here */

["scrolling_mainmenu",
	[
	localize "$STR_GRAD_radio_UI_contacts", 
		localize "$STR_GRAD_radio_UI_back", 
		localize "$STR_GRAD_radio_UI_select"
	], 
	[
	localize "$STR_GRAD_radio_UI_settings", 
		localize "$STR_GRAD_radio_UI_back", 
		localize "$STR_GRAD_radio_UI_select"
	]
];

["scrolling_settings", 
	[
	localize "$STR_GRAD_radio_UI_ringtones", 
		localize "$STR_GRAD_radio_UI_back", 
		localize "$STR_GRAD_radio_UI_select"
	], 
	[
	localize "$STR_GRAD_radio_UI_vibration", 
		localize "$STR_GRAD_radio_UI_back", 
		localize "$STR_GRAD_radio_UI_select"
	]
];

["scrolling_ringtones", 
	[
	"Nokia Default", 
		localize "$STR_GRAD_radio_UI_back", 
		localize "$STR_GRAD_radio_UI_select"
	], 
	[
	"Nokia Arabic", 
		localize "$STR_GRAD_radio_UI_back", 
		localize "$STR_GRAD_radio_UI_select"
	]
];