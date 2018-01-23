PHONENUMBERS_HASH = [] call CBA_fnc_hashCreate;
PHONENUMBERS_ARRAY = [];


if (!GRAD_TELEPHONE_CELLTOWER_MODE) exitWith {};

// spawn the small towers more often
CELLTOWER_CLASSNAMES = [
	"Land_Communication_F",
	"Land_Communication_F",
	"Land_Communication_F",
	"Land_Communication_F",
	"Land_TTowerBig_1_F",
	"Land_TTowerBig_2_F"
];

// get native celltowers on maps
_nativeMapTowers = nearestObjects [[worldSize/2,worldSize/2],CELLTOWER_CLASSNAMES, worldSize];
ALL_CELLTOWERS = _nativeMapTowers;


/* create celltowers near settlements, because some maps might not have any */
if (GRAD_TELEPHONE_AUTO_SPAWN_CELLTOWERS) then {

	// get towns on map
	_towns = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital"], worldSize];

	// spawn celltowers at towns
	{
		_tower = [position _x, CELLTOWER_CLASSNAMES] call GRAD_telephone_fnc_cellTowerSpawn;
		
		ALL_CELLTOWERS = ALL_CELLTOWERS + [_tower];
		_towerKilledEH = _tower addMPEventHandler ["mpkilled", {
			if (isServer) then {
				ALL_CELLTOWERS = ALL_CELLTOWERS - [(_this select 0)];
				publicVariable "ALL_CELLTOWERS";
			};
		}]; 

	} forEach _towns;
};


// spawn markers on celltowers
{ 
	[_x] call GRAD_telephone_fnc_cellTowerMarkerCreate; 
}
forEach ALL_CELLTOWERS;
publicVariable "ALL_CELLTOWERS";