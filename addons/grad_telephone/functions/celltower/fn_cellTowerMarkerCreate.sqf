params ["_tower"];

_pos = getPos _tower;

_marker = createMarker [format["cellTowerMarker_%1",toString _pos],_pos];
diag_log format ["cellTowerMarker: Marker %1 created", _marker];
_marker setMarkerShape "ICON";
_marker setMarkerType "loc_transmitter";
_marker setMarkerAlpha 1;
_marker setMarkerColor "ColorGrey";

_marker